library(dplyr)

# Function to read an SPSS syntax file and extract variable and value labels
read_sps_labels <- function(file) {
  lines <- readLines(file, warn = FALSE)
  # Normalize curly quotes
  #lines <- gsub("[\u2018\u2019]", "''", lines)
  #lines <- gsub("[\u201C\u201D]", '""', lines)


  var_labels <- list()
  value_labels <- list()

  # ---- Extract VARIABLE LABELS ----
  for (i in 1:length(lines)) {
    line <- trimws(lines[i])
    # Match individual VARIABLE LABELS statements
    if (grepl("^VARIABLE\\s+LABELS\\s+", line, ignore.case = TRUE)) {
      # Remove the VARIABLE LABELS prefix
      content <- sub("^VARIABLE\\s+LABELS\\s+", "", line, ignore.case = TRUE)
      
      # Extract variable name (everything before the first quote)
      var_name <- trimws(sub("^([^'\"]+).*$", "\\1", content))
      
      # Extract the label text (everything between quotes)
      if (grepl("'", content)) {
        # Handle single quotes with proper apostrophe handling
        # Find position of first and last quote
        first_quote <- regexpr("'", content)[1]
        if (first_quote > 0) {
          quote_part <- substr(content, first_quote, nchar(content))
          # Parse quotes properly accounting for doubled apostrophes
          in_quote <- FALSE
          end_pos <- 0
          
          for (pos in 1:nchar(quote_part)) {
            char <- substr(quote_part, pos, pos)
            if (char == "'") {
              # Check if it's an escaped apostrophe (two consecutive apostrophes)
              if (pos < nchar(quote_part) && substr(quote_part, pos + 1, pos + 1) == "'") {
                # Skip the next one as it's part of the escape
                pos <- pos + 1
              } else {
                if (in_quote) {
                  end_pos <- pos
                  break
                } else {
                  in_quote <- TRUE
                }
              }
            }
          }
          
          if (end_pos > 0) {
            # Extract quoted part without outer quotes
            quoted_text <- substr(quote_part, 2, end_pos - 1)
            # Replace doubled apostrophes with single apostrophes
            var_label <- gsub("''", "'", quoted_text)
          } else {
            next  # Malformed quote
          }
        } else {
          next  # No quote found
        }
      } else if (grepl("\"", content)) {
        # Double quotes handling (same as before)
        var_label <- sub("^[^\"]*\"([^\"]*)\".*$", "\\1", content)
      } else {
        # No proper quotes found, skip
        next
      }
      
      var_labels[[var_name]] <- var_label
    }
  }

  # ---- Extract ADD VALUE LABELS ----
  in_val_block <- FALSE
  val_block_lines <- c()
  current_var <- NULL

  for (line in lines) {
    if (grepl("^\\s*ADD VALUE LABELS", line)) {
      in_val_block <- TRUE
      # Remove the command part and trim whitespace
      temp_line <- sub("^\\s*ADD VALUE LABELS", "", line)
      temp_line <- trimws(temp_line)
      # The first token should be the variable name.
      tokens <- strsplit(temp_line, "\\s+")[[1]]
      if (length(tokens) >= 1) {
        current_var <- tokens[1]
      }
      # Add any remaining content from the same line (which might start the parenthesis block)
      remaining <- paste(tokens[-1], collapse = " ")
      val_block_lines <- remaining
      if (grepl("\\.$", line)) {
        # Block complete on the same line
        full_block <- paste(val_block_lines, collapse = " ")
        full_block <- sub("\\.$", "", full_block)
        
        # Parse value labels properly with apostrophe handling
        mapping <- extract_value_label_pairs(full_block)
        
        value_labels[[current_var]] <- mapping
        in_val_block <- FALSE
        val_block_lines <- c()
        current_var <- NULL
      }
    } else if (in_val_block) {
      # Continue collecting the block until we see a line ending with a period
      val_block_lines <- c(val_block_lines, line)
      if (grepl("\\.$", line)) {
        full_block <- paste(val_block_lines, collapse = " ")
        full_block <- sub("\\.$", "", full_block)
        
        # Parse value labels properly with apostrophe handling
        mapping <- extract_value_label_pairs(full_block)
        
        value_labels[[current_var]] <- mapping
        in_val_block <- FALSE
        val_block_lines <- c()
        current_var <- NULL
      }
    }
  }

  return(list(
    var_labels = setNames(var_labels, tolower(names(var_labels))),
    value_labels = setNames(value_labels, tolower(names(value_labels)))
  ))
}

# Helper function to extract value-label pairs properly handling apostrophes
extract_value_label_pairs <- function(text) {
  # This function extracts value-label pairs from SPSS syntax,
  # properly handling apostrophes
  
  mapping <- c()
  remain <- trimws(text)
  
  while (nchar(remain) > 0) {
    # Find code (first quoted string)
    code_match <- extract_next_quoted_string(remain)
    if (is.null(code_match)) break
    
    code <- code_match$content
    remain <- trimws(substr(remain, code_match$end_pos + 1, nchar(remain)))
    
    # Find label (second quoted string)
    label_match <- extract_next_quoted_string(remain)
    if (is.null(label_match)) break
    
    label <- label_match$content
    remain <- trimws(substr(remain, label_match$end_pos + 1, nchar(remain)))
    
    # Add to mapping
    mapping[code] <- label
  }
  
  return(mapping)
}

# Helper function to extract the next quoted string from text
extract_next_quoted_string <- function(text) {
  if (!grepl("'", text)) return(NULL)
  
  # Find position of first quote
  first_quote <- regexpr("'", text)[1]
  if (first_quote <= 0) return(NULL)
  
  # Process the string character by character
  quote_part <- substr(text, first_quote, nchar(text))
  in_quote <- FALSE
  end_pos <- 0
  content <- ""
  
  pos <- 1
  while (pos <= nchar(quote_part)) {
    char <- substr(quote_part, pos, pos)
    
    if (char == "'") {
      # Check if it's an escaped apostrophe (two consecutive apostrophes)
      if (pos < nchar(quote_part) && substr(quote_part, pos + 1, pos + 1) == "'") {
        if (in_quote) {
          # Inside the quote, append a single apostrophe
          content <- paste0(content, "'")
        }
        # Skip the next apostrophe
        pos <- pos + 2
        next
      } else {
        if (in_quote) {
          # End of quote
          end_pos <- pos + first_quote - 1
          break
        } else {
          # Start of quote
          in_quote <- TRUE
          pos <- pos + 1
          next
        }
      }
    } else if (in_quote) {
      # Regular character inside quote
      content <- paste0(content, char)
    }
    
    pos <- pos + 1
  }
  
  if (end_pos > 0) {
    return(list(content = content, end_pos = end_pos))
  } else {
    return(NULL)  # Malformed quote
  }
}

# Function to apply the extracted labels to a data frame.
# It sets the "label" attribute for variables (if a variable label exists)
# and converts variables with value labels into factors so that the value labels
# are visible in the factor levels (check using levels() or str()).
apply_labels <- function(df, labels) {


  # Apply value labels: for each variable with a value label mapping,
  # convert that column into a factor so that the value labels are visible.
  for (var in names(labels$value_labels)) {
    df_col <- names(df)[tolower(names(df)) == var]
    if (length(df_col) == 1) {
      mapping <- labels$value_labels[[var]]
      df[[df_col]] <- factor(as.character(df[[df_col]]),
                             levels = names(mapping),
                             labels = mapping)
    }
  }

  # Apply variable labels as an attribute
  for (var in names(labels$var_labels)) {
    df_col <- names(df)[tolower(names(df)) == var]
    if (length(df_col) == 1) {
      attr(df[[df_col]], "label") <- labels$var_labels[[var]]
    }
  }

  return(df)
}

# Convenience function to read and apply labels from an SPS file
apply_labels_from_sps <- function(df, sps_file) {
  labels <- read_sps_labels(sps_file)
  return(apply_labels(df, labels))
}

# Function to convert character columns that contain only "true"/"false" (ignoring case)
# and NA values into logical columns.
convert_char_to_logical <- function(df) {
  for (col in names(df)) {
    if (is.character(df[[col]])) {
      # Get all unique values in lower case, excluding NA
      unique_vals <- unique(tolower(df[[col]]))
      unique_vals <- unique_vals[!is.na(unique_vals)]

      # If all non-NA values are either "true" or "false"
      if (length(unique_vals) > 0 && all(unique_vals %in% c("true", "false"))) {
        # Convert column: "true" becomes TRUE, "false" becomes FALSE, NA remains NA
        df[[col]] <- ifelse(tolower(df[[col]]) == "true", TRUE,
                            ifelse(tolower(df[[col]]) == "false", FALSE, NA))
      }
    }
  }
  return(df)
}

# Function to read an AppKit survey (CSV + SPS) from a directory,
# convert eligible character columns to logical, and apply variable and value labels.
read_appkit_survey <- function(survey_directory) {
  # Find the CSV file
  csv_files <- list.files(survey_directory, pattern = "\\.csv$", full.names = TRUE)

  if (length(csv_files) == 0) {
    stop("No CSV file found in the survey directory.")
  } else if (length(csv_files) > 1) {
    warning("Multiple CSV files found in the survey directory. Using the first one.")
  }

  survey_csv_path <- csv_files[1]

  # Read the CSV file
  survey_data <- read.csv(survey_csv_path, stringsAsFactors = FALSE, sep = ";")

  # Convert 'true'/'TRUE' and 'false'/'FALSE' strings to logical values
  survey_data <- convert_char_to_logical(survey_data)

  # Find the SPS file(s) and apply the labels if available
  sps_files <- list.files(survey_directory, pattern = "\\.sps$", full.names = TRUE)

  if (length(sps_files) == 0) {
    warning("No SPS file found in the survey directory. Variable and value labels will not be applied.")
    return(survey_data)
  } else if (length(sps_files) > 1) {
    warning("Multiple SPS files found in the survey directory. Using the first one.")
  }

  sps_file <- sps_files[1]

  return(apply_labels_from_sps(survey_data, sps_file))
}

# Function to read multiple surveys from a parent directory.
# Each subdirectory is assumed to contain one survey.
read_appkit_surveys <- function(surveys_directory) {
  survey_directories <- list.dirs(surveys_directory, full.names = TRUE, recursive = FALSE)
  surveys <- list()
  for (survey_directory in survey_directories) {
    # Create a survey name based on the CSV file name (with spaces replaced by underscores)
    survey_name <- basename(list.files(survey_directory, pattern = "\\.csv$", full.names = FALSE)) %>%
      sub("\\.csv$", "", .) %>%
      sub(" ", "_", .)

    survey_data <- read_appkit_survey(survey_directory)
    surveys[[survey_name]] <- survey_data
  }
  return(surveys)
}


#

#' Explore variables in a dataframe or a single variable
#'
#' @param data A dataframe or a single variable
#' @param max_unique Integer indicating the maximum number of unique values to display (default: 10)
#' @param max_width Integer indicating the maximum width for displaying unique values (default: 50)
#' @return A tibble-like display of variable information
#' @import cli
#' @export
explore_vars <- function(data, max_unique = 10, max_width = 50) {
  # Check if input is a dataframe or a single variable
  if (is.data.frame(data)) {
    # Process each variable in the dataframe
    results <- lapply(names(data), function(var_name) {
      process_variable(data[[var_name]], var_name, max_unique, max_width)
    })
    result_df <- do.call(rbind, results)

  } else {
    # Process a single variable
    var_name <- deparse(substitute(data))
    result_df <- process_variable(data, var_name, max_unique, max_width)
  }

  # Print with formatting
  cat("\n")
  cat(cli::rule(left = "Variable Explorer", col = "cyan", width = 80), "\n\n")

  # Print each row with formatting
  for (i in 1:nrow(result_df)) {
    cat(cli::col_cyan(paste0(result_df$var_name[i], ": ")))

    # Print variable label if it exists
    if (!is.na(result_df$var_label[i]) && result_df$var_label[i] != "") {
      cat(cli::style_italic(result_df$var_label[i]), "\n")
    } else {
      cat("<no label>\n")
    }

    # Print unique values
    cat("  Unique values: ", cli::col_grey(result_df$unique_values[i]), "\n")

    # Print value labels if they exist
    if (!is.na(result_df$value_labels[i]) && result_df$value_labels[i] != "") {
      cat("  Value labels: ", cli::col_grey(result_df$value_labels[i]), "\n")
    } else {
      cat("  Value labels: ", cli::col_grey("<none>"), "\n")
    }

    # Add separator between variables
    if (i < nrow(result_df)) {
      cat(cli::rule(col = "grey", width = 80), "\n")
    }
  }

  cat("\n", cli::rule(width = 80), "\n")

  # Return invisibly for potential further processing
  invisible(result_df)
}

#' Process a single variable and extract its information
#'
#' @param var The variable to process
#' @param var_name The name of the variable
#' @param max_unique Maximum number of unique values to display
#' @param max_width Maximum width for displaying unique values
#' @return A one-row dataframe with variable information
process_variable <- function(var, var_name, max_unique, max_width) {
  # Extract variable label (checking multiple common attribute names)
  var_label <- ""
  label_attrs <- c("label", "Label", "description", "Description", "var.label")
  for (attr_name in label_attrs) {
    if (!is.null(attr(var, attr_name))) {
      var_label <- attr(var, attr_name)
      break
    }
  }

  # Get unique values
  unique_vals <- unique(var)
  unique_vals <- unique_vals[!is.na(unique_vals)]

  # Format unique values for display
  if (length(unique_vals) > max_unique) {
    unique_text <- paste0(
      toString(head(unique_vals, max_unique)),
      " ... (", length(unique_vals), " total)"
    )
  } else {
    unique_text <- toString(unique_vals)
  }

  # Truncate if too long
  if (nchar(unique_text) > max_width) {
    unique_text <- paste0(substr(unique_text, 1, max_width), "...")
  }

  # Extract value labels (checking multiple common attribute names)
  value_labels <- ""
  label_attrs <- c("labels", "Levels", "value.labels", "values", "valueLabels")

  # First check for specific label attributes
  for (attr_name in label_attrs) {
    if (!is.null(attr(var, attr_name))) {
      labels <- attr(var, attr_name)
      if (is.null(names(labels))) {
        # If no names, create generic labels
        if (is.character(labels) || is.factor(labels)) {
          label_text <- paste(labels, collapse = ", ")
        } else {
          label_text <- paste(seq_along(labels), "=", labels, collapse = ", ")
        }
      } else {
        label_text <- paste(names(labels), "=", labels, collapse = ", ")
      }

      # Truncate if too long
      if (nchar(label_text) > max_width) {
        label_text <- paste0(substr(label_text, 1, max_width), "...")
      }

      value_labels <- label_text
      break
    }
  }

  # Handle factors separately, as they have levels but not necessarily a "labels" attribute
  if (value_labels == "" && is.factor(var)) {
    factor_levels <- levels(var)
    if (length(factor_levels) > 0) {
      level_text <- paste(seq_along(factor_levels), "=", factor_levels, collapse = ", ")

      # Truncate if too long
      if (nchar(level_text) > max_width) {
        level_text <- paste0(substr(level_text, 1, max_width), "...")
      }

      value_labels <- level_text
    }
  }

  # Create a one-row dataframe with the information
  data.frame(
    var_name = var_name,
    var_label = var_label,
    unique_values = unique_text,
    value_labels = value_labels,
    stringsAsFactors = FALSE
  )
}

# GESIS AppKit data export processing demo

This repository contains a demo for processing GESIS AppKit data exports in R. The demo includes code to read, clean, and analyze survey data exported from the GESIS AppKit. The main content can be found in 


## Setup for Code-along

To prepare for the code-along part of the workshop in advance, you can already install all required packages in R / RStudio:

```
# List of required packages
packages <- c("ggplot2",
              "anytime",
              "dplyr",
              "psych",
              "corrplot",
              "cli",
              "lubridate",
              "tidyverse",
              "ggpubr")

# Check if each package is installed and install if missing
for (package in packages) {
  if (!require(package, character.only = TRUE, quietly = TRUE)) {
    message(paste("Installing package:", package))
    install.packages(package, repos = "https://cloud.r-project.org/")
    library(package, character.only = TRUE)
  } else {
    message(paste("Package", package, "is already loaded"))
  }
}

message("All required packages are now installed and loaded")

```


## Additional Materials

All information about the GESIS AppKit: [https://www.gesis.org/gesis-appkit](https://www.gesis.org/gesis-appkit)

GESIS AppKit Mailing List: [https://lists.gesis.org/mailman/listinfo/gesis-appkit](https://lists.gesis.org/mailman/listinfo/gesis-appkit)

Manual for the GESIS Appkit: [https://appkit.gesis.org/manual/](https://appkit.gesis.org/manual/)

Login Page for the GESIS AppKit: [https://admin.appkit.gesis.org/login](https://admin.appkit.gesis.org/login)

GESIS SMART App (Android): [https://play.google.com/store/apps/details?id=com.surveyAppKit&hl=de&pli=1](https://play.google.com/store/apps/details?id=com.surveyAppKit&hl=de&pli=1) 

GESIS SMART App (iOS): [https://apps.apple.com/de/app/gesis-smart/id6479244351](https://apps.apple.com/de/app/gesis-smart/id6479244351)

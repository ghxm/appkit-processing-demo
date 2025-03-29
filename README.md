# General Online Research Conference 2025 - AppKit Workshop

## Overview
The repository contains all materials for the [workshop](https://www.conftool.org/gor25/index.php?page=browseSessions&form_session=85&presentations=show) on the GESIS AppKit at the [GOR conference 2025](https://www.gor.de/) in Berlin.
The goal if the workshop is to make participants familiar with creating an account, setting up a study, collecting data
and analyzing data with the GESIS AppKit.

## Required Materials:

To participate in the workshop, you will need:

- A Laptop with Internet connection
- An Android or iOS Smartphone
- RStudio installed on your Laptop
- Same basic experience with R

## Schedule

| Time           | Activity                                                  |
|----------------|-----------------------------------------------------------|
| 13:30 – 13:45  | Welcome & Intro                                           |
| 13:45 – 14:00  | Setting the scene: Smartphones as research tool           |
| 14:00 – 14:15  | Introducing the GESIS AppKit                              |
| 14:15 – 14:30  | Developing your project / GESIS AppKit use case           |
| 14:30 – 14:45  | Coffee Break                                              |
| 14:45 – 15:00  | Live-Demo: How to use the GESIS AppKit                    |
| 15:00 – 15:40  | Implementing your project                                 |
| 15:40 – 15:50  | Short Break                                               |
| 15:50 – 16:20  | Working with GESIS AppKit data                            |
| 16:20 – 16:30  | Recap & Outlook                                           |


## Additional Materials

All information about the GESIS AppKit: [https://www.gesis.org/gesis-appkit](https://www.gesis.org/gesis-appkit)

GESIS AppKit Mailing List: [https://lists.gesis.org/mailman/listinfo/gesis-appkit](https://lists.gesis.org/mailman/listinfo/gesis-appkit)

Manual for the GESIS Appkit: [https://appkit.gesis.org/manual/](https://appkit.gesis.org/manual/)

Login Page for the GESIS AppKit: [https://admin.appkit.gesis.org/login](https://admin.appkit.gesis.org/login)

GESIS SMART App (Android): [https://play.google.com/store/apps/details?id=com.surveyAppKit&hl=de&pli=1](https://play.google.com/store/apps/details?id=com.surveyAppKit&hl=de&pli=1) 

GESIS SMART App (iOS): [https://apps.apple.com/de/app/gesis-smart/id6479244351](https://apps.apple.com/de/app/gesis-smart/id6479244351)


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


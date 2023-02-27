# Cailin_Pillay
# 22/02/2023
# Script_to_scrape_classcentral_website_1_level_deep

install.packages("googleLanguageR")

library(googleLanguageR)

# Set working directory to Class_Central_R directory
setwd("path/to/Class_Central_R")

# Set httrack options
httrack_opts <- "--mirror --convert-links --html-extension --extended-parsing --verbose"

# Set target URL and output directory
url <- "https://www.classcentral.com/"
output_dir <- "classcentral"

# Execute httrack command
httrack_command <- paste0("httrack ", httrack_opts, " ", url, " -O ", output_dir)
system(httrack_command)

# Translate website using googleLanguageR
translate_html_files(output_dir, "hi")

gl_translate(file_list, target = "hi")$translatedText


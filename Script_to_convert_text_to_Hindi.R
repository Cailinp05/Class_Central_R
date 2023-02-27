# Cailin_Pillay
# 22/02/2023
# Script_to_convert_text_to_Hindi

library(tidyverse)
library(rvest)
library(googleLanguageR)

install.packages("googleLanguageR")

translate_html_to_hindi <- function(html_files) {
  # Get all files in the directory with .html extension
  html_files <- list.files(html_files, pattern = "\\.html$", full.names = TRUE)
  
  # Loop through each HTML file
  for (file in html_files) {
    # Scrape the text from the file
    text <- read_html(file) %>% html_text()
    
    # Translate the text to Hindi
    hindi_text <- translate(text, target = "hi")
    
    # Save the translated text to a new file with the same name as the original file
    new_file <- sub("\\.html$", "_hindi.html", file)
    writeLines(hindi_text, new_file)
  }
}

translate_html_to_hindi("/path/to/directory")

html_files <- translate_text(text, target = "hi")



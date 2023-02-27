library(tidyverse)

# Set your directory path
dir_path <- "C:/Users/CAILIN/OneDrive/Documents/Class_Central_R"

script <- readLines("C:/Users/CAILIN/OneDrive/Documents/Class_Central_R/script.js")

# Create a list to store all the files
file_list <- list()

# Recursively list all files in the directory and its subdirectories
for (filename in list.files(dir_path, recursive = TRUE)) {
  
  # Check if the file extension is either .html, .css or .js
  if (endsWith(filename, ".html") || 
      endsWith(filename, ".css") || 
      endsWith(filename, ".js")) {
    
    # Read the file content and add it to the list
    file_content <- readLines(file.path(dir_path, filename))
    file_list[[filename]] <- file_content
  }
}

# Print the list of files
print(file_list)



# methods -----------------------------------------------------------------


library(httr)
library(jsonlite)

# Set your directory path
dir_path <- "C:/Users/CAILIN/OneDrive/Documents/Class_Central_R"
getwd()
# Set your API key and URL
api_key <- "AIzaSyDOd3eMriKHmUWZq-XsQ-3X62lyfBuz7XE"
translate_url <- "https://translation.googleapis.com/language/translate/v2"

script <- readLines("C:/Users/CAILIN/OneDrive/Documents/Class_Central_R/script.js")
style <- readLines("C:/Users/CAILIN/OneDrive/Documents/Class_Central_R/style.css")
index <- readLines("C:/Users/CAILIN/OneDrive/Documents/Class_Central_R/index.html")

translated_file_list <- list(script, style, index)
# Create a list to store all the translated files
translated_file_list <- list()

# Recursively list all files in the directory and its subdirectories
for (filename in list.files(dir_path, recursive = TRUE)) {
  
  # Check if the file extension is either .html, .css or .js
  if (endsWith(filename, ".html") || 
      endsWith(filename, ".css") || 
      endsWith(filename, ".js")) {
    
    # Read the file content and add it to the list
    file_content <- readLines(file.path(dir_path, filename))
    
    # Translate the file content to Hindi using the Google Translate API
    translate_params <- list(q = file_content, source = "en", target = "hi", key = api_key)
    translate_response <- POST(translate_url, body = toJSON(translate_params), add_headers("Content-Type" = "application/json"))
    translated_content <- fromJSON(rawToChar(translate_response$content))$data$translations$translatedText
    
    # Add the translated file content to the list
    translated_file_list[[filename]] <- translated_content
  }
}

# Print the list of translated files
print(translated_file_list)


# One file ----------------------------------------------------------------



# js to hini

jstohindi <- "C:/Users/CAILIN/OneDrive/Documents/Class_Central_R/jstohindi"

# Install the translateR package
install.packages("translateR")

# Load the translateR package
library(translateR)

# Read in the script.js file
script <- readLines("C:/Users/CAILIN/OneDrive/Documents/Class_Central_R/script.js")

# Translate the script to Hindi
translated_script <- translate(text = script, to = "hi")

# Write the translated script to a file
writeLines(translated_script, "path/to/translated_script.js")


# Method ------------------------------------------------------------------


library(httr)
library(jsonlite)

# Define your subscription key and endpoint
subscription_key <- "your_subscription_key"
endpoint <- "https://api.cognitive.microsofttranslator.com"

# Define the input and output languages
input_lang <- "en"
output_lang <- "hi"

# Read the contents of the script.js file
file_contents <- readLines("script.js")

# Define the API request body
request_body <- list(text = file_contents, to = output_lang)

# Send the API request
response <- httr::POST(paste0(endpoint, "/translate?api-version=3.0&to=", output_lang),
                       httr::add_headers(Authorization = paste("Bearer", subscription_key)),
                       httr::content_type("application/json"),
                       body = toJSON(request_body))

# Parse the API response
translated_text <- fromJSON(content(response, "text"))[[1]]$translations[[1]]$text

# Print the translated text
cat(translated_text, "\n")


# Method2  ----------------------------------------------------------------


library(googleCloudR)
library(googleCloudRunner)
library(googleCloudVisionR)
library(googleCloudStorageR)
# Set up authentication with OAuth 2.0 Client IDs
set_token("876274417957-k7hm219194qirrscstn6nnu7ah82ltnl.apps.googleusercontent.com")

# Read the script.js file
file_path <- "path/to/script.js"
script_text <- readLines(file_path, encoding = "UTF-8")

# Translate the script to Hindi
translated_text <- translate_text(script_text, target = "hi")

# Write the translated script to a file
writeLines(translated_text, file = "path/to/translated_script.js")

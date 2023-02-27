# set the working directory to the location of the Classcentral2 folder
setwd("path/to/Class_Central_R")

# get a list of all HTML files in the directory
html_files <- list.files(pattern = ".html$")

# loop through each file and translate its content to Hindi
for (file in html_files) {
  # read the file content
  html <- readLines(file, encoding = "UTF-8")
  
  # use a language translation package (e.g., Google Translate API) to translate the content
  # into Hindi language
  
  # write the translated content back to the file
  writeLines(translated_html, file, encoding = "UTF-8")
}



# Another method ----------------------------------------------------------
# Step 1: Load the required packages
library(rvest)
library(stringr)

# Step 2: Define the URL
url <- "https://www.classcentral.com/"

# Step 3: Send a GET request to the URL and extract the HTML content
webpage <- read_html(url)

# Step 4: Extract the text content of the course titles from the HTML structure
course_titles <- webpage %>% html_nodes(".course-name") %>% html_text()

# Step 5: Convert the extracted text from English to Hindi using the iconv function
course_titles_hindi <- iconv(course_titles, from = "ISO-8859-1", to = "UTF-8")

# Step 6: Hard code the translated text into the page
cat(course_titles_hindi)


# Method 2 ----------------------------------------------------------------

# Install the required packages
install.packages("translateR")

# Load the required packages
library(translateR)

# Set the directory path
dir_path <- "path/to/classcentral2"

# Get a list of all HTML files in the directory
file_list <- list.files(dir_path, pattern = ".html$", full.names = TRUE)

# Loop through each file and translate it to Hindi
for (file in file_list) {
  # Read the HTML file
  html <- readLines(file)
  
  # Translate the HTML to Hindi
  hindi <- translate(html, to = "hi")
  
  # Write the translated Hindi to a new file in the same directory
  new_file <- paste0(file, ".hi.html")
  writeLines(hindi, new_file)
}


# Method4 -----------------------------------------------------------------

library(googleLanguageR)

# Get current working directory
dir_path <- getwd()

# Get list of all HTML files in directory
html_files <- list.files("classcentral2", pattern = ".html$", full.names = TRUE)

# Loop through each file and translate English text to Hindi
for (file in html_files) {
  # Read file contents
  file_contents <- readLines(file)
  
  # Identify English text using regular expression
  english_text <- grep("[a-zA-Z]+", file_contents, value = TRUE)
  
  # Translate English text to Hindi using Google Translate API
  hindi_text <- translate_text(english_text, target = "hi")
  
  # Replace English text with Hindi text in file contents
  file_contents <- gsub(english_text, hindi_text$translatedText, file_contents)
  
  # Write updated file contents back to file
  writeLines(file_contents, file)
}


# method5 -----------------------------------------------------------------

# Install and load necessary packages
install.packages("rvest")
install.packages("httr")
library(rvest)
library(httr)

# Define the API key and the target language
api_key <- "AIzaSyDx24FsTkygRAYs-AFaqdSJIBiKpj-Dhkw"
target_lang <- "hi" # Hindi

# Set the path to the directory containing the HTML files
dir_path <- "path/to/directory/classcentral2/final"

# Get the list of all HTML files in the directory
file_list <- list.files(dir_path, pattern = "\\.html$")

# Loop through each file and translate its text
for (file_name in file_list) {
  # Download the HTML file using wget
  url <- paste0("file://", file.path(dir_path, file_name))
  system(paste0("wget ", url))
  
  # Read the downloaded file into R using rvest
  html <- read_html(file_name)
  
  # Extract the text from the HTML file
  text <- html_text(html)
  
  # Translate the text using the API key and httr package
  translation <- httr::POST(
    url = "https://translation.googleapis.com/language/translate/v2",
    add_headers(`Content-Type` = "application/json"),
    body = list(q = text, target = target_lang, key = api_key)
  )
  
  # Extract the translated text from the API response
  translated_text <- content(translation, as = "parsed")$data$translations$text
  
  # Write the translated text to a new file
  new_file_name <- paste0(file_path_sans_ext(file_name), "_", target_lang, ".html")
  write_html(html_nodes(html, "html"), new_file_name)
}


# olkjhgkjbhnv ---------------------------------------------------------------

# set the working directory to the root directory of your files
setwd("/path/to/root/directory")

# list all HTML and CSS files in all directories
file_list <- list.files(pattern = "\\.html$", recursive = TRUE)

system(httrack_command)

# print the list of files
print(file_list)

translate_html_files(output_dir, "hi")


# Method6  ----------------------------------------------------------------
# load the googleLanguageR package
library(googleLanguageR)

# set the working directory to the root directory of your files
setwd("/path/to/root/directory")

# list all HTML and CSS files in all directories
file_list <- list.files(pattern = "\\.html$|\\.css$", recursive = TRUE)

# loop through the file list and translate each file to Hindi
for (file in file_list) {
  # read in the file contents
  file_contents <- readLines(file, encoding = "UTF-8")
  
  # translate the file contents to Hindi
  hindi_translation <- translate(text = file_contents, source = "en", target = "hi")
  
  # write the translated contents to a new file
  hindi_file_name <- paste0(file, "_hi.html")
  writeLines(hindi_translation, hindi_file_name, encoding = "UTF-8")
}


library(googleLanguageR)

text <- "to administer medicince to animals is frequently a very difficult matter, and yet sometimes it's necessary to do so"
## translate British into Danish
gl_translate(text, target = "hi")$translatedText

# translate webpages
library(rvest)
library(googleLanguageR)

my_url <- "https://www.classcentral.com/"

## in this case the content to translate is in css select .wcms-article-content
read_html(my_url) %>% # read html
  html_node(css = ".wcms-article-content") %>%   # select article content
  html_text %>% # extract text
  gl_translate(format = "html") %>% # translate with html flag
  dplyr::select(translatedText) # show translatedText column of output tibble



# method7 -----------------------------------------------------------------


# Install the translateR package if you haven't already
install.packages("translateR")

# Load the translateR package
library(translateR)

# Set your Google Translate API key
translateR_key("[YOUR_API_KEY]")

# Define the folder path where your HTML and CSS files are stored
folder_path <- "/path/to/folder"

# Get a list of all HTML and CSS files in the folder
file_list <- list.files(path = folder_path, pattern = "\\.html$|\\.css$")

# Loop through each file and translate the contents
for (file in file_list) {
  # Read the file contents
  file_contents <- readLines(paste(folder_path, file, sep = "/"), warn = FALSE)
  
  # Translate the contents to Hindi
  translated_text <- translate(file_contents, "en", "hi")
  
  # Write the translated contents back to the file
  writeLines(translated_text, paste(folder_path, file, sep = "/"))
}


# method 8 ----------------------------------------------------------------


library(httr)
library(xml2)

# Set your Google Translate API key
api_key <- "[AIzaSyDK2fkjyotpI_Uwf8eVbEIxKqwApWhuEoA]"

# Define the folder path where your HTML and CSS files are stored
folder_path <- "path/to/classcentral2/final"

# Get a list of all HTML and CSS files in the folder
file_list <- list.files(path = folder_path, pattern = "\\.html$|\\.css$")

# Loop through each file and translate the contents
for (file in file_list) {
  # Read the file contents
  file_contents <- readLines(paste(folder_path, file, sep = "/"), warn = FALSE)
  
  # Create the HTTP request
  translate_url <- "https://translation.googleapis.com/language/translate/v2"
  headers <- c("Content-Type" = "application/x-www-form-urlencoded")
  data <- list(key = api_key,
               source = "en",
               target = "hi",
               q = file_contents)
  response <- POST(translate_url, add_headers(headers), body = data, encode = "form")
  
  # Parse the response
  translated_text <- xml2::xml_find_first(response$content, "//translatedText") %>% xml2::xml_text()
  
  # Write the translated contents back to the file
  writeLines(translated_text, paste(folder_path, file, sep = "/"))
}

library(deeplr)
install.packages("RYandexTranslate")

library(devtools)
install_github("mukul13/RYandexTranslate")


# Method 9 ----------------------------------------------------------------


library(curl)

# Define the website URL
url <- "https://www.classcentral.com/"

# Download the HTML, CSS, and JavaScript files from the website
html_file <- curl_download(url, "index.html")
css_file <- curl_download(url, "style.css")
js_file <- curl_download(url, "script.js")

# Read the contents of the HTML file
html_content <- readLines(html_file)

# Define a function to translate text using the Google Translate API
translate_text <- function(text, source_language = "en", target_language = "hi") {
  # Define the Google Translate API URL
  api_url <- "https://translate.googleapis.com/translate_a/single?client=gtx&sl=%s&tl=%s&dt=t&q=%s"
  
  # Encode the text for the API URL
  encoded_text <- curl_escape(text)
  
  # Construct the API URL with the encoded text and source/target languages
  api_url <- sprintf(api_url, source_language, target_language, encoded_text)
  
  # Make a GET request to the API URL
  response <- curl(api_url)
  
  # Extract the translated text from the response
  translated_text <- jsonlite::fromJSON(response)$sentences[[1]]$trans
  
  return(translated_text)
}

# Translate the contents of the HTML file from English to Hindi
translated_html_content <- sapply(html_content, function(x) translate_text(x, source_language = "en", target_language = "hi"))

# Print the translated HTML content
cat(translated_html_content)


# Method 10  --------------------------------------------------------------
#' wget download a file from internet and save it locally
#' @title Download a file from internet and save it locally
#' @author Marc Girondot
#' @return Nothing
#' @param url The url where to download file
#' @param ... The parameters send to download.file()
#' @description Download a file from internet and save it locally. This function is a wrapper for
#' download.files() that keep the name identical and can get several files at once. It was written to simplify 
#' downloading of file. It doest not use the true wget function (https://www.gnu.org/software/wget/) which is 
#' much more complex but also powerful.
#' @examples
#' \dontrun{
#' library(HelpersMG)
#' # Save locally the files send in the parameter url
#' wget(c("https://cran.r-project.org/web/packages/HelpersMG/HelpersMG.pdf", 
#'          "https://cran.r-project.org/web/packages/embryogrowth/embryogrowth.pdf"))
#' }
#' @export


wget <- function(url=stop("At least one internet adress is required"), ...) {
  for (i in 1:length(url))
    do.call(download.file, modifyList(list(url=url[i], destfile=basename(url[i])), list(...)))
}


library(wget)
library(curl)

# Define the website URL
url <- "https://www.classcentral.com/"

# Download the HTML, CSS, and JavaScript files from the website
wget(url, recursive = TRUE)

# Define a function to translate text using the Google Translate API
translate_text <- function(text, source_language = "en", target_language = "hi") {
  # Define the Google Translate API URL
  api_url <- "https://translate.googleapis.com/translate_a/single?client=gtx&sl=%s&tl=%s&dt=t&q=%s"
  
  # Encode the text for the API URL
  encoded_text <- curl_escape(text)
  
  # Construct the API URL with the encoded text and source/target languages
  api_url <- sprintf(api_url, source_language, target_language, encoded_text)
  
  # Make a GET request to the API URL
  response <- curl(api_url)
  
  # Extract the translated text from the response
  translated_text <- jsonlite::fromJSON(response)$sentences[[1]]$trans
  
  return(translated_text)
}

# Define a function to translate text in a file
translate_file <- function(file_path, source_language = "en", target_language = "hi") {
  # Read the contents of the file
  file_content <- readLines(file_path)
  
  # Translate the contents of the file from English to Hindi
  translated_file_content <- sapply(file_content, function(x) translate_text(x, source_language, target_language))
  
  # Write the translated contents to the file
  writeLines(translated_file_content, file_path)
}

# Translate the contents of all HTML, CSS, and JavaScript files in the current directory from English to Hindi
files <- list.files(pattern = "\\.html$|\\.css$|\\.js$")
for (file in files) {
  translate_file(file, source_language = "en", target_language = "hi")
}

gl_translate(files, target = "hi")$translatedText


# Method11 ----------------------------------------------------------------

library(httr)
output_dir <- "C:/Users/CAILIN/OneDrive/Documents/Class_Central_R/classcentral2"
translate_hindi <- function(url, output_dir) {
  # download the website using httrack
  httrack_cmd <- paste("httrack", url, "-O", output_dir, "-N1", "-%v")
  system(httrack_cmd)
  
  # get a list of all HTML files in the directory
  html_files <- list.files(output_dir, pattern = ".html$", full.names = TRUE)
  
  # loop through each file and translate its content to Hindi
  for (file in html_files) {
    # read the file content
    html <- readLines(file, encoding = "UTF-8")
    
    # use a language translation API (e.g., Google Translate API) to translate the content into Hindi
    # Note: you would need to obtain an API key for the language translation service and use it in this function
    # You can use the httr package to make the API request
    # Here's an example of how to translate the content using the Google Translate API:
    api_url <- "https://translation.googleapis.com/language/translate/v2"
    api_key <- "https://translate.googleapis.com/translate_a/single?client=gtx&sl=%s&tl=%s&dt=t&q=%s"
    response <- POST(api_url,
                     body = list(q = html, source = "en", target = "hi", key = api_key),
                     encode = "json")
    translated_html <- content(response, "text", encoding = "UTF-8")
    
    # write the translated content back to the file
    writeLines(translated_html, file, encoding = "UTF-8")
  }
}


translate_hindi("https://www.classcentral.com/", "path/to/output/directory")



# get all characters pagination example
resp <- httr::GET("https://rickandmortyapi.com/api/character",
                  query = list("page" = 25))

# get all locations
resp_loc <- httr::GET("https://rickandmortyapi.com/api/location")

# get all episodes
resp_ep <- httr::GET("https://rickandmortyapi.com/api/episode")

# error checks and parsing to be passed to API call function
if (httr::http_type(resp) != "application/json") {
  stop("API did not return json", call. = FALSE)
}

if (httr::http_error(resp) == TRUE) {
  warning("The request failed")
} else {
  parsed_content <- jsonlite::fromJSON(httr::content(resp,
                                               as = "text",
                                               encoding = "UTF-8"
  ),
  flatten = TRUE
  )

  tibbled_content <- tibble::as_tibble(parsed_content$results)

  return(tibbled_content)
}

# To return complete tibbles
# ===========================
# for pagination, can either: (1) pass content(resp)$info$`next` back into a
# GET request and iterate through until content(resp)$info$`next`[1] == "" or
# (2) create loop iterates over 1:content(resp)$info$pages making a GET request
# with a different query = list("page" = 25) at each stage.

# To return single pages etc.
# ============================
# Should mortyr allow users to query all functionalities of the Rick and Morty
# API? Given the small size of the data sets, does it not make more sense to
# automate the process of iterating through all the pages and return one data
# set for each endpoint. The exploration of data can take place in R using tools
# such as dplyr?

# Make note of rate limit

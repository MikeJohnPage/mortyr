# Get all characters
get_characters <- function() {

  # GET and parse first page of results
  resp <- httr::GET("https://rickandmortyapi.com/api/character")
  all_chars <- parse_resp(resp)

  # GET and parse all remaining pages, appending to all_chars tibble
  while(httr::content(resp)$info$`next` != ""){

    resp <- httr::GET(paste(httr::content(resp)$info$`next`))

    next_page <- parse_resp(resp)

    all_chars <- rbind(all_chars, next_page)

  }

  return(all_chars)

}

# Get all locations
get_locations <- function() {

  # GET and parse first page of results
  resp <- httr::GET("https://rickandmortyapi.com/api/location")
  all_locs <- parse_resp(resp)

  # GET and parse all remaining pages, appending to all_chars tibble
  while(httr::content(resp)$info$`next` != ""){

    resp <- httr::GET(paste(httr::content(resp)$info$`next`))

    next_page <- parse_resp(resp)

    all_locs <- rbind(all_locs, next_page)

  }

  return(all_locs)

}

# Get all episodes
get_episodes <- function() {

  # GET and parse first page of results
  resp <- httr::GET("https://rickandmortyapi.com/api/episode")
  all_eps <- parse_resp(resp)

  # GET and parse all remaining pages, appending to all_chars tibble
  while(httr::content(resp)$info$`next` != ""){

    resp <- httr::GET(paste(httr::content(resp)$info$`next`))

    next_page <- parse_resp(resp)

    all_eps <- rbind(all_eps, next_page)

  }

  return(all_eps)

}

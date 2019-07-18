#' Get characters
#'
#' \code{get_characters} returns a tibble of all the characters from the
#' `character` endpoint of
#' \href{https://rickandmortyapi.com/documentation/#character}{The Rick and Morty API}.
#' This information includes:
#' \itemize{
#'   \item id
#'   \item name
#'   \item status
#'   \item species
#'   \item type
#'   \item gender
#'   \item image
#'   \item episode
#'   \item url
#'   \item created
#'   \item origin.name
#'   \item origin.url
#'   \item location.name
#'   \item location.url
#' }
#'
#' @examples
#' \donttest{
#' get_characters()
#' }
#'
#' @export

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

#' Get locations
#'
#' \code{get_locations} returns a tibble of all the locations from the
#' `location` endpoint of
#' \href{https://rickandmortyapi.com/documentation/#location}{The Rick and Morty API}.
#' This information includes:
#' \itemize{
#'   \item id
#'   \item name
#'   \item type
#'   \item dimension
#'   \item residents
#'   \item url
#'   \item created
#' }
#'
#' @examples
#' \donttest{
#' get_locations()
#' }
#'
#' @export

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

#' Get episodes
#'
#' \code{get_episodes} returns a tibble of all the episodes from the
#' `episode` endpoint of
#' \href{https://rickandmortyapi.com/documentation/#episode}{The Rick and Morty API}.
#' This information includes:
#' \itemize{
#'   \item id
#'   \item name
#'   \item air_date
#'   \item episode
#'   \item characters
#'   \item url
#'   \item created
#' }
#'
#' @examples
#' \donttest{
#' get_episodes()
#' }
#'
#' @export

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

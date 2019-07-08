# Define api parse function
parse_resp <- function(resp) {

  if (httr::http_type(resp) != "application/json") {
    stop("API did not return json",
         call. = FALSE)
  }

  if (httr::http_error(resp) == TRUE) {
    stop("The request failed")
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

}

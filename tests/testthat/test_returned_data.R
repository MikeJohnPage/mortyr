characters <- get_characters()
locations <- get_locations()
episodes <- get_episodes()

test_that("tibbles are returned", {
  expect_type(characters, "list")
  expect_type(locations, "list")
  expect_type(episodes, "list")
  expect_true(tibble::is_tibble(characters))
  expect_true(tibble::is_tibble(locations))
  expect_true(tibble::is_tibble(episodes))
})

test_that("tibbles are not empty", {
  expect_gt(nrow(characters), 0)
  expect_gt(nrow(locations), 0)
  expect_gt(nrow(episodes), 0)
  expect_gt(ncol(characters), 0)
  expect_gt(ncol(locations), 0)
  expect_gt(ncol(episodes), 0)
})

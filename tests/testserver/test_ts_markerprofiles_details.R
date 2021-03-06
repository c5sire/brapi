context("ts markerprofiles_details")

con <- ba_db()$testserver

test_that("  are present", {

  res <- ba_markerprofiles_details(con = con, markerprofileDbId = "mp1" )
  expect_that(nrow(res) == 22, is_true())

})

test_that("  out formats work", {

  res <- ba_markerprofiles_details(con = con, markerprofileDbId = "mp1", rclass = "json")
  expect_that("json" %in% class(res), is_true())

  res <- ba_markerprofiles_details(con = con, markerprofileDbId = "mp1", rclass = "list")
  expect_that("list" %in% class(res), is_true())

  res <- ba_markerprofiles_details(con = con, markerprofileDbId = "mp1", rclass = "data.frame")
  expect_that("data.frame" %in% class(res), is_true())

})

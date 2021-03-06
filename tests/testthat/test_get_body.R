context("get_body")


test_that("Parameters work", {

  expect_true({
    class(brapi:::get_body()) ==  "list"
  })

  expect_true({
    brapi:::get_body(x = "x")$x ==  "x"
  })

  expect_true({
    class(brapi:::get_body(x = "")) ==  "list"
  })

  expect_true({
    class(brapi:::get_body(x = NULL)) ==  "list"
  })

  expect_true({
    class(brapi:::get_body(x = NA)) ==  "list"
  })

  expect_true({
    all(brapi:::get_body(x = 1:3)$x == 1:3)
  })

})

context("get_body usage")

con <- ba_db()$testserver

expect_true({
  nrow(ba_germplasm_search_post(con, germplasmDbIds = c("1", "2"))) > 1
})



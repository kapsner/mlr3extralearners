library(mlr3extralearners)
install_learners("regr.earth")

test_that("regr.earth", {
  learner = lrn("regr.earth")
  fun = earth:::earth.default
  exclude = c(
    "x", # handled internally
    "y", # handled internally
    "subset", # handled internally
    "weights", # handled internally
    "na.action", # only one option
    "glm" # handled internally
  )

  ParamTest = run_paramtest(learner, fun, exclude)
  expect_true(ParamTest, info = paste0("Missing parameters:",
    paste0("- '", ParamTest$missing, "'", collapse = "")))
})

test_that("regr.earth predict", {
  learner = lrn("regr.earth")
  fun = earth:::predict.earth
  exclude = c(
    "object", # handled internally
    "newdata", # handled internally
    "type", # handled internally
    "level", # unused
    "interval" # handled internally
  )

  ParamTest = run_paramtest(learner, fun, exclude)
  expect_true(ParamTest, info = paste0("\nMissing parameters:\n",
                                       paste0("- '", ParamTest$missing, "'", collapse = "\n")))
})

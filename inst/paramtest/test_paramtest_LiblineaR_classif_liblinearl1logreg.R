library(mlr3extralearners)
install_learners("classif.liblinearl1logreg")

test_that("classif.liblinearl1logreg", {
  learner = lrn("classif.liblinearl1logreg")
  fun = LiblineaR::LiblineaR
  exclude = c(
    "data", # handled by mlr3
    "target", # handled by mlr3
    "type", # determined by the chosen learner
    "svr_eps" # only for regression
  )

  ParamTest = run_paramtest(learner, fun, exclude)
  expect_true(ParamTest, info = paste0(
    "
Missing parameters:
",
    paste0("- '", ParamTest$missing, "'", collapse = "
")))
})

# Master script to execute all tests for the functions. Outputs located in test-output.txt.

library('testthat')
functions <- dir('../code/functions')
lapply(paste0('../code/functions/', functions), source)
sink(file = 'test-output.txt')
test_dir('../code/tests')
sink()

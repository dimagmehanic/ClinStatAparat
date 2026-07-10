cwd <- getwd()
name <- "02-Simple-Linear-Regression"

tryCatch({
  setwd(file.path(cwd, "HandBook", "in_progress"))
  rmarkdown::render(input = paste0(name, ".Rmd") )
}, error = function(e) {
  message("Book rendering failed: ", e$message)
}, finally = {
  setwd(cwd)
  browseURL(file.path(cwd, "HandBook", "in_progress", paste0(name, ".html")))
})

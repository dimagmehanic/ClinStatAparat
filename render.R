cwd <- getwd()

tryCatch({

  setwd(file.path(cwd, "HandBook"))
  
  bookdown::render_book(
    input = "index.Rmd",
    output_format = "bookdown::gitbook"
  )

}, error = function(e) {
  message("Book rendering failed: ", e$message)
  
}, finally = {
  setwd(cwd)
})

# browseURL("HandBook/docs/index.html")

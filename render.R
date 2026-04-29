cwd <- getwd()
setwd(file.path(cwd, "HandBook"))
bookdown::render_book( input = "index.Rmd", output_format = "bookdown::gitbook") # nolint
setwd(cwd)
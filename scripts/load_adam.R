library(pharmaverseadam)

dataset_names <- data(package = "pharmaverseadam")$results[, "Item"]

adam <- set_names(
  map(dataset_names, function(nm) {
    function() {
      data(list = nm, package = "pharmaverseadam")
      get(nm)
    }
  }),
  dataset_names
)

rm(dataset_names)
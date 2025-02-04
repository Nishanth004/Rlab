inventory <- list()

add_item <- function(name, qty) {
  inventory[[name]] <<- qty
  cat("Item added.\n")
}

update_quantity <- function(name, qty) {
  if (name %in% names(inventory)) {
    inventory[[name]] <<- qty
    cat("Quantity updated.\n")
  } else cat("Item not found.\n")
}

display_inventory <- function() {
  cat("\nInventory:\n")
  for (name in names(inventory)) cat(name, ":", inventory[[name]], "\n")
}

repeat {
  cat("\n1. Add 2. Update 3. Display 4. Exit\n")
  choice <- as.integer(readline("Choice: "))
  
  if (choice == 1) add_item(readline("Item: "), as.integer(readline("Qty: ")))
  else if (choice == 2) update_quantity(readline("Item: "), as.integer(readline("New Qty: ")))
  else if (choice == 3) display_inventory()
  else if (choice == 4) break
  else cat("Invalid choice!\n")
}

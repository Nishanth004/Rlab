products <- list(
  list(name="Apple", price=120),
  list(name="Milk", price=25)
)
cart <- list(
  list(name="Apple", quantity=3),
  list(name="Milk", quantity=2)
)

subtotal <- 0
cat("\nReceipt:\n")
for (item in cart) {
  for (p in products) {
    if (p$name == item$name) {
      cost <- p$price * item$quantity
      cat(item$name, "x", item$quantity, "- $", cost, "\n")
      subtotal <- subtotal + cost
    }
  }
}

tax <- subtotal * 0.08
total <- subtotal + tax
cat("\nSubtotal: $", subtotal, "\nTax: $", tax, "\nTotal: $", total, "\n")

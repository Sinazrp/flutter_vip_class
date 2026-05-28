mixin DiscountableProduct {
  /*
  Calculate new price of product by discount

  Parameters:
  1. Main price
  2. Discount price from 1 to 100 percent (e.g. 20)
  */
  calculateDiscount(double price, double discount) =>
      price * (1 - discount / 100);
}

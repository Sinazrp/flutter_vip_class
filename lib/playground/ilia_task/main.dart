import 'Digital_Product.dart';
import 'Physical_produect.dart';
import 'abstract_product.dart';

void discount(Product product) {
  product.price = product.type == "digital"
      ? product.calculateDiscount(product.price, 20)
      : product.price;
}

void main() {
  // Sample products
  Product dP1 = DigitalProduct(
    title: "Intro to programming",
    price: 50000,
    file_size: 38,
  );

  Product dP2 = DigitalProduct(
    title: "Flutter course",
    price: 4800000,
    file_size: 3800,
  );

  Product pP1 = PhysicalProduct(title: "Laptop", price: 35000000, weight: 2);

  Product pP2 = PhysicalProduct(title: "Book", price: 380000, weight: 0.5);

  // Store all the products
  List<Product> products = [dP1, dP2, pP1, pP2];

  // Print stats of all products
  for (Product product in products) {
    discount(product);
    print("${product.showDetails()} \n");
  }
}

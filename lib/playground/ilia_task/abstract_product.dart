import 'mixin_discountable.dart';
// Create for all types of products

abstract class Product with DiscountableProduct {
  static int count = 0;
  final String type;
  final int _id;
  final String title;
  double price;

  Product({required this.title, required this.price, required this.type})
    : _id = add_count;

  String showDetails();

  static int get add_count => count += 1;

  int get get_id => _id;
}

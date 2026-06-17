import 'abstract_product.dart';

class PhysicalProduct extends Product {
  /*
  All parameters for digital products:
  1. title
  2. price (by double)
  3. weight (kg)
  */

  final double weight;

  PhysicalProduct({
    super.type = "physical",
    required super.title,
    required super.price,
    required this.weight,
  });

  @override
  String showDetails() {
    return """
    id: $get_id
    Product Name: $title
    Price: $price
    weight: $weight
    """;
  }
}

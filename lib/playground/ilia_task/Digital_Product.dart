import 'abstract_product.dart';

class DigitalProduct extends Product {
  /*
  All parameters for digital products:
  1. title
  2. price (by double)
  3. file size (megabyte)
  */

  final double file_size;

  DigitalProduct({
    super.type = "digital",
    required super.title,
    required super.price,
    required this.file_size,
  });

  @override
  String showDetails() {
    return """
    id: $get_id
    Product Name: $title
    Price: $price
    file_size: $file_size
    """;
  }
}

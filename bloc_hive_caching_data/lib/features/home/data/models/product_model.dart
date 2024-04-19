import 'package:bloc_hive_caching_data/features/home/data/models/hive_helper/fields/product_fields.dart';
import 'package:bloc_hive_caching_data/features/home/data/models/hive_helper/fields/products_model_fields.dart';
import 'package:bloc_hive_caching_data/features/home/data/models/hive_helper/hive_types.dart';
import 'package:hive/hive.dart';

part 'product_model.g.dart';

@HiveType(typeId: HiveTypes.productsModel)
class ProductsModel extends HiveObject {
  @HiveField(ProductsModelFields.success)
  final bool success;
  @HiveField(ProductsModelFields.totalProducts)
  final int totalProducts;
  @HiveField(ProductsModelFields.message)
  final String message;
  @HiveField(ProductsModelFields.offset)
  final int offset;
  @HiveField(ProductsModelFields.limit)
  final int limit;
  @HiveField(ProductsModelFields.products)
  final List<Product> products;

  ProductsModel({
    required this.success,
    required this.totalProducts,
    required this.message,
    required this.offset,
    required this.limit,
    required this.products,
  });

  factory ProductsModel.fromJson(Map<String, dynamic> json) => ProductsModel(
        success: json["success"],
        totalProducts: json["total_products"],
        message: json["message"],
        offset: json["offset"],
        limit: json["limit"],
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
      );
}

@HiveType(typeId: HiveTypes.product)
class Product extends HiveObject {
  @HiveField(ProductFields.id)
  final int id;
  @HiveField(ProductFields.price)
  final double price;
  @HiveField(ProductFields.category)
  final String category;
  @HiveField(ProductFields.updatedAt)
  final DateTime updatedAt;
  @HiveField(ProductFields.photoUrl)
  final String photoUrl;
  @HiveField(ProductFields.name)
  final String name;
  @HiveField(ProductFields.description)
  final String description;
  @HiveField(ProductFields.createdAt)
  final DateTime createdAt;

  Product({
    required this.id,
    required this.price,
    required this.category,
    required this.updatedAt,
    required this.photoUrl,
    required this.name,
    required this.description,
    required this.createdAt,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        price: json["price"]?.toDouble(),
        category: json["category"].toString(),
        updatedAt: DateTime.parse(json["updated_at"]),
        photoUrl: json["photo_url"],
        name: json["name"],
        description: json["description"],
        createdAt: DateTime.parse(json["created_at"]),
      );
}

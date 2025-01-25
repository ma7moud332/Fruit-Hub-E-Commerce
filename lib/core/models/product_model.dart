import '../entities/product_entity.dart';
import '../helper_functions/get_avg_rating.dart';
import 'review_model.dart';

class ProductModel {
  final String name;
  final String description;
  final num price;
  final String code;
  final bool isFeatured;
  String? imageUrl;
  final int expirationsMonths;
  final bool isOrganic;
  final int numberOfCalories;
  final num avgRating;
  final num ratingsCount = 0;
  final int unitAmount;
  final num sellingCount;
  final List<ReviewModel> reviews;

  ProductModel(
      {required this.name,
      required this.avgRating,
      required this.reviews,
      required this.sellingCount,
      required this.description,
      required this.price,
      required this.expirationsMonths,
      required this.numberOfCalories,
      required this.unitAmount,
      required this.isOrganic,
      required this.code,
      required this.isFeatured,
      this.imageUrl});

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        name: json['name'],
        description: json['description'],
        price: json['price'],
        sellingCount: json['sellingCount'],
        imageUrl: json['image'],
        code: json['code'],
        isFeatured: json['isFeatured'],
        expirationsMonths: json['expirationsMonths'],
        numberOfCalories: json['numberOfCalories'],
        unitAmount: json['unitAmount'],
        reviews: json['reviews'] != null
            ? (json['reviews'] as List<dynamic>)
                .map((e) => ReviewModel.fromJson(e))
                .toList()
            : [],
        isOrganic: json['isOrganic'],
        avgRating:
            (json['reviews'] != null && (json['reviews'] as List).isNotEmpty)
                ? getAvgRating((json['reviews'] as List<dynamic>)
                    .map((e) => ReviewModel.fromJson(e).toEntity())
                    .toList())
                : 0,
      );

  ProductEntity toEntity() => ProductEntity(
        name: name,
        description: description,
        price: price,
        code: code,
        avgRating: avgRating,
        isFeatured: isFeatured,
        expirationsMonths: expirationsMonths,
        numberOfCalories: numberOfCalories,
        unitAmount: unitAmount,
        isOrganic: isOrganic,
        reviews: reviews.map((e) => e.toEntity()).toList(),
      );
  toJson() => {
        'name': name,
        'description': description,
        'price': price,
        'sellingCount': sellingCount,
        'image': imageUrl,
        'code': code,
        'isFeatured': isFeatured,
        'expirationsMonths': expirationsMonths,
        'numberOfCalories': numberOfCalories,
        'unitAmount': unitAmount,
        'isOrganic': isOrganic,
        'reviews': reviews.map((e) => e.toJson()).toList()
      };
}

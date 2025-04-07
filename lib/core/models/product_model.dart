import 'package:fruit_hub/core/helper_functions/get_avg_rating.dart';
import '../entities/product_entity.dart';
import '../entities/review_entity.dart';
import 'review_model.dart';

class ProductModel {
  final String name;
  final String description;
  final String code;
  final num price;
  final bool isFeatured;
  String? imageUrl;
  final int expiredMonths;
  final bool isOrganic;
  final int calories;
  final int unitAmount;
  num avgRating = 0;
  final int sellingCount;
  final List<ReviewModel> reviews;

  ProductModel(
    this.avgRating, {
    required this.name,
    required this.reviews,
    required this.sellingCount,
    required this.description,
    required this.code,
    required this.price,
    required this.isFeatured,
    required this.expiredMonths,
    this.isOrganic = false,
    required this.calories,
    required this.unitAmount,
    this.imageUrl, 
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    
    final reviewsJson = (json['reviews'] as List<dynamic>? ?? []);
    final List<ReviewModel> reviewsList = reviewsJson
        .map<ReviewModel>(
            (review) => ReviewModel.fromJson(review as Map<String, dynamic>))
        .toList();

    return ProductModel(
      getAvgRating(reviewsList.map((review) => review.toEntity()).toList()),
      name: json['name'] as String,
      description: json['description'] as String,
      code: json['code'] as String,
      price: json['price'] as num,
      isFeatured: json['isFeatured'] as bool,
      expiredMonths: (json['expiredMonths'] as num).toInt(),
      isOrganic: json['isOrganic'] as bool,
      calories: (json['calories'] as num).toInt(),
      sellingCount: (json['sellingCount'] as num).toInt(),
      unitAmount: (json['unitAmount'] as num).toInt(),
      reviews: reviewsList,
      imageUrl: json['imageUrl'] as String?, 
    );
  }

  ProductEntity toEntity() {
    return ProductEntity(
      name: name,
      description: description,
      code: code,
      price: price,
      imageUrl: imageUrl,
      isFeatured: isFeatured,
      expirationsMonths: expiredMonths,
      isOrganic: isOrganic,
      numberOfCalories: calories,
      unitAmount: unitAmount,
      reviews: reviews
          .map((reviewModel) => reviewModel.toEntity())
          .toList()
          .cast<ReviewEntity>(), 
      avgRating: avgRating,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'code': code,
      'price': price,
      'isFeatured': isFeatured,
      'imageUrl': imageUrl,
      'expiredMonths': expiredMonths,
      'isOrganic': isOrganic,
      'calories': calories,
      'sellingCount': sellingCount,
      'unitAmount': unitAmount,
      'reviews': reviews.map((review) => review.toJson()).toList(),
    };
  }
}

import 'review_entity.dart';

class ProductEntity {
  final String name;
  final String description;
  final num price;
  final String code;
  final bool isFeatured;
  String? imageUrl;
  final int expirationsMonths;
  final bool isOrganic;
  final int numberOfCalories;
  final num avgRating ;
  final num ratingsCount = 0;
  final int unitAmount;
  final List<ReviewEntity> reviews;

  ProductEntity(
      {required this.name,
      required this.reviews,
      required this.description,
      required this.price,
      required this.avgRating,
      required this.expirationsMonths,
      required this.numberOfCalories,
      required this.unitAmount,
      this.isOrganic = false,
      required this.code,
      required this.isFeatured,
      this.imageUrl});
}

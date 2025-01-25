import '../entities/review_entity.dart';

class ReviewModel {
  final String name;
  final String image;
  final String reviewDescription;
  final num rating;
  final String date;

  ReviewModel({
    required this.name,
    required this.image,
    required this.reviewDescription,
    required this.rating,
    required this.date,
  });

 ReviewEntity toEntity() => ReviewEntity(
        name: name,
        image: image,
        reviewDescription: reviewDescription,
        rating: rating,
        date: date,
      );
  toJson() => {
        'name': name,
        'image': image,
        'reviewDescription': reviewDescription,
        'rating': rating,
        'date': date,
      };

  factory ReviewModel.fromEntity(ReviewEntity reviewEntity) => ReviewModel(
        name: reviewEntity.name,
        image: reviewEntity.image,
        reviewDescription: reviewEntity.reviewDescription,
        rating: reviewEntity.rating,
        date: reviewEntity.date,
      );

  factory ReviewModel.fromJson(Map<String, dynamic> json) => ReviewModel(
        name: json['name'],
        image: json['image'],
        reviewDescription: json['reviewDescription'],
        rating: json['rating'],
        date: json['date'],
      );
}

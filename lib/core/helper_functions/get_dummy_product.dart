import 'package:fruit_hub/core/entities/product_entity.dart';

ProductEntity getDummyProduct() {
  return ProductEntity(

    name: 'Apple',
    price: 1.99,
    imageUrl: null,
    description: 'A juicy red apple',
    isFeatured: true,
    isOrganic: true,
    avgRating: 5.4,
    unitAmount: 1,
    expirationsMonths: 12,
    numberOfCalories: 100,
    reviews: [],
    code: '1234',
  );
}

List<ProductEntity> getDummyProducts() {
  return [
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
  ];
}

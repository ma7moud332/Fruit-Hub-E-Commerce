import 'package:dartz/dartz.dart';
import 'package:fruit_hub/core/entities/product_entity.dart';
import 'package:fruit_hub/core/errors/failuers.dart';
import 'package:fruit_hub/core/models/product_model.dart';
import 'package:fruit_hub/core/services/database_service.dart';
import 'package:fruit_hub/core/utils/backend_endboints.dart';
import 'products_repo.dart';

class ProductsRepoImpl extends ProductsRepo {
  final DataBaseService dataBaseService;

  ProductsRepoImpl(this.dataBaseService);
  @override
  Future<Either<Failure, List<ProductEntity>>> getBestSellingProducts() async {
    try {
      var data = await dataBaseService.getData(
          path: BackendEndboints.getProducts,
          query: {
            'limit': 10,
            'orderBy': 'sellingCount',
            'descending': true
          }
          ) as List<Map<String, dynamic>>;

      List<ProductEntity> products =
          data.map((e) => ProductModel.fromJson(e).toEntity()).toList();
      return Right(products);
    } catch (e) {
      return Left(ServerFailure('Error getting products'));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts() async {
    try {
      var data = await dataBaseService.getData(
          path: BackendEndboints.getProducts) as List<Map<String, dynamic>>;
      List<ProductEntity> products =
          data.map((e) => ProductModel.fromJson(e).toEntity()).toList();
      return Right(products);
    } catch (e) {
      return Left(ServerFailure('Error getting products'));
    }
  }
}

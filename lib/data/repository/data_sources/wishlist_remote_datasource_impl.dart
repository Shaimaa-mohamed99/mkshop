import 'package:dartz/dartz.dart';
import 'package:e_commerce/data/api/api_manager.dart';
import 'package:e_commerce/domain/entities/add_to_wishlist_response_entity.dart';
import 'package:e_commerce/domain/entities/errors.dart';
import 'package:e_commerce/domain/entities/get_wishlist_response_entity.dart';
import 'package:e_commerce/domain/repository/data_sources/wishlist_remote_datasource_contract.dart';

class WishListRemoteDataSourceImpl implements WishListRemoteDataSourceContract {
  ApiManager apiManager;

  WishListRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<Either<Errors, GetWishListResponseEntity>> getWishList() async {
    var either = await apiManager.getWishList();
    return either.fold(
      (error) {
        return Left(error);
      },
      (response) {
        return Right(response);
      },
    );
  }

  @override
  Future<Either<Errors, AddToWishListResponseEntity>> removeFromWishList(
      String productId) async {
    var either = await apiManager.removeFromWishList(productId);
    return either.fold(
      (error) {
        return Left(error);
      },
      (response) {
        return Right(response);
      },
    );
  }
}

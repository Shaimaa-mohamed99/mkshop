import 'package:e_commerce/domain/entities/categories_response_entity.dart';
import 'package:e_commerce/domain/entities/products_response_entity.dart';

class GetWishListResponseEntity {
  String? statusMsg;
  String? message;
  String? status;
  int? count;
  List<WishListProductEntity>? data;

  GetWishListResponseEntity(
      {this.status, this.count, this.data, this.statusMsg, this.message});
}

class WishListProductEntity {
  int? sold;
  List<String>? images;
  List<SubcategoryEntity>? subcategory;
  int? ratingsQuantity;
  String? id;
  String? title;
  String? slug;
  String? description;
  int? quantity;
  int? price;
  String? imageCover;
  CategoryBrandEntity? category;
  CategoryBrandEntity? brand;
  double? ratingsAverage;
  String? createdAt;
  String? updatedAt;
  int? v;

  WishListProductEntity(
      {this.sold,
      this.images,
      this.subcategory,
      this.ratingsQuantity,
      this.id,
      this.title,
      this.slug,
      this.description,
      this.quantity,
      this.price,
      this.imageCover,
      this.category,
      this.brand,
      this.ratingsAverage,
      this.createdAt,
      this.updatedAt,
      this.v});
}

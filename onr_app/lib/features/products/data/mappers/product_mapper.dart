// ignore_for_file: unintended_html_in_doc_comment

import 'package:onr_app/features/products/data/models/product_model.dart';
import 'package:onr_app/features/products/domain/entities/product.dart';
import 'package:onr_app/features/products/domain/entities/rating.dart';

extension ProductModelMapper on ProductModel {
  Product toEntity() {
    return Product(
      id: id,
      title: title,
      description: description,
      price: price,
      category: category,
      image: image,
      rating: rating.toEntity(),
    );
  }

  /// Convert JSON list to List<ProductModel>
  static List<ProductModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => ProductModel.fromJson(json as Map<String, dynamic>)).toList();
  }

  /// Convert List<ProductModel> to List<Product>
  static List<Product> toEntityList(List<ProductModel> models) {
    return models.map((model) => model.toEntity()).toList();
  }
}

extension RatingModelMapper on RatingModel {
  Rating toEntity() {
    return Rating(rate: rate, count: count);
  }
}

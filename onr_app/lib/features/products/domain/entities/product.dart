import 'package:equatable/equatable.dart';
import 'rating.dart';

class Product extends Equatable {
  final int id;
  final String title;
  final String description;
  final double price;
  final String category;
  final String image;
  final Rating rating;

  const Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.category,
    required this.image,
    required this.rating,
  });

  Product copyWith({
    int? id,
    String? title,
    String? description,
    double? price,
    String? category,
    String? image,
    Rating? rating,
  }) {
    return Product(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      price: price ?? this.price,
      category: category ?? this.category,
      image: image ?? this.image,
      rating: rating ?? this.rating,
    );
  }

  @override
  List<Object?> get props => [id, title, description, price, category, image, rating];
}

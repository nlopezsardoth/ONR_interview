import 'package:flutter/material.dart';
import 'package:onr_app/features/products/domain/entities/product.dart';
import 'package:onr_app/features/shared/presentation/widgets/rating_widget.dart';
import 'package:onr_app/features/shared/utils/extensions/context_extensions.dart';

class ProductView extends StatelessWidget {
  const ProductView({
    super.key,
    required this.product,
    required this.size,
    required this.textStyles,
  });

  final Product product;
  final Size size;
  final TextTheme textStyles;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Imagen
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              product.image,
              width: size.width * 0.3,
            ),
          ),

          const SizedBox(width: 10),

          // Descripción
          SizedBox(
            width: (size.width - 40) * 0.7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.title, style: textStyles.titleLarge),
                Text(product.description),
                const SizedBox(height: 10),
                RatingWidget(rating: product.rating.rate),
                Row(
                  children: [
                    Text("${context.l10n.category_label}:",
                        style: textStyles.labelSmall),
                    const SizedBox(width: 5),
                    Text(product.category),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

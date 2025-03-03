import 'package:flutter/material.dart';
import 'package:onr_app/features/products/domain/entities/product.dart';
import 'package:onr_app/features/shared/utils/extensions/context_extensions.dart';
import 'package:onr_app/features/shared/utils/helpers/formaters.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 5),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.title,
                style: context.theme.textTheme.labelLarge,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              Text(
                product.description,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              Text(
                "${context.l10n.price_label}: \$${HumanFormats.number(product.price, 0)}",
                style: context.theme.textTheme.labelSmall,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

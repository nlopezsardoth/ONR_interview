import 'package:flutter/material.dart';
import 'package:onr_app/features/shared/utils/helpers/formaters.dart';

class RatingWidget extends StatelessWidget {

  final double rating; 


  const RatingWidget({
    super.key,
    required this.rating
  });

  @override
  Widget build(BuildContext context) {

    final textStyles = Theme.of(context).textTheme;

    return SizedBox(
      width: 150,
      child: Row(
        children: [
          Icon(Icons.star_half_outlined, color: Colors.yellow.shade800),
          const SizedBox(width: 3),
          Text(HumanFormats.number(rating, 1),
              style: textStyles.bodyMedium
                  ?.copyWith(color: Colors.yellow.shade800)),
          
        ],
      ),
    );
  }
}
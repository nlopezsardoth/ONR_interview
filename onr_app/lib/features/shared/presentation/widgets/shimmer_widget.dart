import 'package:flutter/material.dart';
import 'package:onr_app/features/shared/utils/extensions/context_extensions.dart';
import 'package:shimmer/shimmer.dart';

Widget buildRectangleShimmerItem(
    BuildContext context, double width, double height) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 5),
    child: Shimmer.fromColors(
      baseColor: context.theme.disabledColor.withAlpha(20),
      highlightColor: context.theme.disabledColor.withAlpha(10),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: context.theme.primaryColorDark,
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    ),
  );
}
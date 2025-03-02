import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:onr_app/features/shared/utils/extensions/context_extensions.dart';

class ONRLoader extends StatelessWidget {
  const ONRLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingAnimationWidget.halfTriangleDot(
        color: context.theme.primaryColor,
        size: 50,
      ),
    );
  }
}
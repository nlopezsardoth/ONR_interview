import 'package:flutter/material.dart';
import 'package:onr_app/features/shared/utils/extensions/context_extensions.dart';

class TryAgainWidget extends StatelessWidget {
  const TryAgainWidget({super.key, this.onTap});

  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Text(
            context.l10n.something_went_wrong_title,
            style: context.theme.textTheme.titleLarge,
          ),
          Text(
            context.l10n.try_again,
            style: context.theme.textTheme.titleMedium,
          ),
          Icon(Icons.autorenew_outlined)
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:onr_app/features/shared/presentation/widgets/errors/popover.dart';
import 'package:onr_app/features/shared/utils/extensions/context_extensions.dart';

enum ErrorType { somethingWentWrong, cantLoadProductsError, cantLoadDetailError, cantLoadUsersError }

class ErrorBottomSheet {
  static void showErrorModal(
    BuildContext context,
    ErrorType errorType,
    VoidCallback? callback,
    VoidCallback? closeCallback,
  ) {
    final IconData iconData;
    final String title;
    final String description;

    switch (errorType) {
      case ErrorType.somethingWentWrong:
        iconData = Icons.error_outline;
        title = context.l10n.something_went_wrong_title;
        description = context.l10n.try_again_later_description;
        break;
      case ErrorType.cantLoadProductsError:
        iconData = Icons.production_quantity_limits_outlined;
        title = context.l10n.something_went_wrong_title;
        description = context.l10n.cant_load_products_title;
        break;
      case ErrorType.cantLoadDetailError:
        iconData = Icons.production_quantity_limits_outlined;
        title = context.l10n.something_went_wrong_title;
        description = context.l10n.cant_load_product_title;
        break;
      case ErrorType.cantLoadUsersError:
        iconData = Icons.person_off;
        title = context.l10n.something_went_wrong_title;
        description = context.l10n.cant_load_users_title;
        break;
    }

    _showModalBottomSheet(
      context,
      iconData,
      title,
      description,
      callback,
      closeCallback,
      errorType,
    );
  }

  static void _showModalBottomSheet(
    BuildContext context,
    IconData iconData,
    String title,
    String description,
    VoidCallback? callback,
    VoidCallback? closeCallback,
    ErrorType errorType,
  ) {
    showModalBottomSheet<int>(
      context: context,
      enableDrag: false,
      isDismissible: false,
      builder: (context) {
        return Popover(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            width: MediaQuery.sizeOf(context).width,
            height: 253,
            child: _buildContentColumn(
              context,
              iconData,
              title,
              description,
              callback,
              closeCallback,
              errorType,
            ),
          ),
        );
      },
    );
  }

  static Column _buildContentColumn(
    BuildContext context,
    IconData iconData,
    String title,
    String description,
    VoidCallback? callback,
    VoidCallback? closeCallback,
    ErrorType errorType,
  ) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Spacer(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: _buildSomethingWentWrongImage(iconData),
              ),
            ),
            _buildCloseButton(context, callback),
          ],
        ),
        Column(
          children: [
            _buildErrorTitle(context, title),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: _buildErrorDescription(description),
            ),
          ],
        ),
        _buildErrorButton(context, callback),
      ],
    );
  }

  static Widget _buildCloseButton(BuildContext context, VoidCallback? callback) {
    return Expanded(
      child: Align(
        alignment: Alignment.topRight,
        child: IconButton(
          icon: Icon(Icons.close),
          onPressed:
              () =>
                  callback == null
                      ? context.pop()
                      : callback(),
        ),
      ),
    );
  }

  static Icon _buildSomethingWentWrongImage(IconData iconData) {
    return Icon(iconData, size: 80);
  }

  static Text _buildErrorTitle(BuildContext context, String title) {
    return Text(title, style: context.theme.textTheme.titleMedium);
  }

  static Text _buildErrorDescription(String description) {
    return Text(description, textAlign: TextAlign.justify);
  }

  static TextButton _buildErrorButton(
    BuildContext context,
    VoidCallback? callback,
  ) {
    return TextButton(
      child: Text(
        context.l10n.understood_button_text,
        style: context.theme.textTheme.labelLarge,
      ),
      onPressed:
          () =>
              callback == null ? context.pop() : callback(),
    );
  }
}

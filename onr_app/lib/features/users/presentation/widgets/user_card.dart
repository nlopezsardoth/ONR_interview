import 'package:flutter/material.dart';
import 'package:onr_app/features/shared/utils/extensions/context_extensions.dart';
import 'package:onr_app/features/users/domain/entities/user.dart';

class UserCard extends StatelessWidget {
  final User user;

  const UserCard({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Padding(
      padding: EdgeInsets.only(bottom: 5),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${user.name.firstname} ${user.name.lastname}",
                    style: theme.textTheme.labelMedium,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  Text(
                    "@${user.username}",
                    style: theme.textTheme.bodyMedium!.copyWith(color: theme.colorScheme.primary),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ],
              ),
              Text(
              user.email,
              style: context.theme.textTheme.labelSmall,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
            Text(
              "${user.address.street} ${user.address.number}, ${user.address.city}",
              style: context.theme.textTheme.bodySmall,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
            Text(
              user.phone,
              style: context.theme.textTheme.bodySmall,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onr_app/features/shared/presentation/widgets/onr_loader.dart';
import 'package:onr_app/features/shared/presentation/widgets/try_again_widget.dart';
import 'package:onr_app/features/shared/utils/extensions/context_extensions.dart';
import 'package:onr_app/features/users/presentation/bloc/user_bloc.dart';
import 'package:onr_app/features/users/presentation/widgets/user_card.dart';

class UsersView extends StatelessWidget {
  const UsersView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserBloc, UserState>(
      listenWhen: (previous, current) =>
          previous.status == UserStatus.loading &&
          current.status == UserStatus.success,
      listener: (context, state) =>
          _showUserCountPopup(context, state.users?.length ?? 0),
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return state.status == UserStatus.failure
            ? Center(
                child: TryAgainWidget(
                  onTap: () => context.read<UserBloc>().add(LoadUsers()),
                ),
              )
            : state.status == UserStatus.loading
                ? ONRLoader()
                : Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: state.users?.length ?? 20,
                      itemBuilder: (context, index) {
                        return UserCard(user: state.users![index]);
                      },
                    ),
                  );
      },
    );
  }
}

void _showUserCountPopup(BuildContext context, int userCount) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(context.l10n.users_title),
      content: Text("${context.l10n.users_count_text}: $userCount"),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(context.l10n.ok_label),
        ),
      ],
    ),
  );
}

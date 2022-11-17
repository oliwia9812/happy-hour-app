import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:happy_hour_app/blocs/authentication/authentication_bloc.dart';
import 'package:happy_hour_app/repositories/user/user_repository.dart';
import 'package:happy_hour_app/styles/app_text_styles.dart';

class HomeGreetingWidget extends StatelessWidget {
  const HomeGreetingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        if (state is AuthenticationAuthenticated) {
          final String name =
              context.read<UserRepository>().getCurrentUserName!;
          return Text(
            'Hello $name!',
            style: AppTextStyles.titleLarge,
          );
        } else {
          return const Text(
            'Hello!',
            style: AppTextStyles.titleLarge,
          );
        }
      },
    );
  }
}

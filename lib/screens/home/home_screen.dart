import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:happy_hour_app/constants.dart';
import 'package:happy_hour_app/screens/authentication/authentication_bloc.dart';
import 'package:happy_hour_app/screens/common_widgets/custom_button.dart';
import 'package:happy_hour_app/styles/app_colors.dart';
import 'package:happy_hour_app/styles/app_text_styles.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {
      if (state is AuthenticationUnauthenticated) {
        context.go(Constants.signUpRouteName);
      }
    }, builder: (context, state) {
      if (state is AuthenticationAuthenticated) {
        final String? userName = state.displayName;

        return Scaffold(
          backgroundColor: AppColors.white,
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            minimum: const EdgeInsets.symmetric(
              horizontal: 32.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Hello $userName",
                  style: AppTextStyles.titleLarge,
                ),
                CustomButton(
                    buttonTitle: "Sign out",
                    callback: () {
                      BlocProvider.of<AuthenticationBloc>(context)
                          .add(SignOut());
                    }),
              ],
            ),
          ),
        );
      } else {
        return const SizedBox.shrink();
      }
    });
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'feature/login_page/presentation/bloc/login_bloc.dart';
import 'feature/login_page/presentation/pages/login_page.dart';
import 'feature/login_page/presentation/pages/logout_screen.dart';
import 'feature/login_page/presentation/pages/register_page.dart';
import 'feature/login_page/presentation/pages/signin_screen.dart';
import 'feature/login_page/presentation/pages/welcome_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Login',
        theme: ThemeData(
          primarySwatch: Colors.cyan,
        ),
        home: BlocProvider(
            create: (context) => LoginBloc(),
            child: BlocBuilder<LoginBloc, LoginState>(
              builder: (context, state) {
                if (state is Register) {
                  return const RegisterPage();
                } else if (state is SignIn) {
                  return SignInScreen();
                } else if (state is LoginPage) {
                  return const LoginScreen();
                } else if (state is Logout) {
                  return const LogoutScreen();
                }
                return const WelcomePage();
              },
            )));
    
  }
}

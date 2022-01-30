import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:looping_diary/core/localizer/flutter_fire_ui_custom_delegate.dart';
import 'package:looping_diary/core/localizer/localizer.dart';
import 'package:looping_diary/features/home/presentation/pages/home_page.dart';
import 'package:looping_diary/features/login/presentation/pages/loading_page.dart';
import 'package:looping_diary/features/login/presentation/pages/login_page.dart';

class AuthGate extends StatefulWidget {
  const AuthGate({Key? key}) : super(key: key);

  @override
  State<AuthGate> createState() => _AuthGateState();
}

class _AuthGateState extends State<AuthGate> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    final FlutterFireUICustomDelegate delegate = FlutterFireUICustomDelegate(context);
    localizationsDelegates.add(delegate);

    //TODO: figure out a better way to wait implicitly for the localization delegates to load
    //TODO: instead of waiting explicitly 2 seconds
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const LoadingPage();
    }

    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const LoginPage();
        } else {
          return const HomePage();
        }
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'Forms/login.dart';
import 'home.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Login();
        }
        return Home(user: snapshot.data!);
      },
    );
  }
}

import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart' show GoogleSignIn;
import 'package:pfartists_flutter/utils/supabase.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:pfartists_flutter/constants/environment.dart';

final webClientId = Environment.googleWebId;
// '<web client ID that you registered on Google Cloud, for example my-web.apps.googleusercontent.com>';

final iosClientId = Environment.googleIOSId;
// '<iOS client ID that you registered on Google Cloud, for example my-ios.apps.googleusercontent.com';

final androidClientId = Environment.googleAndroidId;
// final platform = Theme.of(context).platform;

final GoogleSignIn googleSignIn = GoogleSignIn(
  clientId: defaultTargetPlatform == TargetPlatform.iOS
      ? iosClientId
      : androidClientId,
  serverClientId: webClientId,
);

Future<bool> googleUser() async {
  final user = await googleSignIn.signIn();
  final googleAuth = await user!.authentication;
  final accessToken = googleAuth.accessToken;
  final idToken = googleAuth.idToken;

  if (accessToken == null) {
    throw 'No Access Token found.';
  }
  if (idToken == null) {
    throw 'No ID Token found.';
  }

  final response = await supabase.auth.signInWithIdToken(
    provider: OAuthProvider.google,
    idToken: idToken,
    accessToken: accessToken,
  );

  return response.user != null;
}

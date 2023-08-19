import 'package:coders_oasis/shared/network/remote/supabase_api.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_auth_ui/supabase_auth_ui.dart';

class GoogleSignInApi {
  static final _googleSignIn = GoogleSignIn();

  static get authentication => null;

  static String userAccessToken = "";
  static String userIdToken = "";

  static Future<GoogleSignInAccount?> login() async {
    final account = await _googleSignIn.signIn();
    if (account != null) {
      final googleKey = await account.authentication;
      if (googleKey.accessToken != null) {
        userAccessToken = googleKey.accessToken!;
      }
      if (googleKey.idToken != null) {
        userIdToken = googleKey.idToken!;
      }
      SupabaseService.signInUsingToken(
          provider: Provider.google,
          userIdToken: userIdToken,
          userAccessToken: userAccessToken);
    }
    return account;
  }

  static void test() {
    print(_googleSignIn.currentUser?.email);
  }

  static Future<GoogleSignInAccount?> signOut() => _googleSignIn.signOut();
}

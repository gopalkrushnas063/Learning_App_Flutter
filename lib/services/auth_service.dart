import 'package:learning_app/data/http/http.dart';
import 'package:learning_app/features/Auth/models/auth_model.dart';

class AuthService {
  static Future<String?> login(AuthModel auth) async {
    try {
      final response = await Http.apiURL.post(
        '/user/login',
        data: auth.toJson(),
      );
      if (response.statusCode == 200) {
        // Extract email from response ("Login successful for user: gks@email.com")
        final responseText = response.data.toString();
        final email =
            responseText.replaceFirst('Login successful for user: ', '');
        return email.trim(); // Returns "gks@email.com"
      }
      return null;
    } catch (e) {
      return null;
    }
  }
}

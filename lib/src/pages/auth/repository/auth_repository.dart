import 'package:greengrocer/src/constants/endpoint.dart';
import 'package:greengrocer/src/models/user_model.dart';
import 'package:greengrocer/src/services/http_manager.dart';

class AuthRepository {
  final HttpManager _httpManager = HttpManager();

  Future signIn({required String email, required String password}) async {
    final result = await _httpManager.restRequest(
      url: EndPoint.signin,
      method: HttpMethod.post,
      body: {
        "email": email,
        "password": password,
      },
    );

    if (result['result'] != null) {
      print('Signin funcionou');

      final user = UserModel.fromMap(result['result']);
      print(user);
    } else {
      print('Signin nao funcionou');
      print(result['error']);
    }
  }
}

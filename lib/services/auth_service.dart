import 'dart:convert';

import 'package:banksha/models/sign_in_form_model.dart';
import 'package:banksha/models/sign_up_form_model.dart';
import 'package:banksha/models/user_model.dart';
import 'package:banksha/shared/shared_values.dart';
import 'package:http/http.dart' as http;

class AuthService {
  Future<bool> checkEmail(String email) async {
    try {
      final res = await http.post(Uri.parse('$baseUrl/is-email-exist'), body: {
        'email': email,
      });

      if (res.statusCode == 200) {
        return jsonDecode(res.body)['is_email_exist'];
      } else {
        return jsonDecode(res.body)['errors'];
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<UserModel> register(SignUpFormModel data) async {
    try {
      final res = await http.post(
        Uri.parse('$baseUrl/register'),
        body: data.toJson(),
      );

      if (res.statusCode == 200) {
        return UserModel.fromJson(jsonDecode(res.body));
      } else {
        throw jsonDecode(res.body)['errors'];
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<UserModel> login(SignInFormModel data) async {
    try {
      final res = await http.post(
        Uri.parse('$baseUrl/login'),
        body: data.toJson(),
      );

      if (res.statusCode == 200) {
        return UserModel.fromJson(jsonDecode(res.body));
      } else {
        throw jsonDecode(res.body)['errors'];
      }
    } catch (e) {
      rethrow;
    }
  }
}

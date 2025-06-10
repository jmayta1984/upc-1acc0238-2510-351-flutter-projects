import 'dart:convert';
import 'dart:io';

import 'package:demo/core/constants/endpoints/endpoints.dart';
import 'package:demo/features/auth/data/models/user_dto.dart';
import 'package:demo/features/auth/data/models/user_request_dto.dart';
import 'package:http/http.dart' as http;

class AuthService {
  Future<UserDto> login(String username, String password) async {
    final uri = Uri.parse(Endpoints.authBaseUrl);

    final http.Response response = await http.post(
      uri,
      headers: Endpoints.headers,
      body: jsonEncode(
        UserRequestDto(username: username, password: password).toJson(),
      ),
    );
    if (response.statusCode == HttpStatus.ok) {
      final json = jsonDecode(response.body);
      return UserDto.fromJson(json);
    }
    throw Exception(jsonDecode(response.body)['message'] ?? 'Unknow error');
  }
}

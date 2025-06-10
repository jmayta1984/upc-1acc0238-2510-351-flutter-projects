import 'package:demo/features/auth/domain/user.dart';

class UserDto {
  final int id;
  final String email;
  final String username;
  final String image;
  final String lastName;
  final String firstName;

  const UserDto({
    required this.id,
    required this.email,
    required this.username,
    required this.image,
    required this.lastName,
    required this.firstName,
  });

  factory UserDto.fromJson(Map<String, dynamic> json) {
  
    return UserDto(
      id: json['id'] as int,
      email: json['email'] as String,
      username: json['username'] as String,
      image: json['image'] as String,
      lastName: json['lastName'] as String,
      firstName: json['firstName'] as String,
    );
  }

  User toDomain() {
    return User(
      id: id,
      email: email,
      username: username,
      image: image,
      name: '$firstName $lastName',
    );
  }
}

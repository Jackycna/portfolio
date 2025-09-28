import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvHelper {
  static String email = dotenv.env['Emial'] ?? 'jackycnaa@gmail.com';
  static String linkedIn =
      dotenv.env['LINKED_IN'] ??
      'https://www.linkedin.com/in/jackson-26b793322?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=android_app';
  static String github = dotenv.env['GIT_HUB'] ?? 'https://github.com/jackycna';
  static String phone = dotenv.env['CALL'] ?? '+919344091532';
  static String insta =
      dotenv.env['INSTA'] ??
      'https://www.instagram.com/_.jacky._e?utm_source=qr&igsh=MXRxYjV5Z3QyN3NoYQ=';
}

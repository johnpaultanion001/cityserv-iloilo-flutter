import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppEnvironment {
  String _baseUrl = '';

  String get baseUrl => _baseUrl;

  Future initialize() async {
    await dotenv.load(fileName: ".env");
    _baseUrl = dotenv.env['BASE_URL']!;
  }
}

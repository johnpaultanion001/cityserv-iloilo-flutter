import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalStorageProvider {
  late FlutterSecureStorage _storage;
  LocalStorageProvider() {
    _storage = const FlutterSecureStorage();
  }

  Future saveValue({required String key, required String value}) async {
    await _storage.write(key: key, value: value);
  }

  Future<String> getValue({required String key}) async {
    return await _storage.read(key: key) ?? '';
  }

  Future deleteValue({required String key}) async {
    await _storage.delete(key: key);
  }

  Future deleteAllValues() async {
    await _storage.deleteAll();
  }
}

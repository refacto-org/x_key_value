// ignore: avoid_web_libraries_in_flutter
import 'dart:html' show window;

import 'package:x_key_value/src/interface.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Storage extends StorageInterface {
  Storage(FlutterSecureStorage flutterSecureStorage,
      SharedPreferencesFactory sharedPreferencesFactory)
      : super(flutterSecureStorage, sharedPreferencesFactory);

  @override
  Future<void> write({
    required final String key,
    required final String value,
    required final StorageType type,
  }) async {
    if (type == StorageType.session) {
      window.sessionStorage[key] = value;
    } else if (type == StorageType.secure) {
      await flutterSecureStorage.write(key: key, value: value);
    } else if (type == StorageType.local) {
      final sharedPreferences = await sharedPreferencesFactory();
      await sharedPreferences.setString(key, value);
    }
  }

  @override
  Future<String> read({
    required final String key,
    final String defaultValue = '',
    required final StorageType type,
  }) async {
    if (type == StorageType.session) {
      return window.sessionStorage[key] ?? defaultValue;
    } else if (type == StorageType.secure) {
      await flutterSecureStorage.read(key: key);
    } else if (type == StorageType.local) {
      final sharedPreferences = await sharedPreferencesFactory();
      sharedPreferences.getString(key);
    }
    return defaultValue;
  }

  @override
  Future<void> delete({
    required final String key,
    required final StorageType type,
  }) async {
    if (type == StorageType.session) {
      window.sessionStorage.remove(key);
    } else if (type == StorageType.secure) {
      await flutterSecureStorage.delete(key: key);
    } else if (type == StorageType.local) {
      final sharedPreferences = await sharedPreferencesFactory();
      sharedPreferences.remove(key);
    }
  }
}

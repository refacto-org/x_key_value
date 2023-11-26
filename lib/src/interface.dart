import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

typedef SharedPreferencesFactory = Future<SharedPreferences> Function();

enum StorageType {
  session,
  secure,
  local,
}

abstract class StorageInterface {
  @protected
  final FlutterSecureStorage flutterSecureStorage;

  @protected
  final SharedPreferencesFactory sharedPreferencesFactory;

  StorageInterface(this.flutterSecureStorage, this.sharedPreferencesFactory);

  Future<void> write({
    required final String key,
    required final String value,
    required final StorageType type,
  });

  Future<String> read({
    required final String key,
    final String defaultValue = '',
    required final StorageType type,
  });

  Future<void> delete({
    required final String key,
    required final StorageType type,
  });
}

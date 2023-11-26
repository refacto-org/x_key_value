import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:x_key_value/src/factory.dart';
import 'package:x_key_value/src/type.dart';

abstract class XKeyValueInterface {
  @protected
  final FlutterSecureStorage flutterSecureStorage;

  @protected
  final SharedPreferencesFactory sharedPreferencesFactory;

  XKeyValueInterface(this.flutterSecureStorage, this.sharedPreferencesFactory);

  Future<void> write({
    required final String key,
    required final String value,
    required final XKeyValueType type,
  });

  Future<String> read({
    required final String key,
    final String defaultValue = '',
    required final XKeyValueType type,
  });

  Future<void> delete({
    required final String key,
    required final XKeyValueType type,
  });

  @protected
  Future<String> getFromSharedPreference(final String key,
      {final String defaultValue = ''}) async {
    final sharedPreferences = await sharedPreferencesFactory();
    return sharedPreferences.getString(key) ?? defaultValue;
  }

  @protected
  Future<String> removeFromSharedPreference(final String key,
      {final String defaultValue = ''}) async {
    final sharedPreferences = await sharedPreferencesFactory();
    return sharedPreferences.getString(key) ?? defaultValue;
  }

  @protected
  Future<void> writeFromSharedPreference(
      final String key, final String value) async {
    final sharedPreferences = await sharedPreferencesFactory();
    sharedPreferences.setString(key, value);
  }
}

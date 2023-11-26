import 'dart:async';

import 'package:x_key_value/src/factory.dart';
import 'package:x_key_value/src/interface.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:x_key_value/src/type.dart';

class XKeyValue extends XKeyValueInterface {
  XKeyValue(FlutterSecureStorage flutterSecureStorage,
      SharedPreferencesFactory sharedPreferencesFactory)
      : super(flutterSecureStorage, sharedPreferencesFactory);

  @override
  Future<void> write({
    required final String key,
    required final String value,
    required final XKeyValueType type,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<String> read({
    required final String key,
    final String defaultValue = '',
    required final XKeyValueType type,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<void> delete({
    required final String key,
    required final XKeyValueType type,
  }) {
    throw UnimplementedError();
  }
}

export 'package:x_key_value/src/factory.dart';
export 'package:x_key_value/src/type.dart';
export 'package:x_key_value/src/base.dart'
    if (dart.library.io) 'package:x_key_value/src/io.dart'
    if (dart.library.js) 'package:x_key_value/src/web.dart';

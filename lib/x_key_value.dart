export 'package:x_key_value/src/type.dart';
export 'package:x_key_value/src/base.dart'
    if (dart.library.io) 'package:x_key_value/src/storage_io.dart'
    if (dart.library.js) 'package:x_key_value/src/storage_web.dart';

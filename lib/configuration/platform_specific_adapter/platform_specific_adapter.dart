export 'platform_specific_adapter_stub.dart'
    if (dart.library.io) 'platform_specific_adapter_io.dart'
    if (dart.library.html) 'platform_specific_adapter_web.dart';

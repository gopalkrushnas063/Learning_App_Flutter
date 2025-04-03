import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final storageProvider = Provider<FlutterSecureStorage>(
  (ref) {
    return StorageService().initialize();
  },
);



class StorageService {
  FlutterSecureStorage initialize() {
    AndroidOptions _getAndroidOptions() => const AndroidOptions(
          encryptedSharedPreferences: true,
        );
    final storage = FlutterSecureStorage(aOptions: _getAndroidOptions());
    

    return storage;
  }
}




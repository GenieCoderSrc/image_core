import 'package:app_toast/app_toast.dart';
import 'package:fire_storage_impl/fire_storage_impl.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class FirebasePlatformExceptionHandler {
  static String? handleUploadError(PlatformException e) {
    String msg = FireStorageTxtConst.failedToUpload;
    switch (e.code) {
      case 'unauthorized':
        msg = FireStorageTxtConst.fileMustBeLessThan5Mb;
        break;
      case 'unknown':
        msg = FireStorageTxtConst.internetConnectionFailed;
        break;
    }

    AppToast.showToast(msg: msg);
    debugPrint('PlatformException: $e');
    return null;
  }
}

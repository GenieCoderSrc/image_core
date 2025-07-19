// 📄 platform_file_upload_extension.dart

import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:image_core/data/models/upload_file.dart';
import 'package:image_core/utils/file_category_resolver.dart';
import 'package:mime/mime.dart';

extension PlatformFileToUploadFile on PlatformFile {
  Future<UploadFile> toUploadFileFromPlatformFile({
    String? fileName,
    String? collectionPath,
    String? uploadingToastTxt,
    Map<String, String>? metadata,
    String? contentDisposition,
  }) async {
    final Uint8List fileBytes;

    if (bytes != null) {
      fileBytes = bytes!;
    } else if (path != null) {
      fileBytes = await File(path!).readAsBytes();
    } else {
      throw Exception('Cannot read PlatformFile: no bytes or path available');
    }

    final String resolvedName = fileName ?? name;
    final String mimeType =
        lookupMimeType(resolvedName) ?? 'application/octet-stream';
    final category = FileCategoryResolver.fromMimeType(mimeType);

    return UploadFile(
      bytes: fileBytes,
      name: resolvedName,
      mimeType: mimeType,
      collectionPath: collectionPath,
      uploadingToastTxt: uploadingToastTxt,
      metadata:
          metadata ??
          {'source': 'platform-file', if (path != null) 'file-path': path!},
      contentDisposition: contentDisposition,
      category: category,
    );
  }
}

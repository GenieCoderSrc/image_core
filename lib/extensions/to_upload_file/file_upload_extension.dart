// 📄 file_upload_extension.dart

import 'dart:io';
import 'dart:typed_data';

import 'package:image_core/data/models/upload_file.dart';
import 'package:image_core/utils/file_category_resolver.dart';
import 'package:mime/mime.dart';

extension FileToUploadFile on File {
  Future<UploadFile> toUploadFileFromFile({
    String? fileName,
    String? collectionPath,
    String? uploadingToastTxt,
    Map<String, String>? metadata,
    String? contentDisposition,
  }) async {
    final Uint8List bytes = await readAsBytes();
    final String resolvedName = fileName ?? uri.pathSegments.last;
    final String mimeType = lookupMimeType(path) ?? 'application/octet-stream';
    final category = FileCategoryResolver.fromMimeType(mimeType);

    return UploadFile(
      bytes: bytes,
      name: resolvedName,
      mimeType: mimeType,
      collectionPath: collectionPath,
      uploadingToastTxt: uploadingToastTxt,
      metadata: metadata ?? {'file-path': path},
      contentDisposition: contentDisposition,
      category: category,
    );
  }
}

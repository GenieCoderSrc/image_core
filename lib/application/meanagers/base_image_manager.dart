// XFile: base_image_manager.dart

import 'package:dartz/dartz.dart';
import 'package:exception_type/exception_type.dart';
import 'package:i_tdd/i_tdd.dart';
import 'package:image_picker/image_picker.dart';
// base_image_manager.dart

abstract class BaseImageManager<T> {
  Future<Either<IFailure, bool>> upload(T imageData);
  Future<Either<IFailure, bool>> delete(String url);

  Future<void> uploadIfAvailable({
    required XFile? file,
    required String? entityId,
    required Future<T> Function(XFile file, String? id) dataBuilder,
    String? successMsg,
  }) async {
    if (file == null || entityId == null) return;

    final T imageData = await dataBuilder(file, entityId);
    final result = await upload(imageData);

    result.handleReport(successMsg: successMsg);
  }

  Future<void> deleteIfAvailable({
    required String? imageUrl,
    String? successMsg,
  }) async {
    if (imageUrl == null) return;

    final result = await delete(imageUrl);
    result.handleReport(successMsg: successMsg);
  }
}

// XFile: base_image_manager.dart

import 'package:dartz/dartz.dart';
import 'package:exception_type/exception_type.dart';
import 'package:i_tdd/i_tdd.dart';
import 'package:image_picker/image_picker.dart';

abstract class BaseImageManager<TData> {
  Future<Either<IFailure, bool>> upload(TData imageData);

  Future<Either<IFailure, bool>> delete(String url);

  Future<void> uploadIfAvailable({
    required XFile? file,
    required String? entityId,
    required Future<TData> Function(XFile file, String entityId) dataBuilder,
    String? successMsg,
  }) async {
    if (file != null && entityId != null) {
      final imageData = await dataBuilder(file, entityId);
      final result = await upload(imageData);
      result.handleReport(successMsg: successMsg);
    }
  }


  // Future<void> uploadIfAvailable({
  //   required XFile? file,
  //   required String? entityId,
  //   required TData Function(XFile file, String entityId) dataBuilder,
  //   String? successMsg,
  // }) async {
  //   if (file != null && entityId != null) {
  //     final imageData = dataBuilder(file, entityId);
  //     final result = await upload(imageData);
  //     result.handleReport(successMsg: successMsg);
  //   }
  // }

  Future<void> deleteIfAvailable({
    required String? imageUrl,
    String? successMsg,
  }) async {
    if (imageUrl != null) {
      final result = await delete(imageUrl);
      result.handleReport(successMsg: successMsg);
    }
  }
}

import 'package:dartz/dartz.dart';
import 'package:exception_type/exception_type.dart';
import 'package:flutter/material.dart';
import 'package:image_core/image_core.dart';
import 'package:image_picker/image_picker.dart';

class MyImageManager extends BaseImageManager<UploadFile> {
  @override
  Future<Either<IFailure, bool>> upload(UploadFile imageData) async {
    // TODO: Implement upload logic
    debugPrint("Uploading: \${imageData.name} (\${imageData.mimeType})");
    return right(true);
  }

  @override
  Future<Either<IFailure, bool>> delete(String url) async {
    // TODO: Implement delete logic
    debugPrint("Deleting: \$url");
    return right(true);
  }
}

Future<void> main() async {
  final ImagePicker picker = ImagePicker();
  final XFile? file = await picker.pickImage(source: ImageSource.gallery);
  final MyImageManager imageManager = MyImageManager();

  await imageManager.uploadIfAvailable(
    file: file,
    entityId: 'user_123',
    successMsg: 'Image uploaded successfully!',
    dataBuilder: (file, id) => file.toUploadFileFromXFile(
      collectionPath: 'users/$id/images',
    ), // async function returning Future<UploadFile>
  );

  // Simulate deletion example
  await imageManager.deleteIfAvailable(
    imageUrl: 'https://your-storage-service.com/path/to/image.jpg',
    successMsg: 'Image deleted successfully!',
  );
}

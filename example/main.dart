import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_core/image_core.dart';

Future<void> main() async {
  final File file = File('asset/example.jpg');

  UploadFile? uploadFile = await file.toUploadFileFromFile();

  debugPrint('Main | main | uploadFile: ${uploadFile.toString()}');
}

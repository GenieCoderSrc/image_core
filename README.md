# image_core

A robust and extensible Dart/Flutter package that simplifies image and file upload handling across platforms using SOLID principles and clean architecture. This package provides a foundation to manage file conversions, categorization, and streamlined upload/delete operations with support for multiple file types like `XFile`, `File`, and `PlatformFile`.        

---

## ✨ Features

* ✅ Platform-agnostic file support (`XFile`, `File`, `PlatformFile`)
* 📦 Convert file data to standardized `UploadFile` format
* 🧱 Enum-based file categorization (`image`, `video`, `document`, `audio`, `other`)
* 🚀 Easy-to-extend `BaseImageManager` with upload/delete logic
* 🧩 Extension-based conversion utilities
* 📄 MIME type detection and content type resolution
* 🧪 Functional error handling using `Either<IFailure, TResult>` from `dartz`
* 🔁 Optional toast notification messages on success

---

## 📦 Installation

```sh
flutter pub add image_core
```

---

## 🧰 Getting Started

### Create Your Own Image Manager

Extend the `BaseImageManager<T>` and implement the `upload` and `delete` methods:

```dart
class FirebaseImageManager extends BaseImageManager<UploadFile> {
  @override
  Future<Either<IFailure, bool>> upload(UploadFile imageData) async {
    // implement Firebase upload logic
  }

  @override
  Future<Either<IFailure, bool>> delete(String url) async {
    // implement Firebase delete logic
  }
}
```

### Upload Conditionally

```dart
await imageManager.uploadIfAvailable(
  file: selectedXFile,
  entityId: 'userId123',
  successMsg: 'Profile picture uploaded!',
  dataBuilder: (file, id) => await file.toUploadFileFromXFile(
    collectionPath: 'users/$id/images',
  ),
);
```

### Delete Conditionally

```dart
await imageManager.deleteIfAvailable(
  imageUrl: 'https://firebasestorage.googleapis.com/...',
  successMsg: 'Image removed',
);
```

---

## 🔄 Extensions

### `XFile.toUploadFileFromXFile()`

Converts a `XFile` into a standardized `UploadFile`.

### `PlatformFile.toUploadFileFromPlatformFile()`

Converts a `PlatformFile` from `file_picker` to `UploadFile`.

### `File.toUploadFileFromFile()`

Converts a regular Dart `File` to an `UploadFile`.

### `String?.getFileName()`

Generates a fallback file name based on timestamp if null or empty.

### `String?.getFileExtension()`

Extracts the file extension from a filename or path.

---

## 📁 `UploadFile` Model

```dart
class UploadFile {
  final Uint8List bytes;
  final String? name;
  final String? mimeType;
  final String? collectionPath;
  final String? uploadingToastTxt;
  final Map<String, String>? metadata;
  final String? contentDisposition;
  final FileCategory category;
  ...
}
```

---

## 📂 File Category

The `FileCategory` enum includes:

* `image`
* `video`
* `document`
* `audio`
* `other`

Resolved based on MIME type via `FileCategoryResolver`.

---

## 🛠 Dependencies

* `dartz`: Functional programming support (`Either`)
* `exception_type`: Common `IFailure` interface
* `i_tdd`: Toast or UI feedback handler with `handleReport()`
* `cross_file`, `file_picker`, `mime`: Platform and file type support

---

## 📄 License

MIT License. See [LICENSE](LICENSE) file for details.

---

## 📣 Contributions

Feel free to open issues, suggest features, or submit PRs. Contributions are welcome!

---

## 🔗 Related Packages

* `firebase_storage_manager`
* `file_picker`
* `fluttertoast`
* `image_picker`

---

## 🔍 Example Use Case

You want to upload an image picked via `image_picker`:

```dart
final XFile? file = await ImagePicker().pickImage(source: ImageSource.gallery);

await myImageManager.uploadIfAvailable(
  file: file,
  entityId: 'profile_01',
  dataBuilder: (file, id) => await file.toUploadFileFromXFile(
    collectionPath: 'profiles/$id/images',
  ),
);
```

---

## 👨‍💼 Author

**image_core**
Developed with ❤️ by [Shohidul Islam](https://github.com/ShohidulProgrammer)

---

Happy Uploading 🚀
# image_core

# Changelog

All notable changes to the **image_core** package will be documented in this file.

---

## 0.0.1

### July 19, 2025

### ✨ Added

* `BaseImageManager<T>` abstract class with `upload`, `delete`, `uploadIfAvailable`, and `deleteIfAvailable` methods.
* `UploadFile` model class for standardized file representation.
* `FileCategory` enum for file categorization.
* Extensions:

    * `XFile.toUploadFileFromXFile()`
    * `PlatformFile.toUploadFileFromPlatformFile()`
    * `File.toUploadFileFromFile()`
    * `String?.getFileName()`
    * `String?.getFileExtension()`
* `ContentTypeUtil` for resolving common content types.
* `FileCategoryResolver` for deriving category from MIME type.

### 🧰 Initial Setup

* Project structured with SOLID principles and clean architecture.
* Functional error handling with `dartz` and `IFailure`.
* Toast/report integration via `i_tdd`'s `handleReport()`.

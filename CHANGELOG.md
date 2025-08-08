# Changelog

All notable changes to the **image_core** package will be documented in this file.

---

## 0.0.4

### Aug 8, 2025

### ✨ Updated

- Updated file_picker version as file_picker: ^10.2.2

## 0.0.3

### July 21, 2025

### ✨ Updated

* Update dependency.

## 0.0.2

### July 21, 2025

### ✨ Updated

* `BaseImageManager<T>` abstract class with `upload`, `delete`, `uploadIfAvailable`, and `deleteIfAvailable` methods.

## 0.0.1

### July 19, 2025

### ✨ Added

* `BaseImageManager<TData>` abstract class with `upload`, `delete`, `uploadIfAvailable`, and `deleteIfAvailable`
  methods.
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

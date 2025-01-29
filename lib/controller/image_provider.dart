import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';

class KImageProvider with ChangeNotifier {
  List<File> _images = [];
  List<File> get images => _images;

  final ImagePicker _imagePicker = ImagePicker();

  // Fetch recent pictures from the internal storage and sort them by last modified time
  Future<void> fetchRecentPictures() async {
    try {
      // Get the external storage directory (usually the "Pictures" folder)
      final Directory? directory = await getExternalStorageDirectory();
      if (directory == null) {
        throw Exception('Unable to access storage directory');
      }

      // List all files in the directory
      final List<FileSystemEntity> files = directory.listSync();

      // Filter only image files and map them to a list of File objects
      List<File> imageFiles = files
          .where((file) =>
              file.path.endsWith('.jpg') ||
              file.path.endsWith('.jpeg') ||
              file.path.endsWith('.png'))
          .map((file) => File(file.path))
          .toList();

      // Sort images by last modified time (newest first)
      imageFiles.sort((a, b) {
        final aStat = a.statSync();
        final bStat = b.statSync();
        return bStat.modified.compareTo(aStat.modified); // Sort in descending order
      });

      _images = imageFiles;
      notifyListeners();
    } catch (e) {
      debugPrint('Error fetching images: $e');
    }
  }

  // Pick an image from the gallery using the image_picker package
  Future<void> pickImageFromGallery() async {
    try {
      final XFile? pickedFile =
          await _imagePicker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        _images.insert(0, File(pickedFile.path)); // Add the new image at the beginning
        notifyListeners();
      }
    } catch (e) {
      debugPrint('Error picking image from gallery: $e');
    }
  }

  // Pick an image from the camera using the image_picker package
  Future<void> pickImageFromCamera() async {
    try {
      final XFile? pickedFile =
          await _imagePicker.pickImage(source: ImageSource.camera);

      if (pickedFile != null) {
        _images.insert(0, File(pickedFile.path)); // Add the new image at the beginning
        notifyListeners();
      }
    } catch (e) {
      debugPrint('Error picking image from camera: $e');
    }
  }

  // Pick multiple images from the gallery using the file_picker package
  Future<void> pickMultipleImages() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.image,
        allowMultiple: true,
      );

      if (result != null) {
        final newImages = result.paths.map((path) => File(path!)).toList();
        _images.insertAll(0, newImages); // Add new images at the beginning
        notifyListeners();
      }
    } catch (e) {
      debugPrint('Error picking multiple images: $e');
    }
  }
}
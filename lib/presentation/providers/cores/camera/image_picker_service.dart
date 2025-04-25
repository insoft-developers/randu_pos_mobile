import 'package:image_picker/image_picker.dart';

class ImagePickerService {
  final ImagePicker _imagePicker;

  ImagePickerService({required ImagePicker imagePicker})
      : _imagePicker = imagePicker;

  /// Pick an image from the gallery.
  Future<XFile?> pickImageFromGallery() async {
    try {
      final XFile? image =
          await _imagePicker.pickImage(source: ImageSource.gallery);
      return image;
    } catch (e) {
      // Handle any exceptions that occur during the image picking process
      print('Failed to pick image from gallery: $e');
      return null;
    }
  }

  /// Pick an image from the camera.
  Future<XFile?> pickImageFromCamera() async {
    try {
      final XFile? image =
          await _imagePicker.pickImage(source: ImageSource.camera);
      return image;
    } catch (e) {
      // Handle any exceptions that occur during the image picking process
      print('Failed to pick image from camera: $e');
      return null;
    }
  }

  /// Pick multiple images from the gallery.
  Future<List<XFile>?> pickMultipleImages() async {
    try {
      final List<XFile> images = await _imagePicker.pickMultiImage();
      return images;
    } catch (e) {
      // Handle any exceptions that occur during the image picking process
      print('Failed to pick multiple images: $e');
      return null;
    }
  }
}

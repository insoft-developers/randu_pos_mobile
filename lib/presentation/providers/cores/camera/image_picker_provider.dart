import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'image_picker_service.dart';

part 'image_picker_provider.g.dart';

@riverpod
ImagePickerService imagePickerService(ImagePickerServiceRef ref) {
  return ImagePickerService(imagePicker: ref.watch(imagePickerProvider));
}

@riverpod
ImagePicker imagePicker(ImagePickerRef ref) {
  return ImagePicker();
}

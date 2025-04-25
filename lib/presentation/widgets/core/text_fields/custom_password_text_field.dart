import 'custom_text_field.dart';

class CustomPasswordTextField extends CustomTextField {
  const CustomPasswordTextField({
    super.key,
    required Function(String?)? onSaved,
    required String? Function(String?)? validator,
  }) : super();
}

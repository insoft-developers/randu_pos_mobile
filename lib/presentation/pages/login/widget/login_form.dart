import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../providers/main/user_data/user_data_provider.dart';
import '../../../widgets/core/buttons/primary_button.dart';
import '../../../widgets/core/text_fields/custom_text_field.dart';
import '../../../widgets/core/text_fields/style/text_field_style.dart';

class LoginForm extends ConsumerStatefulWidget {
  const LoginForm({super.key, required this.formkey});
  final GlobalKey<FormState> formkey;

  @override
  ConsumerState<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends ConsumerState<LoginForm> {
  String _email = '';
  String _password = '';
  bool isObscurePassword = true;

  String? _emailValidator(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    // Use a regular expression to validate the email format
    // if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
    //   return 'Please enter a valid email';
    // }
    return null;
  }

  String? _passwordValidator(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    return null;
  }

  void _onSubmit() {
    if (widget.formkey.currentState?.validate() ?? false) {
      widget.formkey.currentState?.save();
      log('Email: $_email');
      log('Password: $_password');
      ref
          .read(userDataProvider.notifier)
          .login(email: _email, password: _password);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Form is invalid')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formkey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CustomTextField(
            validator: _emailValidator,
            onSaved: (value) {
              _email = value ?? '';
            },
            labelText: 'Username or Email',
            hintText: 'Username or Email',
            prefixIcon: const Icon(Icons.person_outline),
            maxLine: 1,
            border: TextFieldStyle.focusedBorder,
          ),
          const SizedBox(
            height: 24,
          ),
          CustomTextField(
            validator: _passwordValidator,
            onSaved: (value) {
              _password = value ?? '';
            },
            labelText: 'Password',
            hintText: 'Password',
            obscureText: isObscurePassword,
            prefixIcon: const Icon(Icons.lock_outline_rounded),
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isObscurePassword = !isObscurePassword;
                });
              },
              child: isObscurePassword
                  ? const Icon(Icons.visibility_off_outlined)
                  : const Icon(Icons.visibility_outlined),
            ),
            maxLine: 1,
            border: TextFieldStyle.focusedBorder,
          ),
          const SizedBox(
            height: 16,
          ),
          // Align(
          //   alignment: Alignment.centerRight,
          //   child: GestureDetector(
          //     onTap: () {},
          //     child: const CustomText(
          //       'Forgot Password?',
          //       textAlign: TextAlign.right,
          //     ),
          //   ),
          // ),
          const SizedBox(
            height: 40,
          ),
          PrimaryButton(
            isLoading: ref.watch(userDataProvider) is AsyncLoading,
            label: 'Masuk',
            onTap: _onSubmit,
          ),
          const SizedBox(height: 64),
        ],
      ),
    );
  }
}

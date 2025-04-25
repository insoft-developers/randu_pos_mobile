import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

import '../../../core/extensions/context_extension.dart';
import '../../providers/cores/router/go_router_provider.dart';
import '../../providers/main/user_data/user_data_provider.dart';
import '../../widgets/core/responsive/responsive_layout.dart';
import 'widget/widget.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    ref.listen(userDataProvider, (previous, next) {
      print('listen');
      if (next is AsyncData) {
        final box = Hive.box<String>('token');
        print(box.name);
        if (box.isNotEmpty) {
          print('go to dashboard');
          ref.read(routerProvider).goNamed('dashboard');
        } else {
          print('go to login');
        }
      } else if (next is AsyncError) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(next.error.toString())));
      }
    });
    return Scaffold(
      bottomNavigationBar: context.isMobile && Platform.isAndroid? const CreateAccountLink() : null,
      body: SafeArea(
        child: ResponsiveLayout(
            mobileBody: LoginBodyMobile(
              formkey: _formKey,
            ),
            tabletBody: LoginBodyTablet(
              formKey: _formKey,
            )),
      ),
    );
  }
}

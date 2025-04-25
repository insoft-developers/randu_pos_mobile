import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/const/colors.dart';
import '../../providers/main/settings/check_version_app/check_version_app_provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.primaryColor,
      body: Center(
        child: Image.asset('assets/images/randu-logo.png'),
      ),
    );
  }
}

class SplashscreenNew extends ConsumerStatefulWidget {
  const SplashscreenNew({super.key});

  @override
  ConsumerState createState() => _SplashscreenNewState();
}

class _SplashscreenNewState extends ConsumerState<SplashscreenNew> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await ref
          .read(checkVersionAppProviderProvider.notifier)
          .checkVersionApp();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.primaryColor,
      body: Center(
        child: Image.asset('assets/images/randu-logo.png'),
      ),
    );
  }
}

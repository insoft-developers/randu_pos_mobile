import 'package:custom_pin_screen/custom_pin_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

import '../../../core/const/colors.dart';
import '../../providers/cores/router/go_router_provider.dart';
import '../../providers/main/user_data/user_data_provider.dart';
import '../../widgets/core/responsive/responsive_layout.dart';
import 'widget/widget.dart';

class PinScreen extends ConsumerStatefulWidget {
  const PinScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _PinScreenState();
  }
}

class _PinScreenState extends ConsumerState<PinScreen> {
  TextEditingController controller = TextEditingController();
  PinTheme pinTheme = PinTheme(
    textColor: CustomColors.primaryColor,
    keysColor: CustomColors.primaryColor,
  );
  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.removeListener(() {
      setState(() {});
    });
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(userDataProvider, (previous, next) {
      if (next is AsyncData) {
        final box = Hive.box<bool>('is_locked');
        print(box.name);
        if (box.isEmpty || box.get('is_locked') == false) {
          print('go to dashboard');
          ref.read(routerProvider).goNamed('dashboard');
        }
      } else if (next is AsyncError) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(next.error.toString())));
      }
    });
    return const Scaffold(
      body: SafeArea(
        child: ResponsiveLayout(
          mobileBody: PinBodyMobile(),
          tabletBody: PinBodyTablet(),
        ),
      ),
    );
  }
}

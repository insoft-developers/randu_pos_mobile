import 'dart:developer';

import 'package:custom_pin_screen/custom_pin_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/const/colors.dart';
import '../../../../core/const/constant.dart';
import '../../../providers/main/user_data/user_data_provider.dart';
import 'pin_code_field.dart';

class PinInput extends ConsumerStatefulWidget {
  const PinInput({super.key});

  @override
  ConsumerState<PinInput> createState() => _PinInputState();
}

class _PinInputState extends ConsumerState<PinInput> {
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
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < pinLength; i++)
                  PinCodeField(
                    key: Key('pinField$i'),
                    pin: controller.text,
                    pinCodeFieldIndex: i,
                    theme: pinTheme,
                  ),
              ],
            ),
          ),
          const SizedBox(height: 60),
          ref.watch(userDataProvider) is AsyncLoading
              ? const Expanded(child: CircularProgressIndicator())
              : CustomKeyBoard(
                  onCompleted: (value) {
                    // TODO: ADD PIN onCompleted HANDLER
                    log('COMPLETED: $value');
                    ref.read(userDataProvider.notifier).checkPin(pin: value);
                  },
                  onChanged: (value) {
                    // TODO: ADD PIN onChanged HANDLER
                    log('CHANEGED: $value');
                  },
                  controller: controller,
                  pinTheme: pinTheme,
                  specialKey: const Icon(Icons.delete_forever_sharp),
                  specialKeyOnTap: () {
                    controller.clear();
                  },
                  maxLength: pinLength,
                ),
          // const SizedBox(
          //   height: 32,
          // )
        ],
      ),
    );
  }
}

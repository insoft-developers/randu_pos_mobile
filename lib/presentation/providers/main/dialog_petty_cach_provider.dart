import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dialog_petty_cach_provider.g.dart';

@riverpod
class DialogPettyCach extends _$DialogPettyCach {
  @override
  bool build() {
    return false;
  }

  void setDialogPettyCash(bool isPettyCashOn, bool isCashierClose) {
    //1 SHOW, 1 CLOSE
    state = (isPettyCashOn && isCashierClose);
  }
}

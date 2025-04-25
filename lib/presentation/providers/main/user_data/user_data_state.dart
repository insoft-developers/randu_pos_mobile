part of 'user_data_provider.dart';

@freezed
class UserDataState with _$UserDataState {
  const factory UserDataState({
    UserModel? user,
    bool? isCashierOpen,
    bool? isPettyCashEnabled,
  }) = _UserDataState;
}

part of 'daily_recap_provider.dart';

@freezed
class DailyRecapState with _$DailyRecapState {
  const DailyRecapState._();
  const factory DailyRecapState({
    GeneralRequestModel? request,
    List<DailyRecapModel>? value,
    int? lastPage,
    DateTime? selectedDate,
    @Default(1) int page,
  }) = _DailyRecapState;

  int get totalData => value?.length ?? 0;
  bool get isLastPageReached => page == lastPage;
}

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../domain/entities/general_request_model.dart';
import '../../../../../domain/entities/report/daily_recap/daily_recap_model.dart';
import '../../../../../domain/entities/result.dart';
import '../../../../../domain/usecases/report/daily_recap/daily_recap_uc.dart';
import '../../../usecases/report/daily_recap/daily_recap_uc_provider.dart';

part 'daily_recap_provider.freezed.dart';
part 'daily_recap_provider.g.dart';
part 'daily_recap_state.dart';

@riverpod
class DailyRecap extends _$DailyRecap {
  @override
  FutureOr<DailyRecapState> build() => const DailyRecapState();

  Future<void> fetchDailyRecap({GeneralRequestModel? request}) async {
    final page = request?.page ?? 1;
    state = const AsyncLoading();
    DailyRecapUC dailyRecapUC = ref.read(dailyRecapUCProvider);
    var result = await dailyRecapUC(
        request ?? state.value?.request ?? const GeneralRequestModel());
    var prev = page == 1 ? [] : state.value?.value ?? [];
    switch (result) {
      case Success(value: final response):
        final (data, lastPage) = response;
        state = AsyncData(state.value!
            .copyWith(value: [...prev, ...data], lastPage: lastPage));
      case Failed(message: _):
        state = const AsyncData(DailyRecapState());
    }
  }

  void incrementPage() {
    state = AsyncData(state.value!.copyWith(page: state.value!.page + 1));
  }

  void setSelectedDate(DateTime? date) {
    state = AsyncData(state.value!.copyWith(selectedDate: date));
    if (date == null) return;
    var newDate =
        '${date.year}-${date.month < 10 ? "0${date.month}" : date.month}-${date.day < 10 ? "0${date.day}" : date.day}';
    fetchDailyRecap(request: GeneralRequestModel(page: 1, date: newDate));
  }

  void fetchNextPage() {
    incrementPage();

    fetchDailyRecap(
      request: GeneralRequestModel(page: state.value?.page ?? 1),
    );
  }

  void resetState() {
    state = const AsyncData(DailyRecapState());
  }
}

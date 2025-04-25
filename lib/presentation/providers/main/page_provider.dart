import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'page_provider.freezed.dart';
part 'page_provider.g.dart';

@riverpod
class Page extends _$Page {
  @override
  PageState build() {
    return const PageState(page: 0, isDrawerOpen: false, isCompleteCartInfo: false);
  }

  void setPage(int page) {
    state = state.copyWith(page: page);
  }

  void setDrawerOpen(bool isOpen) {
    state = state.copyWith(isDrawerOpen: isOpen);
  }

  void setCompleteCartInfo() {
    state = state.copyWith(isCompleteCartInfo: !state.isCompleteCartInfo);
  }
}

@freezed
class PageState with _$PageState {
  const factory PageState({
    required int page,
    required bool isDrawerOpen,
    required bool isCompleteCartInfo,
  }) = _PageState;
}

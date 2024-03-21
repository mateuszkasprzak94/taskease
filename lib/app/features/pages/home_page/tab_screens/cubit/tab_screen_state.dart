part of 'tab_screen_cubit.dart';

@freezed
class TabScreenState with _$TabScreenState {
  factory TabScreenState({
    @Default([]) List<ItemModel> items,
    @Default(Status.initial) status,
    String? errorMessage,
  }) = _TabScreenState;
}

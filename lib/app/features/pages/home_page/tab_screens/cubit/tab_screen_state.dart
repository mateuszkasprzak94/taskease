part of 'tab_screen_cubit.dart';

@freezed
class TabScreenState with _$TabScreenState {
  factory TabScreenState({
    int? totalTasks,
    @Default([]) List<ItemModel> remainingTasks,
    @Default([]) List<ItemModel> allTasks,
    @Default([]) List<ItemModel> todaysTasks,
    @Default([]) List<ItemModel> failedTasks,
    @Default([]) List<ItemModel> completedTasks,
    @Default(Status.initial) status,
    String? errorMessage,
  }) = _TabScreenState;
}

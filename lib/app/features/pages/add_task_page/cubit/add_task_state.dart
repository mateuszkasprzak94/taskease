part of 'add_task_cubit.dart';

@freezed
class AddTaskState with _$AddTaskState {
  factory AddTaskState({
    @Default(false) bool saved,
    String? errorMessage,
  }) = _AddState;
}

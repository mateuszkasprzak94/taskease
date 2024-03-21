part of 'add_task_cubit.dart';

@freezed
class AddTaskState with _$AddTaskState {
  factory AddTaskState({
    @Default(Status.initial) status,
    String? errorMessage,
  }) = _AddState;
}

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:to_do/app/domain/repositories/items_repository.dart';

part 'add_task_state.dart';
part 'add_task_cubit.freezed.dart';

class AddTaskCubit extends Cubit<AddTaskState> {
  AddTaskCubit(this._itemsRepository) : super(AddTaskState());

  final ItemsRepository _itemsRepository;

  Future<void> add(
    DateTime deadline,
    String title,
    String taskType,
  ) async {
    try {
      await _itemsRepository.add(deadline, title, taskType);
      emit(
        AddTaskState(
          saved: true,
        ),
      );
    } catch (error) {
      emit(
        AddTaskState(
          errorMessage: error.toString(),
        ),
      );
    }
  }
}

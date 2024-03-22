import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:to_do/app/core/enums.dart';
import 'package:to_do/app/domain/models/item_model.dart';
import 'package:to_do/app/domain/repositories/items_repository.dart';

part 'tab_screen_state.dart';
part 'tab_screen_cubit.freezed.dart';

class TabScreenCubit extends Cubit<TabScreenState> {
  TabScreenCubit(this._itemsRepository) : super(TabScreenState());

  final ItemsRepository _itemsRepository;

  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    emit(TabScreenState(
      items: [],
      status: Status.loading,
      errorMessage: '',
    ));

    _streamSubscription = _itemsRepository.getItemsStream().listen(
      (items) {
        emit(
          TabScreenState(
            items: items,
            status: Status.success,
            errorMessage: '',
          ),
        );
      },
    )..onError(
        (error) {
          emit(
            TabScreenState(
              items: [],
              status: Status.error,
              errorMessage: error.toString(),
            ),
          );
        },
      );
  }

  Future<void> remove({required String documentID}) async {
    try {
      _itemsRepository.delete(id: documentID);
    } catch (error) {
      emit(
        TabScreenState(
          status: Status.error,
          errorMessage: error.toString(),
        ),
      );
      start();
    }
  }

  Future<void> updateCheckbox(
      {required String documentID, required bool isChecked}) async {
    try {
      _itemsRepository.update(id: documentID, isChecked: isChecked);
    } catch (error) {
      emit(
        TabScreenState(
          status: Status.error,
          errorMessage: error.toString(),
        ),
      );
    }
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}

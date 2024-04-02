import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
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
    emit(
      TabScreenState(
        allTasks: [],
        todaysTasks: [],
        failedTasks: [],
        completedTasks: [],
        status: Status.loading,
        errorMessage: '',
      ),
    );

    _streamSubscription = _itemsRepository.getItemsStream().listen(
      (items) {
        final now = DateTime.now();
        final formattedDate = DateUtils.dateOnly(now);

        final todaysTasks = items
            .where((item) =>
                item.deadline.year == formattedDate.year &&
                item.deadline.month == formattedDate.month &&
                item.deadline.day == formattedDate.day)
            .toList();

        final completedTasks = items.where((item) => item.isChecked).toList();

        final failedTasks = items
            .where((item) =>
                item.deadline.isBefore(formattedDate) &&
                !completedTasks.contains(item))
            .toList();

        final allTasks = items
            .where((item) =>
                !completedTasks.contains(item) &&
                !todaysTasks.contains(item) &&
                !failedTasks.contains(item))
            .toList();

        emit(
          TabScreenState(
            allTasks: allTasks,
            todaysTasks: todaysTasks,
            failedTasks: failedTasks,
            completedTasks: completedTasks,
            status: Status.success,
            errorMessage: '',
          ),
        );
      },
    )..onError(
        (error) {
          emit(
            TabScreenState(
              allTasks: [],
              todaysTasks: [],
              failedTasks: [],
              completedTasks: [],
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

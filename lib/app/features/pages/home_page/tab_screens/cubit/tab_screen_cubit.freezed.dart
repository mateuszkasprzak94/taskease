// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tab_screen_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TabScreenState {
  List<ItemModel> get allTasks => throw _privateConstructorUsedError;
  List<ItemModel> get todaysTasks => throw _privateConstructorUsedError;
  List<ItemModel> get failedTasks => throw _privateConstructorUsedError;
  List<ItemModel> get completedTasks => throw _privateConstructorUsedError;
  dynamic get status => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TabScreenStateCopyWith<TabScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TabScreenStateCopyWith<$Res> {
  factory $TabScreenStateCopyWith(
          TabScreenState value, $Res Function(TabScreenState) then) =
      _$TabScreenStateCopyWithImpl<$Res, TabScreenState>;
  @useResult
  $Res call(
      {List<ItemModel> allTasks,
      List<ItemModel> todaysTasks,
      List<ItemModel> failedTasks,
      List<ItemModel> completedTasks,
      dynamic status,
      String? errorMessage});
}

/// @nodoc
class _$TabScreenStateCopyWithImpl<$Res, $Val extends TabScreenState>
    implements $TabScreenStateCopyWith<$Res> {
  _$TabScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? allTasks = null,
    Object? todaysTasks = null,
    Object? failedTasks = null,
    Object? completedTasks = null,
    Object? status = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      allTasks: null == allTasks
          ? _value.allTasks
          : allTasks // ignore: cast_nullable_to_non_nullable
              as List<ItemModel>,
      todaysTasks: null == todaysTasks
          ? _value.todaysTasks
          : todaysTasks // ignore: cast_nullable_to_non_nullable
              as List<ItemModel>,
      failedTasks: null == failedTasks
          ? _value.failedTasks
          : failedTasks // ignore: cast_nullable_to_non_nullable
              as List<ItemModel>,
      completedTasks: null == completedTasks
          ? _value.completedTasks
          : completedTasks // ignore: cast_nullable_to_non_nullable
              as List<ItemModel>,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as dynamic,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TabScreenStateImplCopyWith<$Res>
    implements $TabScreenStateCopyWith<$Res> {
  factory _$$TabScreenStateImplCopyWith(_$TabScreenStateImpl value,
          $Res Function(_$TabScreenStateImpl) then) =
      __$$TabScreenStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<ItemModel> allTasks,
      List<ItemModel> todaysTasks,
      List<ItemModel> failedTasks,
      List<ItemModel> completedTasks,
      dynamic status,
      String? errorMessage});
}

/// @nodoc
class __$$TabScreenStateImplCopyWithImpl<$Res>
    extends _$TabScreenStateCopyWithImpl<$Res, _$TabScreenStateImpl>
    implements _$$TabScreenStateImplCopyWith<$Res> {
  __$$TabScreenStateImplCopyWithImpl(
      _$TabScreenStateImpl _value, $Res Function(_$TabScreenStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? allTasks = null,
    Object? todaysTasks = null,
    Object? failedTasks = null,
    Object? completedTasks = null,
    Object? status = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_$TabScreenStateImpl(
      allTasks: null == allTasks
          ? _value._allTasks
          : allTasks // ignore: cast_nullable_to_non_nullable
              as List<ItemModel>,
      todaysTasks: null == todaysTasks
          ? _value._todaysTasks
          : todaysTasks // ignore: cast_nullable_to_non_nullable
              as List<ItemModel>,
      failedTasks: null == failedTasks
          ? _value._failedTasks
          : failedTasks // ignore: cast_nullable_to_non_nullable
              as List<ItemModel>,
      completedTasks: null == completedTasks
          ? _value._completedTasks
          : completedTasks // ignore: cast_nullable_to_non_nullable
              as List<ItemModel>,
      status: freezed == status ? _value.status! : status,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$TabScreenStateImpl implements _TabScreenState {
  _$TabScreenStateImpl(
      {final List<ItemModel> allTasks = const [],
      final List<ItemModel> todaysTasks = const [],
      final List<ItemModel> failedTasks = const [],
      final List<ItemModel> completedTasks = const [],
      this.status = Status.initial,
      this.errorMessage})
      : _allTasks = allTasks,
        _todaysTasks = todaysTasks,
        _failedTasks = failedTasks,
        _completedTasks = completedTasks;

  final List<ItemModel> _allTasks;
  @override
  @JsonKey()
  List<ItemModel> get allTasks {
    if (_allTasks is EqualUnmodifiableListView) return _allTasks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allTasks);
  }

  final List<ItemModel> _todaysTasks;
  @override
  @JsonKey()
  List<ItemModel> get todaysTasks {
    if (_todaysTasks is EqualUnmodifiableListView) return _todaysTasks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_todaysTasks);
  }

  final List<ItemModel> _failedTasks;
  @override
  @JsonKey()
  List<ItemModel> get failedTasks {
    if (_failedTasks is EqualUnmodifiableListView) return _failedTasks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_failedTasks);
  }

  final List<ItemModel> _completedTasks;
  @override
  @JsonKey()
  List<ItemModel> get completedTasks {
    if (_completedTasks is EqualUnmodifiableListView) return _completedTasks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_completedTasks);
  }

  @override
  @JsonKey()
  final dynamic status;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'TabScreenState(allTasks: $allTasks, todaysTasks: $todaysTasks, failedTasks: $failedTasks, completedTasks: $completedTasks, status: $status, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TabScreenStateImpl &&
            const DeepCollectionEquality().equals(other._allTasks, _allTasks) &&
            const DeepCollectionEquality()
                .equals(other._todaysTasks, _todaysTasks) &&
            const DeepCollectionEquality()
                .equals(other._failedTasks, _failedTasks) &&
            const DeepCollectionEquality()
                .equals(other._completedTasks, _completedTasks) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_allTasks),
      const DeepCollectionEquality().hash(_todaysTasks),
      const DeepCollectionEquality().hash(_failedTasks),
      const DeepCollectionEquality().hash(_completedTasks),
      const DeepCollectionEquality().hash(status),
      errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TabScreenStateImplCopyWith<_$TabScreenStateImpl> get copyWith =>
      __$$TabScreenStateImplCopyWithImpl<_$TabScreenStateImpl>(
          this, _$identity);
}

abstract class _TabScreenState implements TabScreenState {
  factory _TabScreenState(
      {final List<ItemModel> allTasks,
      final List<ItemModel> todaysTasks,
      final List<ItemModel> failedTasks,
      final List<ItemModel> completedTasks,
      final dynamic status,
      final String? errorMessage}) = _$TabScreenStateImpl;

  @override
  List<ItemModel> get allTasks;
  @override
  List<ItemModel> get todaysTasks;
  @override
  List<ItemModel> get failedTasks;
  @override
  List<ItemModel> get completedTasks;
  @override
  dynamic get status;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$TabScreenStateImplCopyWith<_$TabScreenStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

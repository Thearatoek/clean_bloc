// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bloc_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CurrentState {
  CurrentWeatherModel? get currentWeatherModel =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CurrentStateCopyWith<CurrentState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurrentStateCopyWith<$Res> {
  factory $CurrentStateCopyWith(
          CurrentState value, $Res Function(CurrentState) then) =
      _$CurrentStateCopyWithImpl<$Res, CurrentState>;
  @useResult
  $Res call({CurrentWeatherModel? currentWeatherModel});
}

/// @nodoc
class _$CurrentStateCopyWithImpl<$Res, $Val extends CurrentState>
    implements $CurrentStateCopyWith<$Res> {
  _$CurrentStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentWeatherModel = freezed,
  }) {
    return _then(_value.copyWith(
      currentWeatherModel: freezed == currentWeatherModel
          ? _value.currentWeatherModel
          : currentWeatherModel // ignore: cast_nullable_to_non_nullable
              as CurrentWeatherModel?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CurrentStateImplCopyWith<$Res>
    implements $CurrentStateCopyWith<$Res> {
  factory _$$CurrentStateImplCopyWith(
          _$CurrentStateImpl value, $Res Function(_$CurrentStateImpl) then) =
      __$$CurrentStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({CurrentWeatherModel? currentWeatherModel});
}

/// @nodoc
class __$$CurrentStateImplCopyWithImpl<$Res>
    extends _$CurrentStateCopyWithImpl<$Res, _$CurrentStateImpl>
    implements _$$CurrentStateImplCopyWith<$Res> {
  __$$CurrentStateImplCopyWithImpl(
      _$CurrentStateImpl _value, $Res Function(_$CurrentStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentWeatherModel = freezed,
  }) {
    return _then(_$CurrentStateImpl(
      currentWeatherModel: freezed == currentWeatherModel
          ? _value.currentWeatherModel
          : currentWeatherModel // ignore: cast_nullable_to_non_nullable
              as CurrentWeatherModel?,
    ));
  }
}

/// @nodoc

class _$CurrentStateImpl implements _CurrentState {
  _$CurrentStateImpl({this.currentWeatherModel});

  @override
  final CurrentWeatherModel? currentWeatherModel;

  @override
  String toString() {
    return 'CurrentState(currentWeatherModel: $currentWeatherModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CurrentStateImpl &&
            (identical(other.currentWeatherModel, currentWeatherModel) ||
                other.currentWeatherModel == currentWeatherModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, currentWeatherModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CurrentStateImplCopyWith<_$CurrentStateImpl> get copyWith =>
      __$$CurrentStateImplCopyWithImpl<_$CurrentStateImpl>(this, _$identity);
}

abstract class _CurrentState implements CurrentState {
  factory _CurrentState({final CurrentWeatherModel? currentWeatherModel}) =
      _$CurrentStateImpl;

  @override
  CurrentWeatherModel? get currentWeatherModel;
  @override
  @JsonKey(ignore: true)
  _$$CurrentStateImplCopyWith<_$CurrentStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_current_weather_usecase.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GetCurrentWeatherUsecaseInput {
  String get zipCountryCode => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GetCurrentWeatherUsecaseInputCopyWith<GetCurrentWeatherUsecaseInput>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetCurrentWeatherUsecaseInputCopyWith<$Res> {
  factory $GetCurrentWeatherUsecaseInputCopyWith(
          GetCurrentWeatherUsecaseInput value,
          $Res Function(GetCurrentWeatherUsecaseInput) then) =
      _$GetCurrentWeatherUsecaseInputCopyWithImpl<$Res,
          GetCurrentWeatherUsecaseInput>;
  @useResult
  $Res call({String zipCountryCode});
}

/// @nodoc
class _$GetCurrentWeatherUsecaseInputCopyWithImpl<$Res,
        $Val extends GetCurrentWeatherUsecaseInput>
    implements $GetCurrentWeatherUsecaseInputCopyWith<$Res> {
  _$GetCurrentWeatherUsecaseInputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? zipCountryCode = null,
  }) {
    return _then(_value.copyWith(
      zipCountryCode: null == zipCountryCode
          ? _value.zipCountryCode
          : zipCountryCode // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetCurrentWeatherUsecaseInputImplCopyWith<$Res>
    implements $GetCurrentWeatherUsecaseInputCopyWith<$Res> {
  factory _$$GetCurrentWeatherUsecaseInputImplCopyWith(
          _$GetCurrentWeatherUsecaseInputImpl value,
          $Res Function(_$GetCurrentWeatherUsecaseInputImpl) then) =
      __$$GetCurrentWeatherUsecaseInputImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String zipCountryCode});
}

/// @nodoc
class __$$GetCurrentWeatherUsecaseInputImplCopyWithImpl<$Res>
    extends _$GetCurrentWeatherUsecaseInputCopyWithImpl<$Res,
        _$GetCurrentWeatherUsecaseInputImpl>
    implements _$$GetCurrentWeatherUsecaseInputImplCopyWith<$Res> {
  __$$GetCurrentWeatherUsecaseInputImplCopyWithImpl(
      _$GetCurrentWeatherUsecaseInputImpl _value,
      $Res Function(_$GetCurrentWeatherUsecaseInputImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? zipCountryCode = null,
  }) {
    return _then(_$GetCurrentWeatherUsecaseInputImpl(
      zipCountryCode: null == zipCountryCode
          ? _value.zipCountryCode
          : zipCountryCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetCurrentWeatherUsecaseInputImpl
    implements _GetCurrentWeatherUsecaseInput {
  _$GetCurrentWeatherUsecaseInputImpl({required this.zipCountryCode});

  @override
  final String zipCountryCode;

  @override
  String toString() {
    return 'GetCurrentWeatherUsecaseInput(zipCountryCode: $zipCountryCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetCurrentWeatherUsecaseInputImpl &&
            (identical(other.zipCountryCode, zipCountryCode) ||
                other.zipCountryCode == zipCountryCode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, zipCountryCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetCurrentWeatherUsecaseInputImplCopyWith<
          _$GetCurrentWeatherUsecaseInputImpl>
      get copyWith => __$$GetCurrentWeatherUsecaseInputImplCopyWithImpl<
          _$GetCurrentWeatherUsecaseInputImpl>(this, _$identity);
}

abstract class _GetCurrentWeatherUsecaseInput
    implements GetCurrentWeatherUsecaseInput {
  factory _GetCurrentWeatherUsecaseInput(
          {required final String zipCountryCode}) =
      _$GetCurrentWeatherUsecaseInputImpl;

  @override
  String get zipCountryCode;
  @override
  @JsonKey(ignore: true)
  _$$GetCurrentWeatherUsecaseInputImplCopyWith<
          _$GetCurrentWeatherUsecaseInputImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$GetCurrentWeatherUsecaseOutput {
  CurrentWeatherModel? get currentWeatherModel =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GetCurrentWeatherUsecaseOutputCopyWith<GetCurrentWeatherUsecaseOutput>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetCurrentWeatherUsecaseOutputCopyWith<$Res> {
  factory $GetCurrentWeatherUsecaseOutputCopyWith(
          GetCurrentWeatherUsecaseOutput value,
          $Res Function(GetCurrentWeatherUsecaseOutput) then) =
      _$GetCurrentWeatherUsecaseOutputCopyWithImpl<$Res,
          GetCurrentWeatherUsecaseOutput>;
  @useResult
  $Res call({CurrentWeatherModel? currentWeatherModel});
}

/// @nodoc
class _$GetCurrentWeatherUsecaseOutputCopyWithImpl<$Res,
        $Val extends GetCurrentWeatherUsecaseOutput>
    implements $GetCurrentWeatherUsecaseOutputCopyWith<$Res> {
  _$GetCurrentWeatherUsecaseOutputCopyWithImpl(this._value, this._then);

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
abstract class _$$GetCurrentWeatherUsecaseOutputImplCopyWith<$Res>
    implements $GetCurrentWeatherUsecaseOutputCopyWith<$Res> {
  factory _$$GetCurrentWeatherUsecaseOutputImplCopyWith(
          _$GetCurrentWeatherUsecaseOutputImpl value,
          $Res Function(_$GetCurrentWeatherUsecaseOutputImpl) then) =
      __$$GetCurrentWeatherUsecaseOutputImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({CurrentWeatherModel? currentWeatherModel});
}

/// @nodoc
class __$$GetCurrentWeatherUsecaseOutputImplCopyWithImpl<$Res>
    extends _$GetCurrentWeatherUsecaseOutputCopyWithImpl<$Res,
        _$GetCurrentWeatherUsecaseOutputImpl>
    implements _$$GetCurrentWeatherUsecaseOutputImplCopyWith<$Res> {
  __$$GetCurrentWeatherUsecaseOutputImplCopyWithImpl(
      _$GetCurrentWeatherUsecaseOutputImpl _value,
      $Res Function(_$GetCurrentWeatherUsecaseOutputImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentWeatherModel = freezed,
  }) {
    return _then(_$GetCurrentWeatherUsecaseOutputImpl(
      currentWeatherModel: freezed == currentWeatherModel
          ? _value.currentWeatherModel
          : currentWeatherModel // ignore: cast_nullable_to_non_nullable
              as CurrentWeatherModel?,
    ));
  }
}

/// @nodoc

class _$GetCurrentWeatherUsecaseOutputImpl
    implements _GetCurrentWeatherUsecaseOutput {
  _$GetCurrentWeatherUsecaseOutputImpl({this.currentWeatherModel});

  @override
  final CurrentWeatherModel? currentWeatherModel;

  @override
  String toString() {
    return 'GetCurrentWeatherUsecaseOutput(currentWeatherModel: $currentWeatherModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetCurrentWeatherUsecaseOutputImpl &&
            (identical(other.currentWeatherModel, currentWeatherModel) ||
                other.currentWeatherModel == currentWeatherModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, currentWeatherModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetCurrentWeatherUsecaseOutputImplCopyWith<
          _$GetCurrentWeatherUsecaseOutputImpl>
      get copyWith => __$$GetCurrentWeatherUsecaseOutputImplCopyWithImpl<
          _$GetCurrentWeatherUsecaseOutputImpl>(this, _$identity);
}

abstract class _GetCurrentWeatherUsecaseOutput
    implements GetCurrentWeatherUsecaseOutput {
  factory _GetCurrentWeatherUsecaseOutput(
          {final CurrentWeatherModel? currentWeatherModel}) =
      _$GetCurrentWeatherUsecaseOutputImpl;

  @override
  CurrentWeatherModel? get currentWeatherModel;
  @override
  @JsonKey(ignore: true)
  _$$GetCurrentWeatherUsecaseOutputImplCopyWith<
          _$GetCurrentWeatherUsecaseOutputImpl>
      get copyWith => throw _privateConstructorUsedError;
}

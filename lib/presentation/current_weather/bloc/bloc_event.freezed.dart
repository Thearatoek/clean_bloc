// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bloc_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CurrentWeatherEvent {
  String get zipCountryCode => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CurrentWeatherEventCopyWith<CurrentWeatherEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurrentWeatherEventCopyWith<$Res> {
  factory $CurrentWeatherEventCopyWith(
          CurrentWeatherEvent value, $Res Function(CurrentWeatherEvent) then) =
      _$CurrentWeatherEventCopyWithImpl<$Res, CurrentWeatherEvent>;
  @useResult
  $Res call({String zipCountryCode});
}

/// @nodoc
class _$CurrentWeatherEventCopyWithImpl<$Res, $Val extends CurrentWeatherEvent>
    implements $CurrentWeatherEventCopyWith<$Res> {
  _$CurrentWeatherEventCopyWithImpl(this._value, this._then);

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
abstract class _$$CurrentWeatherEventImplCopyWith<$Res>
    implements $CurrentWeatherEventCopyWith<$Res> {
  factory _$$CurrentWeatherEventImplCopyWith(_$CurrentWeatherEventImpl value,
          $Res Function(_$CurrentWeatherEventImpl) then) =
      __$$CurrentWeatherEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String zipCountryCode});
}

/// @nodoc
class __$$CurrentWeatherEventImplCopyWithImpl<$Res>
    extends _$CurrentWeatherEventCopyWithImpl<$Res, _$CurrentWeatherEventImpl>
    implements _$$CurrentWeatherEventImplCopyWith<$Res> {
  __$$CurrentWeatherEventImplCopyWithImpl(_$CurrentWeatherEventImpl _value,
      $Res Function(_$CurrentWeatherEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? zipCountryCode = null,
  }) {
    return _then(_$CurrentWeatherEventImpl(
      zipCountryCode: null == zipCountryCode
          ? _value.zipCountryCode
          : zipCountryCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CurrentWeatherEventImpl implements _CurrentWeatherEvent {
  _$CurrentWeatherEventImpl({required this.zipCountryCode});

  @override
  final String zipCountryCode;

  @override
  String toString() {
    return 'CurrentWeatherEvent(zipCountryCode: $zipCountryCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CurrentWeatherEventImpl &&
            (identical(other.zipCountryCode, zipCountryCode) ||
                other.zipCountryCode == zipCountryCode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, zipCountryCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CurrentWeatherEventImplCopyWith<_$CurrentWeatherEventImpl> get copyWith =>
      __$$CurrentWeatherEventImplCopyWithImpl<_$CurrentWeatherEventImpl>(
          this, _$identity);
}

abstract class _CurrentWeatherEvent implements CurrentWeatherEvent {
  factory _CurrentWeatherEvent({required final String zipCountryCode}) =
      _$CurrentWeatherEventImpl;

  @override
  String get zipCountryCode;
  @override
  @JsonKey(ignore: true)
  _$$CurrentWeatherEventImplCopyWith<_$CurrentWeatherEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

import 'package:json_annotation/json_annotation.dart';

part 'server_error.g.dart';

@JsonSerializable()
class ServerError {
  /// server-defined status code
  final int? generalServerStatusCode;

  /// server-defined error id
  final String? generalServerErrorId;

  /// server-defined message
  final String? generalMessage;

  /// use if error null instead errors
  final String? code;

  final String? message;

  final String? description;

  final String? originalErrorCode;

  final String? traceId;

  final String? serverDateTime;

  const ServerError({
    this.code,
    this.message,
    this.description,
    this.originalErrorCode,
    this.traceId,
    this.serverDateTime,
    this.generalServerStatusCode,
    this.generalServerErrorId,
    this.generalMessage,
  });

  factory ServerError.fromJson(Map<String, dynamic> json) =>
      _$ServerErrorFromJson(json);

  Map<String, dynamic> toJson() => _$ServerErrorToJson(this);

  static const defaultGeneralServerStatusCode = -1;
  static const defaultGeneralServerErrorId = '';
  static const defaultGeneralMessage = '';
}

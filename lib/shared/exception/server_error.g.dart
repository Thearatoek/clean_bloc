// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'server_error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServerError _$ServerErrorFromJson(Map<String, dynamic> json) => ServerError(
      code: json['code'] as String?,
      message: json['message'] as String?,
      description: json['description'] as String?,
      originalErrorCode: json['originalErrorCode'] as String?,
      traceId: json['traceId'] as String?,
      serverDateTime: json['serverDateTime'] as String?,
      generalServerStatusCode:
          (json['generalServerStatusCode'] as num?)?.toInt(),
      generalServerErrorId: json['generalServerErrorId'] as String?,
      generalMessage: json['generalMessage'] as String?,
    );

Map<String, dynamic> _$ServerErrorToJson(ServerError instance) =>
    <String, dynamic>{
      'generalServerStatusCode': instance.generalServerStatusCode,
      'generalServerErrorId': instance.generalServerErrorId,
      'generalMessage': instance.generalMessage,
      'code': instance.code,
      'message': instance.message,
      'description': instance.description,
      'originalErrorCode': instance.originalErrorCode,
      'traceId': instance.traceId,
      'serverDateTime': instance.serverDateTime,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TodayUser _$$_TodayUserFromJson(Map<String, dynamic> json) => _$_TodayUser(
      sessionId: json['sessionId'] as String?,
      email: json['email'] as String,
      password: json['password'] as String?,
      userId: json['userId'] as String?,
    );

Map<String, dynamic> _$$_TodayUserToJson(_$_TodayUser instance) =>
    <String, dynamic>{
      'sessionId': instance.sessionId,
      'email': instance.email,
      'password': instance.password,
      'userId': instance.userId,
    };

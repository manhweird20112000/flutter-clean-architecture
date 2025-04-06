// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConversationModelImpl _$$ConversationModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ConversationModelImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
      conversationType:
          $enumDecode(_$ConversationTypeEnumMap, json['conversationType']),
      unreadMessages: (json['unreadMessages'] as num?)?.toInt(),
      latestMessage:
          _messageFromJson(json['latestMessage'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ConversationModelImplToJson(
        _$ConversationModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'images': instance.images,
      'conversationType': _$ConversationTypeEnumMap[instance.conversationType]!,
      'unreadMessages': instance.unreadMessages,
      'latestMessage': _messageToJson(instance.latestMessage),
    };

const _$ConversationTypeEnumMap = {
  ConversationType.single: 'single',
  ConversationType.group: 'group',
};

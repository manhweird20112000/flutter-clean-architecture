import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/conversation.dart';
import '../../domain/entities/message.dart';

part 'conversation_model.freezed.dart';
part 'conversation_model.g.dart';

@freezed
class ConversationModel with _$ConversationModel {
  const factory ConversationModel({
    required int id,
    required String name,
    required List<String> images,
    required ConversationType conversationType,
    int? unreadMessages,
    @JsonKey(fromJson: _messageFromJson, toJson: _messageToJson)
    required Message latestMessage,
  }) = _ConversationModel;

  factory ConversationModel.fromJson(Map<String, dynamic> json) =>
      _$ConversationModelFromJson(json);

  factory ConversationModel.fromEntity(Conversation conversation) =>
      ConversationModel(
          id: conversation.id,
          name: conversation.name,
          images: conversation.images,
          conversationType: conversation.conversationType,
          latestMessage: conversation.latestMessage);

  const ConversationModel._();

  Conversation toEntity() => Conversation(
      id: id,
      name: name,
      images: images,
      conversationType: conversationType,
      latestMessage: latestMessage);
}

// Custom JSON conversion for Message class
Message _messageFromJson(Map<String, dynamic> json) {
  return Message(
    id: json['id'] as int,
    content: json['content'] as String,
    senderId: json['senderId'] as int,
    senderName: json['senderName'] as String,
    type: MessageType.values[json['type'] as int],
    createdAt: DateTime.parse(json['createdAt'] as String),
  );
}

Map<String, dynamic> _messageToJson(Message message) {
  return {
    'id': message.id,
    'content': message.content,
    'senderId': message.senderId,
    'senderName': message.senderName,
    'type': message.type.index,
    'createdAt': message.createdAt.toIso8601String(),
  };
}

// Extension method is redundant since we have the method in the class already
// But keeping it for backward compatibility
extension ConversationModelX on ConversationModel {
  Conversation toEntity() => Conversation(
      id: id,
      name: name,
      images: images,
      conversationType: conversationType,
      latestMessage: latestMessage);
}

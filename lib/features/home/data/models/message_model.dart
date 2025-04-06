// import 'package:flutter_boilerplate/features/home/domain/entities/message.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';

// part 'messsage_model.freezed.dart';
// part 'messsage_model.g.dart';

// @freezed
// class MessageModel with _$MessageModel {
//   const factory MessageModel({
//     required int id,
//     required String content,
//     required int senderId,
//     required String senderName,
//     required MessageType type,
//     required DateTime createdAt,
//   }) = _MessageModel;

//   factory MessageModel.fromJson(Map<String, dynamic> json) =>
//       _$MessageModelFromJson(json);

//   factory MessageModel.fromEntity(Message message) => MessageModel(
//       id: message.id,
//       content: message.content,
//       senderId: message.senderId,
//       senderName: message.senderName,
//       createdAt: message.createdAt,
//       type: message.type);

//   const MessageModel._();

//   Message toEntity() => Message(
//       id: id,
//       content: content,
//       senderId: senderId,
//       senderName: senderName,
//       type: type,
//       createdAt: createdAt);
// }

// extension MessageModelX on MessageModel {
//   Message toEntity() => Message(
//       id: id,
//       content: content,
//       senderId: senderId,
//       senderName: senderName,
//       type: type,
//       createdAt: createdAt);
// }

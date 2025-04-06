import 'package:equatable/equatable.dart';

enum MessageType { text, image, video, voice }

class Message extends Equatable {
  final int id;
  final String content;
  final int senderId;
  final String senderName;
  final MessageType type;
  final DateTime createdAt;

  const Message(
      {required this.id,
      required this.content,
      required this.senderId,
      required this.senderName,
      required this.type,
      required this.createdAt});

  @override
  List<Object?> get props => [id, content, senderId, senderName, type];
}

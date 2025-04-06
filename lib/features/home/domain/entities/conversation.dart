import 'package:equatable/equatable.dart';
import 'package:flutter_boilerplate/features/home/domain/entities/message.dart';

enum ConversationType { single, group }

class Conversation extends Equatable {
  final int id;
  final String name;
  final List<String> images;
  final ConversationType conversationType;
  final int? unreadMessages;
  final Message latestMessage;

  const Conversation(
      {required this.id,
      required this.name,
      required this.images,
      required this.conversationType,
      required this.latestMessage,
      this.unreadMessages = 0});

  @override
  List<Object?> get props => [id];
}

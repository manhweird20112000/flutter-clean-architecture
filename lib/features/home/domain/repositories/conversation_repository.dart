import 'package:dartz/dartz.dart';
import 'package:flutter_boilerplate/core/error/failures.dart';
import 'package:flutter_boilerplate/features/home/domain/entities/conversation.dart';

abstract class ConversationRepository {
  Future<Either<Failure, List<Conversation>>> fetchConversations();
}

import 'package:dartz/dartz.dart';
import 'package:flutter_boilerplate/core/error/failures.dart';
import 'package:flutter_boilerplate/features/home/domain/entities/conversation.dart';
import 'package:flutter_boilerplate/features/home/domain/repositories/conversation_repository.dart';

class GetConversationsUseCase {
  final ConversationRepository repo;

  GetConversationsUseCase(this.repo);

  Future<Either<Failure, List<Conversation>>> execute() {
    return repo.fetchConversations();
  }
}

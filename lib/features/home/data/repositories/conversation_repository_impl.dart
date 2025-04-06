import 'package:dartz/dartz.dart';

import 'package:flutter_boilerplate/core/error/failures.dart';
import 'package:flutter_boilerplate/features/home/data/datasources/conversation_remote_data_source.dart';

import 'package:flutter_boilerplate/features/home/domain/entities/conversation.dart';

import '../../domain/repositories/conversation_repository.dart';

class ConversationRepositoryImpl implements ConversationRepository {
  final ConversationRemoteDataSource remoteDatasource;

  ConversationRepositoryImpl({required this.remoteDatasource});

  @override
  Future<Either<Failure, List<Conversation>>> fetchConversations() async {
    try {
      final resp = await remoteDatasource.fetchConversations();
      return const Right([]);
      // return Right(resp.toEntity());
    } catch (e) {
      return const Left(ServerFailure(message: 'Unknown error occurred'));
    }
  }
}

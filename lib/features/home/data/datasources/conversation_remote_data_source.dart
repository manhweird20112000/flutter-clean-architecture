import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/conversation_model.dart';

part 'conversation_remote_data_source.g.dart';

@RestApi()
abstract class ConversationRemoteDataSource {
  factory ConversationRemoteDataSource(Dio dio) = _ConversationRemoteDataSource;

  @GET('/conversations')
  Future<List<ConversationModel>> fetchConversations();
}

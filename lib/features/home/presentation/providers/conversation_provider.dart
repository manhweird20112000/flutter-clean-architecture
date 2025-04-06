import 'package:flutter_boilerplate/core/network/dio_client.dart';
import 'package:flutter_boilerplate/features/home/data/datasources/conversation_remote_data_source.dart';
import 'package:flutter_boilerplate/features/home/data/repositories/conversation_repository_impl.dart';
import 'package:flutter_boilerplate/features/home/domain/entities/message.dart';
import 'package:flutter_boilerplate/features/home/domain/repositories/conversation_repository.dart';
import 'package:flutter_boilerplate/features/home/domain/usecases/get_conversations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/conversation.dart';

part 'conversation_provider.g.dart';

class ConversationState {
  final List<Conversation> conversations;

  ConversationState({required this.conversations});

  factory ConversationState.initial() => ConversationState(conversations: []);

  ConversationState copyWith({
    List<Conversation>? conversations,
  }) {
    return ConversationState(
        conversations: conversations ?? this.conversations);
  }
}

@riverpod
class Home extends _$Home {
  @override
  ConversationState build() {
    return ConversationState.initial();
  }

  Future<void> fetchConversations() async {
    final List<Conversation> data = [
      Conversation(
          id: 1,
          name: '张喜娟',
          images: const [
            'https://i.pinimg.com/736x/d0/0f/eb/d00feb73381985baacd09af3da797e75.jpg'
          ],
          conversationType: ConversationType.single,
          latestMessage: Message(
              id: 1,
              content: '这行业没救了',
              senderId: 1,
              senderName: '落魄平面设计师',
              type: MessageType.text,
              createdAt: DateTime.now())),
      Conversation(
          id: 2,
          name: '老板发钱群',
          images: const [
            'https://i.pinimg.com/736x/cf/4c/2e/cf4c2e5180b02e6025778a19a6a9779a.jpg',
            'https://i.pinimg.com/736x/1f/09/af/1f09afe5019b8f415de0f7b7d5c8d4d9.jpg',
            'https://i.pinimg.com/736x/b7/cf/7e/b7cf7e25610dc35f671999cd809b3f1c.jpg'
          ],
          conversationType: ConversationType.group,
          latestMessage: Message(
              id: 1,
              content: '发钱的都是老板 👋',
              senderId: 1,
              senderName: '大老板',
              type: MessageType.text,
              createdAt: DateTime.now())),
      Conversation(
          id: 3,
          name: '老板发钱群',
          images: const [
            'https://i.pinimg.com/736x/ce/e6/bd/cee6bd079e7224b86d933116c929eb2e.jpg'
          ],
          conversationType: ConversationType.single,
          latestMessage: Message(
              id: 1,
              content: '发钱的都是老板 👋',
              senderId: 1,
              senderName: '大老板',
              type: MessageType.text,
              createdAt: DateTime.now())),
      Conversation(
          id: 4,
          name: '老板发钱群',
          images: const [
            'https://i.pinimg.com/736x/b5/72/e0/b572e0e23c0f64a3c2929f038f9efdcb.jpg',
            'https://i.pinimg.com/736x/1d/4b/08/1d4b08218d897bc5aa09f010ddc7bed8.jpg',
          ],
          conversationType: ConversationType.group,
          latestMessage: Message(
              id: 1,
              content: '发钱的都是老板 👋',
              senderId: 1,
              senderName: '大老板',
              type: MessageType.text,
              createdAt: DateTime.now())),
      Conversation(
          id: 5,
          name: '张喜娟',
          images: const [
            'https://i.pinimg.com/736x/d0/0f/eb/d00feb73381985baacd09af3da797e75.jpg',
            'https://i.pinimg.com/736x/2c/4c/92/2c4c92a32effcaaf38b0f280fc333b4a.jpg',
            'https://i.pinimg.com/736x/80/07/e6/8007e640ef4a876f0708d03418b1b4c7.jpg',
            'https://i.pinimg.com/736x/83/25/ef/8325ef78f2352a3cb366321c7aa6d0ef.jpg'
          ],
          conversationType: ConversationType.group,
          latestMessage: Message(
              id: 1,
              content: '这行业没救了',
              senderId: 1,
              senderName: '落魄平面设计师',
              type: MessageType.text,
              createdAt: DateTime.now())),
      Conversation(
          id: 6,
          name: '老板发钱群',
          images: const [
            'https://i.pinimg.com/736x/b7/cf/7e/b7cf7e25610dc35f671999cd809b3f1c.jpg'
          ],
          conversationType: ConversationType.single,
          latestMessage: Message(
              id: 1,
              content: '发钱的都是老板 👋',
              senderId: 1,
              senderName: '大老板',
              type: MessageType.text,
              createdAt: DateTime.now())),
      Conversation(
          id: 7,
          name: '老板发钱群',
          images: const [
            'https://i.pinimg.com/736x/ce/e6/bd/cee6bd079e7224b86d933116c929eb2e.jpg'
          ],
          conversationType: ConversationType.single,
          latestMessage: Message(
              id: 1,
              content: '发钱的都是老板 👋',
              senderId: 1,
              senderName: '大老板',
              type: MessageType.text,
              createdAt: DateTime.now())),
      Conversation(
          id: 8,
          name: '老板发钱群',
          images: const [
            'https://i.pinimg.com/736x/b5/72/e0/b572e0e23c0f64a3c2929f038f9efdcb.jpg'
          ],
          conversationType: ConversationType.single,
          latestMessage: Message(
              id: 1,
              content: '发钱的都是老板 👋',
              senderId: 1,
              senderName: '大老板',
              type: MessageType.text,
              createdAt: DateTime.now())),
      Conversation(
          id: 9,
          name: '老板发钱群',
          images: const [
            'https://i.pinimg.com/736x/b5/72/e0/b572e0e23c0f64a3c2929f038f9efdcb.jpg'
          ],
          conversationType: ConversationType.single,
          latestMessage: Message(
              id: 1,
              content: '发钱的都是老板 👋',
              senderId: 1,
              senderName: '大老板',
              type: MessageType.text,
              createdAt: DateTime.now())),
      Conversation(
          id: 10,
          name: '老板发钱群',
          images: const [
            'https://i.pinimg.com/736x/b5/72/e0/b572e0e23c0f64a3c2929f038f9efdcb.jpg'
          ],
          conversationType: ConversationType.single,
          latestMessage: Message(
              id: 1,
              content: '发钱的都是老板 👋',
              senderId: 1,
              senderName: '大老板',
              type: MessageType.text,
              createdAt: DateTime.now()))
    ];

    state = state.copyWith(conversations: data);
  }
}

final conversationRemoteDataSourceProvider = Provider((ref) {
  final dio = ref.watch(dioProvider);
  return ConversationRemoteDataSource(dio);
});

final conversationRepositoryProvider = Provider<ConversationRepository>((ref) {
  return ConversationRepositoryImpl(
      remoteDatasource: ref.watch(conversationRemoteDataSourceProvider));
});

@riverpod
GetConversationsUseCase getConversationsUseCase(
    GetConversationsUseCaseRef ref) {
  final repository = ref.watch(conversationRepositoryProvider);
  return GetConversationsUseCase(repository);
}

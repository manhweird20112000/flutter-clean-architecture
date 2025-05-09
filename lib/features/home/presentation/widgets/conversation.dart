import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jiffy/jiffy.dart';

import '../../../../config/theme/app_theme.dart';
import '../../domain/entities/conversation.dart';

const double MAX_SIZE_AVATAR = 60;

class ConversationItem extends StatelessWidget {
  final Conversation conversation;

  const ConversationItem({super.key, required this.conversation});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // GoRouter.of(context).goNamed('chat',
        //     pathParameters: {'conversationId': conversation.id.toString()});
        GoRouter.of(context).go('/chat/${conversation.id.toString()}');
      },
      child: Container(
        padding:
            const EdgeInsets.symmetric(horizontal: AppSpacing.m, vertical: 10),
        child: Row(
          spacing: 18,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            conversation.conversationType == ConversationType.group
                ? buildAvatar(context, conversation.images)
                : ClipRRect(
                    borderRadius: BorderRadius.circular(AppSpacing.s),
                    child: Image.network(
                      conversation.images.first,
                      width: MAX_SIZE_AVATAR,
                      height: MAX_SIZE_AVATAR,
                      fit: BoxFit.cover,
                    ),
                  ),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      conversation.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontSize: AppSpacing.m,
                          fontFamily: AppTextStyles.fontFamily,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textPrimary),
                    ),
                    Text(
                      Jiffy.parse(
                              conversation.latestMessage.createdAt.toString())
                          .toNow(),
                      style: const TextStyle(
                          fontSize: 12,
                          fontFamily: AppTextStyles.fontFamily,
                          color: AppColors.textSecondary,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  spacing: AppSpacing.m,
                  children: [
                    Expanded(
                        child: Text(
                            '${conversation.latestMessage.senderName}:${conversation.latestMessage.content}',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontSize: 14,
                                fontFamily: AppTextStyles.fontFamily,
                                fontWeight: FontWeight.normal,
                                color: AppColors.textSecondary))),
                    conversation.unreadMessages! > 0
                        ? Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 2, horizontal: AppSpacing.s),
                            decoration: BoxDecoration(
                              color: AppColors.supportDanger,
                              borderRadius: BorderRadius.circular(
                                  50), // rounded pill shape
                            ),
                            constraints: const BoxConstraints(minWidth: 20),
                            child: Center(
                              child: Text(
                                  conversation.unreadMessages.toString(),
                                  style: const TextStyle(
                                      fontSize: 13,
                                      fontFamily: AppTextStyles.fontFamily,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      leadingDistribution:
                                          TextLeadingDistribution.even)),
                            ))
                        : Container()
                  ],
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}

Widget buildAvatar(BuildContext context, List<String> images) {
  return SizedBox(
      width: MAX_SIZE_AVATAR,
      child: Wrap(
        spacing: 5,
        runSpacing: 5,
        children: images.asMap().entries.map((image) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(AppSpacing.xs),
            child: Image.network(
              image.value,
              width: image.key == 2 && images.length == 3
                  ? MAX_SIZE_AVATAR
                  : (MAX_SIZE_AVATAR - 5) / 2,
              height: images.length == 2
                  ? MAX_SIZE_AVATAR
                  : (MAX_SIZE_AVATAR - 5) / 2,
              fit: BoxFit.cover,
            ),
          );
        }).toList(),
      ));
}

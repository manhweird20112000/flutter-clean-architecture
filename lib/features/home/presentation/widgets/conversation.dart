import 'package:flutter/material.dart';

import '../../../../config/theme/app_theme.dart';
import '../../domain/entities/conversation.dart';

class ConversationItem extends StatelessWidget {
  final Conversation conversation;

  const ConversationItem({super.key, required this.conversation});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        spacing: 18,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(AppSpacing.s),
            child: Image.network(
              conversation.images.first,
              width: 60,
              height: 60,
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
                    conversation.latestMessage.createdAt.toString(),
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
                            borderRadius:
                                BorderRadius.circular(50), // rounded pill shape
                          ),
                          constraints: const BoxConstraints(minWidth: 20),
                          child: Center(
                            child: Text(conversation.unreadMessages.toString(),
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
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../config/theme/app_theme.dart';

class ChatPage extends ConsumerStatefulWidget {
  final String conversationId;
  const ChatPage({super.key, required this.conversationId});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ChatPageState();
}

class _ChatPageState extends ConsumerState<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        actionsPadding: const EdgeInsets.symmetric(horizontal: AppSpacing.m),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                onPressed: () {
                  GoRouter.of(context).go('/');
                },
                icon: SvgPicture.asset(
                  'assets/icons/arrow-left.svg',
                  width: 30.0,
                  height: 30.0,
                )),
            Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 3, horizontal: AppSpacing.s),
                decoration: BoxDecoration(
                  color: const Color(0xFFF5FAF7),
                  borderRadius: BorderRadius.circular(50), // rounded pill shape
                ),
                constraints: const BoxConstraints(minWidth: 20),
                child: const Center(
                  child: Text('256',
                      style: TextStyle(
                          fontSize: 13,
                          fontFamily: AppTextStyles.fontFamily,
                          color: AppColors.secondary,
                          fontWeight: FontWeight.w600,
                          leadingDistribution: TextLeadingDistribution.even)),
                ))
          ],
        ),
        actions: [
          IconButton(
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              onPressed: () {
                GoRouter.of(context).push('/');
              },
              icon: SvgPicture.asset(
                'assets/icons/phone.svg',
                width: 30.0,
                height: 30.0,
              )),
          const SizedBox(
            width: AppSpacing.s,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(AppSpacing.l),
            child: Image.network(
              'https://i.pinimg.com/736x/52/84/86/52848619a8e5630a2b8a337c5187847e.jpg',
              width: 30,
              height: 30,
              fit: BoxFit.cover,
            ),
          )
        ],
      ),
      body: const Center(
        child: Text('Chát'),
      ),
    );
  }
}

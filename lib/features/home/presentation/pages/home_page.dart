import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/config/theme/app_theme.dart';
import 'package:flutter_boilerplate/features/home/presentation/providers/conversation_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../widgets/tab_bar.dart';
import '../widgets/conversation.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  int TAB_FRIENDS = 0;
  int TAB_GROUP = 1;
  int TAB_ADS = 2;

  int indexTabActive = 0;

  @override
  void initState() {
    super.initState();
    fetchConversations();
  }

  void fetchConversations() {
    ref.read(homeProvider.notifier).fetchConversations();
  }

  @override
  Widget build(BuildContext context) {
    final conversations = ref.watch(homeProvider).conversations;
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0,
            titleSpacing: AppSpacing.m,
            backgroundColor: Colors.white,
            foregroundColor: Colors.white,
            actionsPadding:
                const EdgeInsets.only(left: 20, right: AppSpacing.s),
            title: const Align(
              alignment: Alignment.topLeft,
              child: Text(
                '微信 (722)',
                style: TextStyle(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.w600,
                    fontSize: 20.0,
                    fontFamily: AppTextStyles.fontFamily),
              ),
            ),
            actions: [
              IconButton(
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  onPressed: () {
                    fetchConversations();
                  },
                  icon: SvgPicture.asset(
                    'assets/icons/search.svg',
                    width: 30.0,
                    height: 30.0,
                  )),
              IconButton(
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  onPressed: () {
                    print('Add...');
                  },
                  icon: SvgPicture.asset(
                    'assets/icons/plus.svg',
                    width: 30.0,
                    height: 30.0,
                  ))
            ],
          ),
          body: Column(children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.m, vertical: AppSpacing.xs),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      TabBarConversation(
                        text: '好友',
                        index: TAB_FRIENDS,
                        isSelected: indexTabActive == TAB_FRIENDS,
                        onChoose: () {
                          setState(() {
                            indexTabActive = TAB_FRIENDS;
                          });
                        },
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      TabBarConversation(
                        text: '群组',
                        index: TAB_GROUP,
                        isSelected: indexTabActive == TAB_GROUP,
                        onChoose: () {
                          setState(() {
                            indexTabActive = TAB_GROUP;
                          });
                        },
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      TabBarConversation(
                        text: '公众号',
                        index: TAB_ADS,
                        isSelected: indexTabActive == TAB_ADS,
                        onChoose: () {
                          setState(() {
                            indexTabActive = TAB_ADS;
                          });
                        },
                      )
                    ],
                  ),
                  IconButton(
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      onPressed: () {
                        print('Cast...');
                      },
                      icon: SvgPicture.asset(
                        'assets/icons/cast.svg',
                        width: 30.0,
                        height: 30.0,
                      ))
                ],
              ),
            ),
            Expanded(
                child: IndexedStack(
              index: indexTabActive,
              children: [
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: conversations.length,
                    itemBuilder: (context, index) {
                      return ConversationItem(
                          conversation: conversations[index]);
                    }),
                const Center(child: Text('Tab 2 Content')),
                const Center(child: Text('Tab 3 Content')),
              ],
            ))
          ]),
        ));
  }
}

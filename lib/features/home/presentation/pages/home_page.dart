import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/config/theme/app_theme.dart';
import 'package:flutter_boilerplate/features/home/presentation/widgets/conversation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/presentation/widgets/app_button.dart';
import '../../../../core/presentation/widgets/loading_overlay.dart';
import '../../../auth/presentation/providers/auth_provider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);
    final user = authState.user;
    final isLoading = authState.status == AuthStatus.loading;

    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            titleSpacing: AppSpacing.m,
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
                  onPressed: () {
                    print('Search...');
                  },
                  icon: SvgPicture.asset(
                    'assets/icons/search.svg',
                    width: 30.0,
                    height: 30.0,
                  )),
              IconButton(
                  padding: EdgeInsets.zero,
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
          body:
              const TabBarView(children: [Text('好友'), Text('群组'), Text('公众号')]),
        ));
  }
}

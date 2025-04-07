import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/config/theme/app_theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class BottomItemBar extends ConsumerWidget {
  final String path;
  final String icon;
  final int? badge;

  const BottomItemBar(
      {super.key, required this.path, required this.icon, this.badge});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).go(path);
      },
      child: Align(
        alignment: Alignment.topLeft,
        child: SizedBox(
          width: (MediaQuery.sizeOf(context).width - 40) / 4,
          child: SvgPicture.asset(
            icon,
            width: 30,
            height: 30,
          ),
        ),
      ),
    );
  }
}

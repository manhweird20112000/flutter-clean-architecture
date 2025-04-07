import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/core/presentation/widgets/bottom_item_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BottomBar extends ConsumerWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 84,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      color: const Color(0xFFF5FAF7),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BottomItemBar(
            icon: 'assets/icons/conversation.svg',
            path: '/',
          ),
          BottomItemBar(
            icon: 'assets/icons/book.svg',
            path: '/contact',
          ),
          BottomItemBar(
            icon: 'assets/icons/gallery.svg',
            path: '/gallery',
          ),
          BottomItemBar(
            icon: 'assets/icons/user.svg',
            path: '/profile',
          )
        ],
      ),
    );
  }
}

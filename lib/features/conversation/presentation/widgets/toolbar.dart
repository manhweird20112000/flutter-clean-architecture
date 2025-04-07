import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/config/theme/app_theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

class ToolBarChat extends ConsumerStatefulWidget {
  const ToolBarChat({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ToolBarChatState();
}

class _ToolBarChatState extends ConsumerState<ToolBarChat> {
  final promptController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      padding:
          const EdgeInsets.symmetric(horizontal: AppSpacing.m, vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.sizeOf(context).width -
                (AppSpacing.m * 2) -
                45 * 2 -
                AppSpacing.s * 2,
            height: 45,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: const Color(0xFFF5FAF7),
            ),
            child: Row(
              children: [
                InkWell(
                  child: SvgPicture.asset(
                    'assets/icons/emoji.svg',
                    width: 24,
                    height: 24,
                  ),
                ),
                const SizedBox(
                  width: AppSpacing.s,
                ),
                Expanded(
                    child: TextField(
                  minLines: 1,
                  maxLines: 3,
                  controller: promptController,
                  decoration: const InputDecoration(
                      hintText: 'Enter a message',
                      contentPadding: EdgeInsets.zero,
                      border: OutlineInputBorder(borderSide: BorderSide.none)),
                ))
              ],
            ),
          ),
          const SizedBox(
            width: AppSpacing.s,
          ),
          InkWell(
            onTap: () {
              print('àgka');
            },
            child: Container(
              width: 45,
              height: 45,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: const Color(0xFFF5FAF7),
              ),
              child: SvgPicture.asset(
                'assets/icons/voice.svg',
                width: 18,
                height: 18,
              ),
            ),
          ),
          const SizedBox(
            width: AppSpacing.s,
          ),
          InkWell(
            onTap: () {
              print('àgka');
            },
            child: Container(
              width: 45,
              height: 45,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: const Color(0xFFF5FAF7),
              ),
              child: SvgPicture.asset(
                'assets/icons/plus.svg',
                width: 18,
                height: 18,
              ),
            ),
          )
        ],
      ),
    );
  }
}

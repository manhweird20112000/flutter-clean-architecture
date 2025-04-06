import 'package:flutter/material.dart';

import '../../../../config/theme/app_theme.dart';

class TabBarConversation extends StatelessWidget {
  final String text;
  final int index;
  final bool isSelected;
  final Function onChoose;

  const TabBarConversation(
      {super.key,
      required this.text,
      this.index = 0,
      this.isSelected = false,
      required this.onChoose});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChoose();
      },
      child: Column(
        children: [
          Text(
            text,
            style: TextStyle(
                fontFamily: AppTextStyles.fontFamily,
                color: isSelected
                    ? AppColors.textPrimary
                    : AppColors.textSecondary,
                fontWeight: FontWeight.w600,
                fontSize: AppSpacing.m),
          ),
          const SizedBox(
            height: AppSpacing.s,
          ),
          Container(
            width: 10,
            height: 3,
            decoration: BoxDecoration(
                color: isSelected ? AppColors.primary : Colors.transparent,
                borderRadius: BorderRadius.circular(AppSpacing.borderRadiusXs)),
          )
        ],
      ),
    );
  }
}

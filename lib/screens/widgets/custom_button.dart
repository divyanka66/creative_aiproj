import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String title;

  final VoidCallback onTap;

  final bool isLoading;

  const CustomButton({
    super.key,
    required this.title,
    required this.onTap,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,

      child: Container(
        height: 55,

        alignment: Alignment.center,

        decoration: BoxDecoration(
          color: AppColors.white,

          borderRadius: BorderRadius.circular(14),
        ),

        child: isLoading
            ? CircularProgressIndicator()
            : Text(
                title,
                style: const TextStyle(
                  color: AppColors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
      ),
    );
  }
}

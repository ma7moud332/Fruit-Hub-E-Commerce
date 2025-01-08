import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';
import 'package:fruit_hub/core/utils/app_images.dart';
import 'package:fruit_hub/core/utils/app_text_styles.dart';

class FruitItem extends StatelessWidget {
  const FruitItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: Color(0xFFF3F5F7),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.favorite_border_outlined),
            ),
          ),
          Positioned.fill(
              child: Column(
            children: [
              SizedBox(height: 16),
              Image.asset(
                Assets.imagesWatermelonTest,
              ),
              SizedBox(height: 12),
              ListTile(
                title: Text(
                  'بطيخ',
                  textAlign: TextAlign.right,
                  style: TextStyles.bold13,
                ),
                subtitle: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: '20جنية ',
                        style: TextStyles.bold13.copyWith(
                          color: AppColors.secondaryColor,
                        ),
                      ),
                      TextSpan(
                        text: '/',
                        style: TextStyles.bold13.copyWith(
                          color: AppColors.lightSecondaryColor,
                        ),
                      ),
                      TextSpan(
                        text: 'الكيلو',
                        style: TextStyles.semiBold13.copyWith(
                          color: AppColors.lightSecondaryColor,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.right,
                ),
                trailing: CircleAvatar(
                  backgroundColor: AppColors.primaryColor,
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }
}

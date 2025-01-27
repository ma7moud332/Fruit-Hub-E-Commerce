import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_hub/core/utils/app_images.dart';
import 'package:fruit_hub/core/utils/app_text_styles.dart';

class ProductsViewHeader extends StatelessWidget {
  const ProductsViewHeader({super.key, required this.peoductsLength});

  final int peoductsLength;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '$peoductsLength نتائج',
          textAlign: TextAlign.right,
          style: TextStyles.bold16,
        ),
        Spacer(),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: ShapeDecoration(
            color: Colors.white.withOpacity(0.10000000149011612),
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 1, color: Color(0x66CACECE)),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          child: SvgPicture.asset(
            Assets.imagesFilter2,
          ),
        )
      ],
    );
  }
}

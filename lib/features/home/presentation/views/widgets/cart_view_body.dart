import 'package:flutter/material.dart';
import 'package:fruit_hub/core/widgets/custom_app_bar.dart';
import 'package:fruit_hub/core/widgets/custom_button.dart';
import 'package:fruit_hub/features/home/presentation/views/widgets/cart_header.dart';
import 'package:fruit_hub/features/home/presentation/views/widgets/cart_item_list.dart';

import '../../../../../constants.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  SizedBox(height: kTopPadding),
                  buildAppBar(
                    context,
                    title: 'السلة',
                    showNotification: false,
                  ),
                  SizedBox(height: 16),
                  CartHeader(),
                  SizedBox(height: 12),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: CustomDivider(),
            ),
            CartItemList(),
            SliverToBoxAdapter(
              child: CustomDivider(),
            ),
          ],
        ),
        Positioned(
          left: 16,
          right: 16,
          bottom: MediaQuery.sizeOf(context).height * 0.05,
          child: CustomButton(onPressed: () {}, text: 'الدفع  120جنيه'),
        )
      ],
    );
  }
}

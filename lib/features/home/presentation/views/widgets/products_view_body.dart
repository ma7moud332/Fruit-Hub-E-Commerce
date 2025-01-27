import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/widgets/custom_app_bar.dart';
import '../../../../../constants.dart';
import '../../../../../core/cubits/products_cubit/products_cubit.dart';
import '../../../../../core/widgets/serach_text_field.dart';
import 'products_grid_view_bloc_builder.dart';
import 'products_view_header.dart';

class ProductsViewBody extends StatefulWidget {
  const ProductsViewBody({super.key});

  @override
  State<ProductsViewBody> createState() => _ProductsViewBodyState();
}

class _ProductsViewBodyState extends State<ProductsViewBody> {
  @override
  void initState() {
    context.read<ProductsCubit>().getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(height: kTopPadding),
                buildAppBar(context, title: 'المنتجات', showBackButton: false),
                SizedBox(height: 16),
                SerachTextField(),
                SizedBox(height: 12),
                ProductsViewHeader(
                  peoductsLength: context.read<ProductsCubit>().productsLength,
                ),
                SizedBox(height: 8),
              ],
            ),
          ),
          ProductsGridViewBlocBuilder(),
        ],
      ),
    );
  }
}

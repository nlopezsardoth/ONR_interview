import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onr_app/features/products/presentation/bloc/products_bloc.dart';
import 'package:onr_app/features/products/presentation/views/product_view.dart';
import 'package:onr_app/features/products/presentation/widgets/custom_sliver_appbar.dart';
import 'package:onr_app/features/shared/presentation/widgets/onr_loader.dart';
import 'package:onr_app/features/shared/utils/extensions/context_extensions.dart';

class ProductScreen extends StatelessWidget {
  static const name = 'product-screen';

  final int productId;
  const ProductScreen({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductBloc()..add(LoadProductDetail(productId)),
      child: BlocBuilder<ProductBloc, ProductState>(
        buildWhen: (context, state) {
          return state.productDetail != null;
        },
        builder: (context, state) {
          if (state.productDetail == null) {
            return const Scaffold(body: ONRLoader());
          }
          return Scaffold(
            body: CustomScrollView(
              physics: const ClampingScrollPhysics(),
              slivers: [
                CustomSliverAppBar(product: state.productDetail!),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => ProductView(
                      product: state.productDetail!,
                      size: MediaQuery.of(context).size,
                      textStyles: context.theme.textTheme,
                    ),
                    childCount: 1,
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

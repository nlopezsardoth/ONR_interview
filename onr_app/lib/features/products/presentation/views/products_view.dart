import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:onr_app/features/products/presentation/bloc/products_bloc.dart';
import 'package:onr_app/features/products/presentation/widgets/product_card.dart';
import 'package:onr_app/features/shared/presentation/widgets/shimmer_widget.dart';
import 'package:onr_app/features/shared/presentation/widgets/try_again_widget.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return state.status == ProductStatus.failure
            ? Center(
                child: TryAgainWidget(
                  onTap: () => context.read<ProductBloc>().add(LoadProducts()),
                ),
              )
            : Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: state.products?.length ?? 20,
                  itemBuilder: (context, index) {
                    return (state.status == ProductStatus.loading ||
                            state.status == ProductStatus.initial)
                        ? buildRectangleShimmerItem(
                            context, MediaQuery.sizeOf(context).width, 80)
                        : GestureDetector(
                            onTap: () => context.push(
                                '/home/0/product/${state.products![index].id}'),
                            child:
                                ProductCard(product: state.products![index]));
                  },
                ),
              );
      },
    );
  }
}
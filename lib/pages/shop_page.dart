import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import '../cubits/shoppage/shop_cubit.dart';
import '../providers/userdata_provider.dart';
import '../widgets/product_card.dart';
import 'shop/cart_page.dart';
import 'shop/product_details.dart';

class ShopPage extends StatelessWidget {
  final ShopCubit shopCubit = ShopCubit();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: AutoSizeText(
          "Shop",
          style: Theme.of(context)
              .textTheme
              .headline5
              .copyWith(fontWeight: FontWeight.bold),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CartPage(),
                  ),
                );
              },
              icon: Icon(Icons.shopping_cart),
            ),
          ),
        ],
      ),
      body: BlocBuilder(
        cubit: shopCubit
          ..loadShop(Provider.of<UserData>(context, listen: false).userId),
        builder: (context, state) {
          if (state is ShopLoaded) {
            return RefreshIndicator(
              onRefresh: () => shopCubit.refresh(
                  Provider.of<UserData>(context, listen: false).userId),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: GridView.builder(
                  itemCount: state.shopModel.products.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    childAspectRatio: 0.75,
                  ),
                  itemBuilder: (context, index) => ItemCard(
                    data: state.shopModel.products[index],
                    press: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetailsPage(
                          data: state.shopModel.products[index],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          } else if (state is ShopLoading) {
            return Center(
              child: SpinKitCubeGrid(
                color: Colors.red.shade900,
                size: 50.0,
              ),
            );
          } else
            return Container();
        },
      ),
    );
  }
}

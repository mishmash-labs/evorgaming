import '../../cubits/cartpage/cart_cubit.dart';
import '../../providers/userdata_provider.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  final CartCubit cartCubit = CartCubit();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: AutoSizeText(
          "Cart",
          style: Theme.of(context)
              .textTheme
              .headline5
              .copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: BlocBuilder(
        cubit: cartCubit
          ..loadCart(Provider.of<UserData>(context, listen: false).userId),
        builder: (context, state) {
          if (state is CartLoaded) {
            if (state.cartData.message.isNotEmpty)
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: RefreshIndicator(
                  onRefresh: () => cartCubit.refresh(
                      Provider.of<UserData>(context, listen: false).userId),
                  child: ListView.builder(
                    itemCount: state.cartData.message.length,
                    itemBuilder: (context, index) {
                      return Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        elevation: 0,
                        color: Colors.black26,
                        child: ListTile(
                          title: Text(state.cartData.message[index].name),
                          subtitle: Text(
                              "Quantity: " + state.cartData.message[index].qty),
                          trailing: Text(state.cartData.message[index].price),
                        ),
                      );
                    },
                  ),
                ),
              );
            else
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.shopping_cart,
                      color: Colors.white54,
                      size: 75,
                    ),
                    const SizedBox(height: 8),
                    AutoSizeText(
                      "No Products",
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w400,
                        color: Colors.white54,
                      ),
                    ),
                  ],
                ),
              );
          } else {
            if (state is CartLoading) {
              return Center(
                child: SpinKitCubeGrid(
                  color: Colors.red.shade900,
                  size: 50.0,
                ),
              );
            } else
              return Container();
          }
        },
      ),
    );
  }
}

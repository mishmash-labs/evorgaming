import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import '../../cubits/cartpage/cart_cubit.dart';
import '../../models/cartpage_model.dart';
import '../../providers/userdata_provider.dart';
import '../utils/textstyle.dart';

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
            if (state.cartData.message.isNotEmpty) {
              return RefreshIndicator(
                onRefresh: () => cartCubit.refresh(
                    Provider.of<UserData>(context, listen: false).userId),
                child: CartWidget(
                  cartData: state.cartData,
                  totalCost: state.totalCost,
                  cubit: cartCubit,
                ),
              );
            } else {
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
            }
          } else {
            if (state is CartLoading) {
              return Center(
                child: SpinKitCubeGrid(
                  color: Colors.red.shade900,
                  size: 50.0,
                ),
              );
            } else {
              return Container();
            }
          }
        },
      ),
    );
  }
}
// }

class CartWidget extends StatelessWidget {
  final CartModel cartData;
  final int totalCost;
  final CartCubit cubit;
  const CartWidget({Key key, this.cartData, this.totalCost, this.cubit})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    var email = Provider.of<UserData>(context, listen: false).userId;
    return ListView(
      children: <Widget>[createCartList(email), footer(context)],
    );
  }

  footer(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 30),
                child: Text(
                  "Subtotal",
                  style: CustomTextStyle.textFormFieldMedium
                      .copyWith(color: Colors.grey, fontSize: 12),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 30),
                child: Text(
                  totalCost.toString(),
                  style: CustomTextStyle.textFormFieldBlack
                      .copyWith(color: Colors.white70, fontSize: 14),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 30),
                child: Text(
                  "Shipping Fee",
                  style: CustomTextStyle.textFormFieldMedium
                      .copyWith(color: Colors.grey, fontSize: 12),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 30),
                child: Text(
                  "0",
                  style: CustomTextStyle.textFormFieldBlack
                      .copyWith(color: Colors.white70, fontSize: 14),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 30),
                child: Text(
                  "Total",
                  style: CustomTextStyle.textFormFieldMedium
                      .copyWith(color: Colors.grey, fontSize: 12),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 30),
                child: Text(
                  totalCost.toString(),
                  style: CustomTextStyle.textFormFieldBlack
                      .copyWith(color: Colors.red, fontSize: 14),
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          RaisedButton(
            // onPressed: () {
            //   Navigator.push(context,
            //       new MaterialPageRoute(builder: (context) => CheckOutPage()));
            // },
            onPressed: () {},
            color: Colors.red.shade800,
            padding: EdgeInsets.only(top: 12, left: 60, right: 60, bottom: 12),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(24))),
            child: Text(
              "Checkout",
              style: CustomTextStyle.textFormFieldSemiBold
                  .copyWith(color: Colors.white),
            ),
          ),
          SizedBox(height: 8),
        ],
      ),
      margin: EdgeInsets.only(top: 16),
    );
  }

  createCartList(String email) {
    return ListView.builder(
      shrinkWrap: true,
      primary: false,
      itemBuilder: (context, index) {
        return createCartListItem(cartData.message[index], email);
      },
      itemCount: cartData.message.length,
    );
  }

  createCartListItem(Message itemData, String email) {
    return Stack(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 16, right: 16, top: 16),
          decoration: BoxDecoration(
              color: Colors.black38,
              borderRadius: BorderRadius.all(Radius.circular(16))),
          child: Row(
            children: <Widget>[
              CachedNetworkImage(
                imageUrl:
                    "https://evorgaming.com/storage/Products/${itemData.images.split(r"/@/")[1]}",
                placeholder: (context, url) => Center(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircularProgressIndicator(),
                )),
                errorWidget: (context, url, error) =>
                    Center(child: Icon(Icons.error)),
                fit: BoxFit.fitHeight,
                imageBuilder: (context, imageProvider) => Container(
                  margin: EdgeInsets.only(right: 8, left: 8, top: 8, bottom: 8),
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(14)),
                    color: Colors.red.shade900.withOpacity(0.7),
                    image: DecorationImage(
                        image: imageProvider, fit: BoxFit.cover),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(right: 8, top: 4),
                        child: Text(
                          itemData.name,
                          maxLines: 2,
                          softWrap: true,
                          style: CustomTextStyle.textFormFieldSemiBold
                              .copyWith(fontSize: 14, color: Colors.white),
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        "Quantity: ${itemData.qty}",
                        style: CustomTextStyle.textFormFieldRegular
                            .copyWith(color: Colors.grey, fontSize: 14),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              (int.parse(itemData.price) *
                                      int.parse(itemData.qty))
                                  .toString(),
                              style: CustomTextStyle.textFormFieldBlack
                                  .copyWith(color: Colors.red),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: RaisedButton(
                                onPressed: () {},
                                color: Colors.red.shade800,
                                elevation: 0.0,
                                child: Text("UPDATE"),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                flex: 100,
              )
            ],
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: InkWell(
            onTap: () {
              cubit.deleteitem(email, itemData.productId);
            },
            child: Container(
              width: 24,
              height: 24,
              alignment: Alignment.center,
              margin: EdgeInsets.only(right: 10, top: 8),
              child: Icon(
                Icons.close,
                color: Colors.white,
                size: 20,
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  color: Colors.red.shade800),
            ),
          ),
        )
      ],
    );
  }
}

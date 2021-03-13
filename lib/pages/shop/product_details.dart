import 'package:animations/animations.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:badges/badges.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:button_picker/button_picker.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:evorgaming/cubits/shoppage/shop_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:provider/provider.dart';

import '../../cubits/itempage/item_cubit.dart';
import '../../models/shoppage_model.dart';
import '../../providers/userdata_provider.dart';
import 'cart_page.dart';

class ProductDetailsPage extends StatelessWidget {
  ProductDetailsPage({Key key, this.data, @required this.shopCubit})
      : super(key: key);

  final ShopCubit shopCubit;
  final Product data;
  final ItemCubit itemCubit = ItemCubit();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          BlocBuilder(
            bloc: shopCubit,
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Badge(
                  padding: EdgeInsets.all(6),
                  position: BadgePosition.topEnd(top: -2, end: -2),
                  badgeContent: Text(shopCubit.itemCount.toString()),
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CartPage(),
                        ),
                      ).then((val) {
                        shopCubit.refresh(
                            Provider.of<UserData>(context, listen: false)
                                .userId);
                        Navigator.pop(context);
                      });
                    },
                    icon: Icon(Icons.shopping_cart),
                  ),
                ),
              );
            },
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: BlocConsumer(
        listener: (context, state) {
          if (state is ItemAdded) {
            BotToast.showText(
                text: state.data.message, duration: Duration(seconds: 4));
            Navigator.pop(context);
          } else if (state is ItemFailed) {
            BotToast.showText(
                text: state.data.message, duration: Duration(seconds: 4));
          }
        },
        bloc: itemCubit,
        builder: (context, state) {
          return FloatingActionButton.extended(
            onPressed: () {
              if (data.isAlreadyAddedToCart == 1) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CartPage(),
                  ),
                ).then((val) {
                  shopCubit.refresh(
                      Provider.of<UserData>(context, listen: false).userId);
                  Navigator.pop(context);
                });
              } else if (state is ItemAdding)
                return null;
              else if (data.quantity == "0") {
                return null;
              } else {
                var qty = 1;

                showModal(
                  context: context,
                  builder: (context) => SimpleDialog(
                    title: Text(
                      "Quantity",
                      style: const TextStyle(color: Colors.white70),
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                    children: [
                      ButtonPicker(
                        minValue: 1,
                        maxValue: double.parse(data.quantity),
                        initialValue: 1,
                        onChanged: (val) {
                          qty = val.toInt();
                        },
                        padding: 10,
                        iconUp: Icons.arrow_upward,
                        iconDown: Icons.arrow_downward,
                        iconUpRightColor: Colors.white70,
                        iconDownLeftColor: Colors.white70,
                        style: const TextStyle(
                            fontSize: 48, color: Colors.white70),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 8, right: 8, left: 8),
                        child: RaisedButton(
                          onPressed: () {
                            itemCubit.addToCart(
                              Provider.of<UserData>(context, listen: false)
                                  .userId,
                              Provider.of<UserData>(context, listen: false)
                                  .userNumID,
                              data.id,
                              qty,
                            );
                            Navigator.pop(context);
                          },
                          color: Colors.red.shade800,
                          elevation: 0.0,
                          child: Text("ADD TO CART"),
                        ),
                      ),
                    ],
                  ),
                );
              }
            },
            backgroundColor:
                data.quantity != "0" ? Colors.red.shade700 : Colors.grey,
            label: state is ItemAdding
                ? CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  )
                : data.isAlreadyAddedToCart == 1
                    ? AutoSizeText(
                        "Go to cart".toUpperCase(),
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      )
                    : data.quantity != "0"
                        ? AutoSizeText(
                            "Add to cart".toUpperCase(),
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          )
                        : AutoSizeText(
                            "Out of Stock".toUpperCase(),
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
          );
        },
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: size.height / 1.127,
            child: Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.3),
                  padding: EdgeInsets.only(
                    top: size.height * 0.12,
                    bottom: 16,
                    left: 16,
                    right: 16,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black38,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(36),
                      topRight: Radius.circular(36),
                    ),
                  ),
                  child: ListView(
                    children: <Widget>[
                      HtmlWidget(
                        Uri.decodeFull(data.longDescription),
                      ),
                      SizedBox(
                        height: 64,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      AutoSizeText(
                        data.name,
                        style: Theme.of(context)
                            .textTheme
                            .headline4
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 16),
                      Row(
                        children: <Widget>[
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(text: "Price\n"),
                                TextSpan(
                                  text: "${data.price} Coins",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline4
                                      .copyWith(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 24),
                          Expanded(
                            child: Hero(
                              tag: data.id,
                              child: CachedNetworkImage(
                                imageUrl:
                                    "https://evorgaming.com/storage/Products/${data.image[1]}",
                                fit: BoxFit.fill,
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

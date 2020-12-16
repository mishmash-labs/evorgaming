import 'package:auto_size_text/auto_size_text.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:evorgaming/cubits/itempage/item_cubit.dart';
import 'package:evorgaming/providers/userdata_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:provider/provider.dart';

import '../../models/shoppage_model.dart';

class ProductDetailsPage extends StatelessWidget {
  ProductDetailsPage({Key key, this.data}) : super(key: key);

  final Product data;
  final ItemCubit itemCubit = ItemCubit();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: BlocConsumer(
        listener: (context, state) {
          if (state is ItemAdded || state is ItemFailed) {
            BotToast.showText(
                text: state.data.message, duration: Duration(seconds: 4));
          }
        },
        cubit: itemCubit,
        builder: (context, state) {
          return FloatingActionButton.extended(
            onPressed: () {
              if (state is ItemAdding) return null;
              if (data.quantity == "0")
                return null;
              else
                itemCubit.addToCart(
                  Provider.of<UserData>(context, listen: false).userId,
                  Provider.of<UserData>(context, listen: false).userNumID,
                  data.id,
                  1,
                );
            },
            backgroundColor:
                data.quantity != "0" ? Colors.red.shade700 : Colors.grey,
            label: state is ItemAdding
                ? CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
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
                                  text: data.price + " Coins",
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
                                    "https://evorgaming.com/storage/Products/" +
                                        data.image[1],
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

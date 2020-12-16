import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../models/shoppage_model.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({
    Key key,
    this.press,
    this.data,
  }) : super(key: key);

  final Product data;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.black38,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Hero(
                tag: data.id,
                child: CachedNetworkImage(
                    imageUrl: "https://evorgaming.com/storage/Products/" +
                        data.image[1]),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5),
            child: AutoSizeText(
              data.name,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: AutoSizeText(
              data.price + " Coins",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}

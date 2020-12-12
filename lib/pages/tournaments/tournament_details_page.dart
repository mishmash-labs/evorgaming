import 'package:cached_network_image/cached_network_image.dart';
import 'package:evorgaming/models/tournamentdetails_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:auto_size_text/auto_size_text.dart';

class TournamentDetailsPage extends StatelessWidget {
  final TournamentDetailsModel data;

  const TournamentDetailsPage({Key key, this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: AutoSizeText(
          data.title,
          style: Theme.of(context)
              .textTheme
              .headline5
              .copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: ListView(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: CachedNetworkImage(
                imageUrl: 'https://evorgaming.com' + data.coverImage,
              ),
            ),
            SizedBox(height: 8),
            Center(
              child: AutoSizeText(
                "ABOUT THE TOURNAMENT",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black38,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          AutoSizeText(data.entryFee + " COINS"),
                          SizedBox(height: 8),
                          AutoSizeText(
                            "ENTRY FEE",
                            style: const TextStyle(
                              fontWeight: FontWeight.w900,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          AutoSizeText(data.type),
                          SizedBox(height: 8),
                          AutoSizeText(
                            "PLAY MOOD",
                            style: const TextStyle(
                              fontWeight: FontWeight.w900,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          AutoSizeText(data.platform.toUpperCase()),
                          SizedBox(height: 8),
                          AutoSizeText(
                            "PLATFORM",
                            style: const TextStyle(
                              fontWeight: FontWeight.w900,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          AutoSizeText("${data.curRoomSize}/${data.roomSize}"),
                          SizedBox(height: 8),
                          AutoSizeText(
                            "PLAYERS",
                            style: const TextStyle(
                              fontWeight: FontWeight.w900,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Center(
              child: AutoSizeText(
                "TOURNAMENT DESCRIPTION",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black38,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: HtmlWidget(
                      Uri.decodeFull(data.description.replaceAll(r"+", " "))),
                ),
              ),
            ),
            Center(
              child: AutoSizeText(
                "TOURNAMENT RULES",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black38,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: HtmlWidget(Uri.decodeFull(data.tournmentRules)),
                ),
              ),
            ),
            if (data.giftItem != null)
              Center(
                child: AutoSizeText(
                  "WINNING GIFT",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            if (data.giftItem != null)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black38,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      leading: CachedNetworkImage(
                        imageUrl: "https://evorgaming.com/storage/Products/" +
                            data.giftItem.images.split(r"/@/")[1],
                        placeholder: (context, url) =>
                            Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) =>
                            Center(child: Icon(Icons.error)),
                        fit: BoxFit.fitHeight,
                      ),
                      title: AutoSizeText(data.giftItem.name),
                      subtitle: HtmlWidget(data.giftItem.shorDescription),
                    ),
                  ),
                ),
              ),
            Center(
              child: AutoSizeText(
                "OUR SPONSORS",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 8),
            for (var item in data.sponsorBanner)
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: CachedNetworkImage(
                  placeholder: (context, url) =>
                      Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) =>
                      Center(child: Icon(Icons.error)),
                  imageUrl:
                      'https://evorgaming.com/storage/Tournments/Sponsors/' +
                          item,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
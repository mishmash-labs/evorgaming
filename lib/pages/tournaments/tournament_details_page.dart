import 'package:auto_size_text/auto_size_text.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:clipboard/clipboard.dart';
import 'package:external_app_launcher/external_app_launcher.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

import '../../models/tournamentdetails_model.dart';
import 'jointournament_dialog.dart';

class TournamentDetailsPage extends StatelessWidget {
  const TournamentDetailsPage(
      {Key key, @required this.data, @required this.completed})
      : super(key: key);

  final TournamentDetailsModel data;
  final bool completed;

  @override
  Widget build(BuildContext context) {
    print(data.gameId);
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
        actions: [
          if (!data.startDateTime.isAfter(DateTime.now()))
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Chip(
                backgroundColor: Colors.red.shade700,
                label: Text("Delayed"),
              ),
            ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            if (!completed &&
                !data.isAlreadyParticipant &&
                data.startDateTime.isAfter(DateTime.now()) &&
                int.parse(data.curRoomSize) != int.parse(data.roomSize))
              FloatingActionButton.extended(
                backgroundColor: Colors.red.shade700,
                heroTag: null,
                label: Text(
                  "Join Tournament",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Join Tournament'),
                        content: SingleChildScrollView(
                          child: Column(
                            children: <Widget>[
                              Text(
                                  'Are you sure you want to join this tournament?'),
                              SizedBox(
                                height: 8,
                              ),
                              if (data.entryType != "Free")
                                Text(
                                    'You will be charged ${data.entryFee} coins as an entry fee.'),
                            ],
                          ),
                        ),
                        actions: <Widget>[
                          TextButton(
                            child: Text(
                              'Cancel',
                              style: TextStyle(color: Colors.red),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          TextButton(
                            child: Text(
                              'Continue',
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return JoinTournamentDialog(
                                    data: data,
                                  );
                                },
                              );
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            if (!kIsWeb)
              FloatingActionButton.extended(
                backgroundColor: Colors.red.shade700,
                heroTag: null,
                label: Text(
                  "Play Now",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: () async {
                  await LaunchApp.openApp(
                      androidPackageName:
                          data.playStore.trim().split(r"id=")[1],
                      appStoreLink: data.appleStore,
                      openStore: true);
                },
              ),
          ]),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: ListView(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: CachedNetworkImage(
                imageUrl: 'https://evorgaming.com${data.coverImage}',
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
                          AutoSizeText("${data.entryFee} COINS"),
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
            if (data.roomVisibilityStaus == "1" && data.isAlreadyParticipant)
              Center(
                child: AutoSizeText(
                  "ROOM DETAILS",
                  style:
                      TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
                ),
              ),
            if (data.roomVisibilityStaus == "1" && data.isAlreadyParticipant)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.red),
                    color: Colors.black38,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              onTap: () {
                                FlutterClipboard.copy(data.roomId).then(
                                    (value) => BotToast.showText(
                                        text: "Copied to clipboard",
                                        duration: Duration(seconds: 4)));
                              },
                              child: Column(
                                children: [
                                  AutoSizeText(
                                    "ROOM ID",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w900,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  AutoSizeText(data.roomId),
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                FlutterClipboard.copy(data.roomPassword).then(
                                    (value) => BotToast.showText(
                                        text: "Copied to clipboard",
                                        duration: Duration(seconds: 4)));
                              },
                              child: Column(
                                children: [
                                  AutoSizeText(
                                    "ROOM PASSWORD",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w900,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  AutoSizeText(data.roomPassword),
                                ],
                              ),
                            )
                          ],
                        ),
                        Divider(
                          thickness: 2,
                        ),
                        Text(
                          "Tap on the code to copy it to your clipboard.",
                          style: TextStyle(color: Colors.white54),
                        )
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
                        width: MediaQuery.of(context).size.width / 8,
                        imageUrl:
                            "https://evorgaming.com/storage/Products/${data.giftItem.images.split(r"/@/")[1]}",
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
            ImageCarousel(data: data),
            SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}

class ImageCarousel extends StatefulWidget {
  const ImageCarousel({
    Key key,
    @required this.data,
  }) : super(key: key);

  final TournamentDetailsModel data;

  @override
  _ImageCarouselState createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.data.sponsorBanner.map((url) {
            int index = widget.data.sponsorBanner.indexOf(url);
            return Container(
              width: 8.0,
              height: 8.0,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _current == index ? Colors.red : Colors.white60,
              ),
            );
          }).toList(),
        ),
        CarouselSlider.builder(
          itemCount: widget.data.sponsorBanner.length,
          itemBuilder: (BuildContext context, int itemIndex, int realIndex) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: CachedNetworkImage(
                placeholder: (context, url) => Center(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircularProgressIndicator(),
                )),
                errorWidget: (context, url, error) =>
                    Center(child: Icon(Icons.error)),
                imageUrl:
                    'https://evorgaming.com/storage/Tournments/Sponsors/${widget.data.sponsorBanner[itemIndex]}',
              ),
            );
          },
          options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: true,
              aspectRatio: 2.0,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              }),
        ),
      ],
    );
  }
}

import 'package:evorgaming/models/tournamentdetails_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class TournamentDetailsPage extends StatelessWidget {
  final TournamentDetailsModel data;

  const TournamentDetailsPage({Key key, this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
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
              child: Image.network(
                'https://evorgaming.com' + data.coverImage,
              ),
            ),
            SizedBox(height: 8),
            Center(
              child: Text(
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
                          Text(data.entryFee + " COINS"),
                          SizedBox(height: 8),
                          Text(
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
                          Text(data.type),
                          SizedBox(height: 8),
                          Text(
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
                          Text(data.platform.toUpperCase()),
                          SizedBox(height: 8),
                          Text(
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
                          Text("${data.curRoomSize}/${data.roomSize}"),
                          SizedBox(height: 8),
                          Text(
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
              child: Text(
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
              child: Text(
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
            // Center(
            //   child: Text(
            //     "WINNING GIFT",
            //     style: TextStyle(fontWeight: FontWeight.bold),
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Container(
            //     decoration: BoxDecoration(
            //       color: Colors.black38,
            //       borderRadius: BorderRadius.circular(8),
            //     ),
            //     child: Padding(
            //       padding: const EdgeInsets.all(8.0),
            //       child: ListTile(
            //         leading: Image.asset(
            //           data.,
            //         ),
            //         title: Text("LENSES MOUSE"),
            //         subtitle: Text(
            //             "Santiago who travels from his homeland in Spain to the Egyptian desert in search of a treasure buried near the Pyramids. Lorem ipsum dolor sit amet, consectetur elit, sed do eiusmod tempor incididunt ut labore et. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incidid"),
            //       ),
            //     ),
            //   ),
            // ),
            Center(
              child: Text(
                "OUR SPONSORS",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 8),
            for (var item in data.sponsorBanner)
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  'https://evorgaming.com/storage/Tournments/Sponsors/' + item,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

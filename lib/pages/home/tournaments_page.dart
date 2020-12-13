import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import '../../providers/userdata_provider.dart';
import 'package:provider/provider.dart';

import '../../cubits/tournamentspage/tournaments_cubit.dart';
import '../../models/tournamentdetails_model.dart';
import '../tournaments/tournament_details_page.dart';

class TournamentsPage extends StatelessWidget {
  TournamentsPage({Key key, @required this.gameid}) : super(key: key);

  final int gameid;
  final TournamentsCubit tournamentsCubit = TournamentsCubit();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: AutoSizeText(
            "Tournaments",
            style: Theme.of(context)
                .textTheme
                .headline5
                .copyWith(fontWeight: FontWeight.bold),
          ),
          bottom: TabBar(
            indicatorColor: Colors.red.shade800,
            labelColor: Colors.red.shade800,
            unselectedLabelColor: Colors.white70,
            tabs: [
              Tab(text: "Upcoming"),
              Tab(text: "Ongoing"),
              Tab(text: "Completed")
            ],
          ),
        ),
        body: BlocBuilder(
          cubit: tournamentsCubit
            ..loadTournaments(
                Provider.of<UserData>(context, listen: false).userId, gameid),
          builder: (context, state) {
            if (state is TournamentsLoaded)
              return TabBarView(
                children: [
                  TournamentList(
                    data: List<TournamentDetailsModel>.from(state
                        .tournamentPageModel
                        .toJson()["UpComing"]
                        .map((x) => TournamentDetailsModel.fromJson(x))),
                    type: "Upcoming",
                  ),
                  TournamentList(
                    data: List<TournamentDetailsModel>.from(state
                        .tournamentPageModel
                        .toJson()["Ongoing"]
                        .map((x) => TournamentDetailsModel.fromJson(x))),
                    type: "Ongoing",
                  ),
                  TournamentList(
                    data: List<TournamentDetailsModel>.from(state
                        .tournamentPageModel
                        .toJson()["Completed"]
                        .map((x) => TournamentDetailsModel.fromJson(x))),
                    type: "Completed",
                  ),
                ],
              );
            else if (state is TournamentsLoading) {
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
      ),
    );
  }
}

class TournamentList extends StatelessWidget {
  const TournamentList({
    Key key,
    this.data,
    this.type,
  }) : super(key: key);

  final List<TournamentDetailsModel> data;
  final String type;

  @override
  Widget build(BuildContext context) {
    if (data.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.info,
              color: Colors.white54,
              size: 75,
            ),
            const SizedBox(height: 8),
            AutoSizeText(
              "No Tournaments",
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w400,
                color: Colors.white54,
              ),
            ),
          ],
        ),
      );
    } else
      return Container(
        child: ListView.builder(
          padding: EdgeInsets.all(4),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: data.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              elevation: 0,
              color: Colors.black26,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TournamentDetailsPage(
                        data: data[index],
                      ),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AutoSizeText(
                                data[index].title,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    WidgetSpan(
                                      alignment: PlaceholderAlignment.middle,
                                      child: Icon(
                                        Icons.access_time,
                                        size: 14,
                                        color: Colors.white54,
                                      ),
                                    ),
                                    TextSpan(
                                      text: " " +
                                          DateFormat('d MMM, K:ma').format(
                                              data[index].startDateTime),
                                      style: TextStyle(
                                        color: Colors.white54,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          if (type == "Upcoming")
                            ButtonTheme(
                              height: 32,
                              minWidth: 64,
                              child: RaisedButton(
                                elevation: 0,
                                onPressed: () {},
                                child: AutoSizeText("OPEN"),
                                color: Colors.red.shade800,
                              ),
                            )
                        ],
                      ),
                      SizedBox(height: 8),
                      LinearProgressIndicator(
                        value: int.parse(data[index].curRoomSize) /
                            int.parse(data[index].roomSize),
                        valueColor:
                            AlwaysStoppedAnimation<Color>(Colors.red.shade700),
                      ),
                      SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AutoSizeText(
                            (int.parse(data[index].roomSize) -
                                        int.parse(data[index].curRoomSize))
                                    .toString() +
                                " slots left",
                            style: TextStyle(color: Colors.white54),
                          ),
                          AutoSizeText(
                            "Total ${data[index].roomSize} slots",
                            style: TextStyle(color: Colors.white54),
                          )
                        ],
                      ),
                      Divider(thickness: 2),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          RichText(
                            text: TextSpan(
                              children: [
                                WidgetSpan(
                                  alignment: PlaceholderAlignment.middle,
                                  child: Icon(
                                    Icons.attach_money,
                                    size: 14,
                                    color: Colors.white54,
                                  ),
                                ),
                                if (data[index].totalPricePool != null)
                                  TextSpan(
                                    text: " " + data[index].totalPricePool,
                                    style: TextStyle(
                                      color: Colors.white54,
                                    ),
                                  ),
                                if (data[index].giftItem != null)
                                  TextSpan(
                                    text: " " + data[index].giftItem.name,
                                    style: TextStyle(
                                      color: Colors.white54,
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                              children: [
                                WidgetSpan(
                                  alignment: PlaceholderAlignment.middle,
                                  child: Icon(
                                    Icons.phone_android,
                                    size: 14,
                                    color: Colors.white54,
                                  ),
                                ),
                                TextSpan(
                                  text: " " + data[index].platform,
                                  style: TextStyle(
                                    color: Colors.white54,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                              children: [
                                WidgetSpan(
                                  alignment: PlaceholderAlignment.middle,
                                  child: Icon(
                                    Icons.people_alt_outlined,
                                    size: 14,
                                    color: Colors.white54,
                                  ),
                                ),
                                TextSpan(
                                  text: " " + data[index].type,
                                  style: TextStyle(
                                    color: Colors.white54,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      );
  }
}

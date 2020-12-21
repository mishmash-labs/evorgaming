import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../cubits/homepage/home_cubit.dart';
import '../models/tournamentdetails_model.dart';
import '../providers/userdata_provider.dart';
import 'home/chat_page.dart';
import 'home/notifications_page.dart';
import 'home/tournaments_page.dart';
import 'home/wallet_page.dart';
import 'tournaments/tournament_details_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize:
              Size.fromHeight(MediaQuery.of(context).size.height / 6),
          child: AppBar(
            elevation: 0,
            backgroundColor: Colors.black45,
            toolbarHeight: MediaQuery.of(context).size.height / 1,
            title: Image.asset(
              "assets/logo.png",
              height: 48,
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WalletPage(),
                      ),
                    );
                  },
                  icon: Icon(Icons.account_balance_wallet),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChatPage(),
                      ),
                    );
                  },
                  icon: Icon(Icons.chat),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NotificationsPage(),
                      ),
                    );
                  },
                  icon: Icon(Icons.notifications),
                ),
              ),
            ],
            bottom: TabBar(
              indicatorColor: Colors.red.shade800,
              labelColor: Colors.red.shade800,
              unselectedLabelColor: Colors.white70,
              tabs: [
                Tab(text: "Play"),
                Tab(text: "My Tournaments"),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            PlayTab(),
            MyDashboardTab(),
          ],
        ),
      ),
    );
  }
}

class MyDashboardTab extends StatelessWidget {
  const MyDashboardTab({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
  }
}

class PlayTab extends StatelessWidget {
  PlayTab({
    Key key,
  }) : super(key: key);

  final HomeCubit homeCubit = HomeCubit();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      cubit: homeCubit
        ..loadHome(Provider.of<UserData>(context, listen: false).userId),
      builder: (context, state) {
        if (state is HomeLoaded) {
          return RefreshIndicator(
            onRefresh: () => homeCubit
                .refresh(Provider.of<UserData>(context, listen: false).userId),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 8),
                  AutoSizeText(
                    "Games",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Expanded(
                    flex: 3,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: state.homepageData.games.length,
                      padding: EdgeInsets.all(8),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TournamentsPage(
                                  gameid: state.homepageData.games[index].id,
                                ),
                              ),
                            );
                          },
                          child: CachedNetworkImage(
                            imageUrl:
                                'https://evorgaming.com${state.homepageData.games[index].image}',
                          ),
                        );
                      },
                    ),
                  ),
                  AutoSizeText(
                    "Featured Tournaments",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  SizedBox(height: 8),
                  Expanded(
                    flex: 5,
                    child: GridView.builder(
                      itemCount: state.homepageData.featuredTournments.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                        childAspectRatio: 0.8,
                      ),
                      itemBuilder: (context, index) {
                        return Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          elevation: 0,
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => TournamentDetailsPage(
                                    data: TournamentDetailsModel.fromJson(state
                                        .homepageData.featuredTournments[index]
                                        .toJson()),
                                  ),
                                ),
                              );
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(16),
                                      topRight: Radius.circular(16)),
                                  child: CachedNetworkImage(
                                    imageUrl:
                                        'https://evorgaming.com${state.homepageData.featuredTournments[index].coverImage}',
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 4, top: 4),
                                  child: AutoSizeText(
                                    state.homepageData.featuredTournments[index]
                                        .title,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 4, top: 4),
                                  child: RichText(
                                    text: TextSpan(
                                      children: [
                                        WidgetSpan(
                                          alignment:
                                              PlaceholderAlignment.middle,
                                          child: Icon(
                                            Icons.access_time,
                                            size: 14,
                                            color: Colors.white54,
                                          ),
                                        ),
                                        TextSpan(
                                          text:
                                              " ${DateFormat('d MMM, K:ma').format(state.homepageData.featuredTournments[index].startDateTime)}",
                                          style: TextStyle(
                                            color: Colors.white54,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 8),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(
                                      children: [
                                        AutoSizeText(
                                          "Prize",
                                          style: TextStyle(
                                            color: Colors.white54,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 4,
                                        ),
                                        AutoSizeText(state
                                            .homepageData
                                            .featuredTournments[index]
                                            .totalPricePool)
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        AutoSizeText(
                                          "Type",
                                          style: TextStyle(
                                            color: Colors.white54,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 4,
                                        ),
                                        AutoSizeText(state.homepageData
                                            .featuredTournments[index].type)
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        AutoSizeText(
                                          "Version",
                                          style: TextStyle(
                                            color: Colors.white54,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 4,
                                        ),
                                        AutoSizeText(state.homepageData
                                            .featuredTournments[index].platform)
                                      ],
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8),
                                  child: Column(
                                    children: [
                                      AutoSizeText(
                                        "Lobby",
                                        style: TextStyle(
                                          color: Colors.white54,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 4,
                                      ),
                                      RichText(
                                        text: TextSpan(
                                          children: [
                                            WidgetSpan(
                                              alignment:
                                                  PlaceholderAlignment.middle,
                                              child: Icon(
                                                Icons.people,
                                                size: 14,
                                                color: Colors.white54,
                                              ),
                                            ),
                                            TextSpan(
                                              text:
                                                  " ${state.homepageData.featuredTournments[index].curRoomSize}/${state.homepageData.featuredTournments[index].roomSize}",
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        } else if (state is HomeLoading) {
          return SpinKitCubeGrid(
            color: Colors.red.shade900,
            size: 50.0,
          );
        } else {
          return Container();
        }
      },
    );
  }
}

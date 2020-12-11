import '../tournaments/tournament_details_page.dart';
import 'package:flutter/material.dart';

class TournamentsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(
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
        body: TabBarView(
          children: [
            Container(
              child: ListView.builder(
                padding: EdgeInsets.all(4),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: 7,
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
                            builder: (context) => TournamentDetailsPage(),
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
                                    Text(
                                      "Battle Royale",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                    RichText(
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
                                            text: " 13 Dec, 12:00PM",
                                            style: TextStyle(
                                              color: Colors.white54,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                ButtonTheme(
                                  height: 32,
                                  minWidth: 64,
                                  child: RaisedButton(
                                    elevation: 0,
                                    onPressed: () {},
                                    child: Text("OPEN"),
                                    color: Colors.red.shade800,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 8),
                            LinearProgressIndicator(
                              value: 1017 / 4800,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                  Colors.red.shade700),
                            ),
                            SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "3783 slots left",
                                  style: TextStyle(color: Colors.white54),
                                ),
                                Text(
                                  "Total 4800 spots",
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
                                      TextSpan(
                                        text: " 5000",
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
                                        text: " Mobile",
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
                                        text: " Solo",
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
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.warning,
                    color: Colors.white54,
                    size: 75,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "No Ongoing Tournment Found",
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w400,
                      color: Colors.white54,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: ListView.builder(
                padding: EdgeInsets.all(4),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: 3,
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
                            builder: (context) => TournamentDetailsPage(),
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
                                    Text(
                                      "Battle Royale",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                    RichText(
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
                                            text: " 13 Dec, 12:00PM",
                                            style: TextStyle(
                                              color: Colors.white54,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                ButtonTheme(
                                  height: 32,
                                  minWidth: 64,
                                  child: RaisedButton(
                                    elevation: 0,
                                    onPressed: () {},
                                    child: Text("OPEN"),
                                    color: Colors.red.shade800,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 8),
                            LinearProgressIndicator(
                              value: 1017 / 4800,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                  Colors.red.shade700),
                            ),
                            SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "3783 slots left",
                                  style: TextStyle(color: Colors.white54),
                                ),
                                Text(
                                  "Total 4800 spots",
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
                                      TextSpan(
                                        text: " 5000",
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
                                        text: " Mobile",
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
                                        text: " Solo",
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
            ),
          ],
        ),
      ),
    );
  }
}

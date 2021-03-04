import 'package:bot_toast/bot_toast.dart';
import 'package:double_back_to_close/double_back_to_close.dart';
import 'package:evorgaming/utils/globals.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'navigation_page.dart';
import 'pages/login_page.dart';
import 'providers/navigation_provider.dart';
import 'providers/userdata_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  final prefs = await SharedPreferences.getInstance();
  await Firebase.initializeApp();
  final _loggedIn = prefs.getBool('loggedin') ?? false;

  runApp(MyApp(
    prefs: prefs,
    loggedIn: _loggedIn,
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key key, this.loggedIn, this.prefs}) : super(key: key);

  final bool loggedIn;
  final SharedPreferences prefs;

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    setupFirebase();

    super.initState();
  }

  void setupFirebase() async {
    firebaseMessaging = FirebaseMessaging.instance;

    NotificationSettings settings = await firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    String token = await firebaseMessaging.getToken(
      vapidKey:
          "BAC9rnW6UYRatokqTpW3sPk7aDWp_09O-FVoc7TfSQKquo3f6CPBfkcac1O0Xv0fIFzc1zK2mARbEHGntRq1OCk",
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<NavigationProvider>(
          create: (_) => NavigationProvider(),
          lazy: false,
        ),
        Provider<UserData>(
          create: (context) => UserData(widget.prefs),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          accentColor: Colors.red,
          cardColor: Colors.black38,
        ),
        home: DoubleBack(
          child: widget.loggedIn ? NavPage() : LoginPage(),
          waitForSecondBackPress: 3,
        ),
        builder: BotToastInit(),
        navigatorObservers: [BotToastNavigatorObserver()],
      ),
    );
  }
}

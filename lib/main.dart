import 'package:evorgaming/providers/userdata_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'navigation_page.dart';
import 'pages/login_page.dart';
import 'providers/navigation_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  final prefs = await SharedPreferences.getInstance();
  final _loggedIn = prefs.getBool('loggedin') ?? false;

  runApp(MyApp(
    prefs: prefs,
    loggedIn: _loggedIn,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key key, this.loggedIn, this.prefs}) : super(key: key);

  final bool loggedIn;
  final SharedPreferences prefs;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<NavigationProvider>(
          create: (_) => NavigationProvider(),
          lazy: false,
        ),
        Provider<UserData>(
          create: (context) => UserData(prefs),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          accentColor: Colors.red,
          // scaffoldBackgroundColor: Colors.black,
          cardColor: Colors.black38,
        ),
        home: loggedIn ? NavPage() : LoginPage(),
        builder: BotToastInit(),
        navigatorObservers: [BotToastNavigatorObserver()],
      ),
    );
  }
}

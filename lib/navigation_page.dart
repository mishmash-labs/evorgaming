import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/account_page.dart';
import 'pages/discover_page.dart';
import 'pages/home_page.dart';
import 'pages/shop_page.dart';
import 'providers/navigation_provider.dart';

class NavPage extends StatelessWidget {
  const NavPage({
    Key key,
  }) : super(key: key);

  static final pageList = <Widget>[
    HomePage(),
    ShopPage(),
    DiscoverPage(),
    AccountPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final navWatcher = context.watch<NavigationProvider>();

    return Scaffold(
      body: PageTransitionSwitcher(
        transitionBuilder: (
          child,
          animation,
          secondaryAnimation,
        ) =>
            FadeThroughTransition(
          animation: animation,
          secondaryAnimation: secondaryAnimation,
          child: child,
        ),
        child: pageList[navWatcher.pageIndex],
      ),
      bottomNavigationBar: _BottomNavBar(navWatcher: navWatcher),
    );
  }
}

class _BottomNavBar extends StatelessWidget {
  const _BottomNavBar({
    Key key,
    @required this.navWatcher,
  }) : super(key: key);

  final NavigationProvider navWatcher;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 0,
      selectedItemColor: Colors.red.shade700,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.black45,
      onTap: (val) {
        navWatcher.pageIndex = val;
      },
      currentIndex: navWatcher.pageIndex,
      iconSize: 22,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_bag),
          label: 'Shop',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Discover',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Account',
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:movieapp2/UI/news/news_screen.dart';
import 'package:movieapp2/colors.dart';
import 'package:movieapp2/provider/appProvider.dart';
import 'package:provider/provider.dart';
import 'UI/favourit_screen/favourti_movies_screen.dart';
import 'UI/home_screen/home.dart';
import 'UI/profile/profile_screen.dart';
import 'UI/search_movies/search_movies_screen.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

class Nav extends StatefulWidget {
  final String userId;
  Nav({this.userId});
  @override
  _NavState createState() => _NavState();
}

class _NavState extends State<Nav> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> _widgetOptions = <Widget>[
      Home(),
      FavMoviesScreen(),
      SearchScreen(),
      NewsScreen(userid: widget.userId),
      ProfileScreen(),
    ];
    return Consumer<AppProvider>(builder: (buildContext, moviesProvider, _) {
      return Scaffold(
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: ColorsCollection.mainColor,
          ),
          child: SafeArea(
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 3, bottom: 3, left: 2, right: 2),
              child: GNav(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                rippleColor: Colors.grey[300],
                hoverColor: Colors.grey[100],
                gap: 8,
                activeColor: Colors.white,
                iconSize: 20,
                haptic: true, // haptic feedback
                tabBorderRadius: 25,

                curve: Curves.easeOutExpo, // tab animation curves
                duration: Duration(milliseconds: 400),
                tabBackgroundColor: ColorsCollection.secondaryColor,
                color: Colors.white,
                tabs: [
                  GButton(
                    icon: LineIcons.home,
                    text: 'Home',
                  ),
                  GButton(
                    icon: LineIcons.heart,
                    text: 'Saves',
                  ),
                  GButton(
                    icon: LineIcons.search,
                    text: 'Search',
                  ),
                  GButton(
                    icon: LineIcons.newspaper,
                    text: 'News',
                  ),
                  GButton(
                    icon: LineIcons.user,
                    text: 'Profile',
                  ),
                ],
                selectedIndex: _selectedIndex,
                onTabChange: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
              ),
            ),
          ),
        ),
      );
    });
  }
}

import 'package:codelab_full_project/controllers/generator_page.dart';
import 'package:flutter/material.dart';

import '../controllers/favorite_pages.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    var colorSceme = Theme.of(context).colorScheme;
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = GenaratorPage();
        break;
      case 1:
        page = FavoritePage();
        break;
      default:
        throw UnimplementedError("no widget for $selectedIndex");
    }
    var mainArea = ColoredBox(
      color: colorSceme.surfaceVariant,
      child: AnimatedSwitcher(
        duration: Duration(
          seconds: 2,
        ),
        child: page,
      ),
    );
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        if (constraints.maxWidth < 450) {
          return Column(
            children: [
              Expanded(
                child: SafeArea(
                  child: BottomNavigationBar(
                    items: [
                      BottomNavigationBarItem(
                        icon: Icon(Icons.home),
                        label: 'Home',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(
                          Icons.favorite,
                        ),
                        label: 'Favorites',
                      ),
                    ],
                    currentIndex: 0,
                    onTap: (value) {
                      setState(() {
                        selectedIndex = value;
                      });
                    },
                  ),
                ),
              ),
            ],
          );
        } else {
          return Row(
            children: [
              SafeArea(
                child: NavigationRail(
                  extended: constraints.maxWidth >= 600,
                  destinations: [
                    NavigationRailDestination(
                      icon: Icon(
                        Icons.home,
                      ),
                      label: Text(
                        'Home',
                      ),
                    ),
                    NavigationRailDestination(
                      icon: Icon(
                        Icons.favorite,
                      ),
                      label: Text(
                        'Favorite',
                      ),
                    ),
                  ],
                  selectedIndex: selectedIndex,
                  onDestinationSelected: (value) {
                    setState(() {
                      selectedIndex = value;
                    });
                  },
                ),
              ),
              Expanded(child: mainArea),
            ],
          );
        }
      }),
    );
  }
}

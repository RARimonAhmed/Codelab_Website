import 'package:codelab_full_project/controllers/app_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var appState = context.watch<MyAppState>();
    if (appState.favorites.isEmpty) {
      return Center(
        child: Text('No favorites yet.'),
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(30),
          child: Text('You have ${appState.favorites.length} favorites'),
        ),
        Expanded(
          child: GridView(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 400,
              childAspectRatio: 400 / 80,
            ),
            children: [
              for (var pair in appState.favorites)
                ListTile(
                  leading: IconButton(
                    icon: Icon(
                      Icons.delete_outline,
                      semanticLabel: 'Delete',
                    ),
                    onPressed: () {
                      appState.removeFavorite(pair);
                    },
                  ),
                  title: Text(
                    pair.asLowerCase,
                    semanticsLabel: pair.asPascalCase,
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}

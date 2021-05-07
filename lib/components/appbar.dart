import 'package:flutter/material.dart';
import 'package:flutter_rickmorty/screens/favorites.dart';
import 'package:flutter_rickmorty/screens/search.dart';

class AppBarContent extends StatelessWidget implements PreferredSizeWidget {
  const AppBarContent({
    Key key,
    @required this.title,
    @required this.appBar,
  });

  final AppBar appBar;
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xff34495e),
      title: Text(title),
      actions: [
        IconButton(
          icon: Icon(Icons.search_rounded),
          onPressed: () {
            Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return Search();
            }),
          );
          },
        ),
        IconButton(
          icon: Icon(Icons.favorite_border),
          onPressed: () {
            Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return Favorites();
            }),
          );
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);
}

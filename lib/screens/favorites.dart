import 'package:flutter/material.dart';
import 'package:flutter_rickmorty/backend/favorites_list.dart';
import 'package:flutter_rickmorty/components/appbar.dart';

class Favorites extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarContent(
        appBar: AppBar(),
        title: 'Favoritos',
      ),
      backgroundColor: Color(0xffecf0f1),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FavoritesList(),
          ],
        ),
      ),
    );
  }
}
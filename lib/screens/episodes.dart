import 'package:flutter/material.dart';
import 'package:flutter_rickmorty/components/appbar.dart';
import 'package:flutter_rickmorty/backend/rickmorty_episodes.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Episodes extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarContent(
        appBar: AppBar(),
        title: 'Lista de Episódios',
      ),
      backgroundColor: Color(0xffecf0f1),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/icons/rick1.svg',
                  height: 70,
                ),
                SizedBox(width: 20),
                SvgPicture.asset(
                  'assets/icons/morty1.svg',
                  height: 70,
                ),
              ],
            ),
            EpisodesList(),
          ],
        ),
      ),
    );
  }
}

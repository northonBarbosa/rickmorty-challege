import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_rickmorty/backend/rickmorty_season.dart';
import 'package:flutter_rickmorty/components/appbar.dart';

class Season extends StatelessWidget {
  const Season({
    this.title,
    this.icon,
    this.seasonNumber,
  });

  final String title;
  final String icon;
  final String seasonNumber;

  @override
  Widget build(BuildContext context) {
    String icon2;
    String icon3;

    if (seasonNumber == "S01" || seasonNumber == "S04") {
      icon2 = 'portal.svg';
      icon3 = 'whisky.svg';
    } else {
      icon2 = 'ufo.svg';
      icon3 = 'backpack.svg';
    }

    return Scaffold(
      appBar: AppBarContent(
        appBar: AppBar(),
        title: title,
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
                  'assets/icons/$icon2',
                  height: 45,
                ),
                SizedBox(width: 20),
                SvgPicture.asset(
                  'assets/icons/$icon',
                  height: 70,
                ),
                SizedBox(width: 20),
                SvgPicture.asset(
                  'assets/icons/$icon3',
                  height: 45,
                ),
              ],
            ),
            SeasonEpisodes(season: seasonNumber),
          ],
        ),
      ),
    );
  }
}

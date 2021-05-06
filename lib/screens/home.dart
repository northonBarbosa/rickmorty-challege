import 'package:flutter/material.dart';
import 'package:flutter_rickmorty/components/all_episodes_button.dart';
import 'package:flutter_rickmorty/components/appbar.dart';
import 'package:flutter_rickmorty/components/seasons_card.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBarContent(
        title: 'Home',
        appBar: AppBar(),
      ),
      backgroundColor: Color(0xffecf0f1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(height: 10),
          Container(
            width: screenWidth * 0.60,
            child: Image.asset('assets/images/theappdimension.png'),
          ),
          Row(
            children: [
              SeasonCard(
                image: 'wallpaper1.jpg',
                season: '1ª Temporada',
                color: Color(0xff9b59b6),
                seasonNumber: 'S01',
                icon: 'rick1.svg',
              ),
              SeasonCard(
                image: 'wallpaper2.jpg',
                season: '2ª Temporada',
                color: Color(0xffB53471),
                icon: 'morty1.svg',
              ),
            ],
          ),
          Row(
            children: [
              SeasonCard(
                image: 'wallpaper3.png',
                season: '3ª Temporada',
                color: Color(0xff34495e),
                seasonNumber: 'S03',
                icon: 'morty1.svg',
              ),
              SeasonCard(
                image: 'wallpaper4.jpeg',
                season: '4ª Temporada',
                color: Color(0xff2980b9),
                seasonNumber: 'S04',
                icon: 'rick1.svg',
              ),
            ],
          ),
          AllEpisodesButton(),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}

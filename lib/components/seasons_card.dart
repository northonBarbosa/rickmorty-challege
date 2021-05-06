import 'package:flutter/material.dart';
import 'package:flutter_rickmorty/screens/season.dart';

class SeasonCard extends StatelessWidget {
  const SeasonCard({
    this.season,
    this.icon,
    this.image,
    this.color,
    this.seasonNumber,
  });

  final String season;
  final String icon;
  final String image;
  final Color color;
  final String seasonNumber;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Flexible(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return Season(title: season, icon: icon, seasonNumber: seasonNumber,);
              },
            ),
          );
        },
        child: Container(
          height: screenHeight * 0.2,
          padding: EdgeInsets.all(5),
          margin: EdgeInsets.fromLTRB(10, 5, 5, 10),
          color: color,
          child: Column(
            children: [
              Image.asset(
                'assets/images/$image',
              ),
              SizedBox(height: 15),
              Text(
                season,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey[50],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

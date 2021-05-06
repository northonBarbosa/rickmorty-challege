import 'package:flutter/material.dart';
import 'package:flutter_rickmorty/screens/season.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Color(0xff35485D).withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 5,
                  offset: Offset(0, 6)),
            ],
          ),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)),
                child: Image.asset(
                  'assets/images/$image',
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5,),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AutoSizeText(
                      season,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey[50],
                      ),
                    ),
                    Hero(
                      tag: 'icon$seasonNumber',
                      child: SvgPicture.asset(
                        'assets/icons/$icon',
                        height: screenHeight * 0.04,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

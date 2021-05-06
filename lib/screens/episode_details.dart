import 'package:flutter/material.dart';
import 'package:flutter_rickmorty/backend/rickmorty_characters.dart';
import 'package:flutter_rickmorty/components/appbar.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EpisodeDetails extends StatelessWidget {
  const EpisodeDetails({
    this.episodeTitle,
    this.episodeNumber,
    this.episodeDate,
    this.id,
  });

  final String episodeTitle;
  final String episodeNumber;
  final String episodeDate;
  final String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarContent(
        title: episodeNumber,
        appBar: AppBar(),
      ),
      backgroundColor: Color(0xffecf0f1),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10),
            SvgPicture.asset('assets/icons/watching-tv.svg', height: 85,),
            Container(
              margin: EdgeInsets.only(top: 15, left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    episodeTitle,
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff3498db),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    episodeNumber,
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xff34495e),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Data em que foi ao ar: $episodeDate',
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xff34495e),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            CharactersList(episodeId: id),
          ],
        ),
      ),
    );
  }
}

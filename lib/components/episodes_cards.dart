import 'package:flutter/material.dart';
import 'package:flutter_rickmorty/backend/episodes_database.dart';
import 'package:flutter_rickmorty/model/episode_fields.dart';

class EpisodesCard extends StatefulWidget {
  const EpisodesCard({
    this.episodeTitle,
    this.episodeNumber,
    this.episodeDate,
    this.episodeCharacters,
    this.id,
  });

  final String episodeTitle;
  final String episodeNumber;
  final String episodeDate;
  final String episodeCharacters;
  final String id;

  @override
  _EpisodesCardState createState() => _EpisodesCardState();
}

class _EpisodesCardState extends State<EpisodesCard> {

  Color _iconColorFavorite = Colors.blueGrey[400];
  Color _iconColorWatched = Colors.blueGrey[400];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: screenWidth * 0.8,
      margin: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Color(0xfff6e58d),
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Color(0xfff0932b).withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 5,
            offset: Offset(0, 5),
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //Informações dos Ep.
          Container(
            width: screenWidth * 0.7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.episodeTitle,
                  softWrap: true,
                  style: TextStyle(fontSize: 24.0),
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 10.0),
                Text(
                  widget.episodeNumber,
                  style: TextStyle(fontSize: 14.0),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Data: ${widget.episodeDate}',
                  style: TextStyle(fontSize: 18.0),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Personagens no Ep.: ${widget.episodeCharacters}',
                  style: TextStyle(fontSize: 18.0),
                ),
              ],
            ),
          ),

          //Favoritar e marcar como visto.
          Container(
            child: Column(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.favorite,
                    size: 35,
                  ),
                  color: _iconColorFavorite,
                  onPressed: () {
                    setState(() {
                      if (_iconColorFavorite == Colors.blueGrey[400]) {
                        _iconColorFavorite = Colors.red;
                        addFavorite();
                      } else {
                        _iconColorFavorite = Colors.blueGrey[400];
                        deleteFavorite();
                      }
                    });
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.live_tv,
                    size: 35,
                  ),
                  color: _iconColorWatched,
                  onPressed: () {
                    setState(() {
                      _iconColorWatched == Colors.blueGrey[400]
                          ? _iconColorWatched = Colors.green
                          : _iconColorWatched = Colors.blueGrey[400];
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future addFavorite() async {
    final episode = Episode(
      episodeId: widget.id,
      title: widget.episodeTitle,
      episodeNumber: widget.episodeNumber,
      airDate: widget.episodeDate,
      characters: widget.episodeCharacters,
      favorite: true,
      watched: true,
    );

    print('ok');

    await EpisodesDatabase.instance.create(episode);
  }

  Future deleteFavorite() async {}
}

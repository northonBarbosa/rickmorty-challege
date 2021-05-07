import 'package:flutter/material.dart';
import 'package:flutter_rickmorty/components/episodes_cards.dart';
import 'package:flutter_rickmorty/screens/episode_details.dart';

class FavoritesList extends StatefulWidget {
  @override
  _FavoritesListState createState() => _FavoritesListState();
}

class _FavoritesListState extends State<FavoritesList> {
  @override
  Widget build(BuildContext context) {
    List episodes = [];
    
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: episodes.length,
      itemBuilder: (context, index) {
        final episode = episodes[index];

        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return EpisodeDetails(
                    episodeTitle: episode.title,
                    episodeNumber: episode.episodeNumber,
                    episodeDate: episode.airDate,
                    id: episode.episodeId,
                  );
                },
              ),
            );
          },
          child: EpisodesCard(
            episodeTitle: episode.title,
            episodeNumber: episode.episodeNumber,
            episodeDate: episode.airDate,
            episodeCharacters: episode.characters,
          ),
        );
      },
    );
  }
}

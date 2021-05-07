import 'package:flutter/material.dart';
import 'package:flutter_rickmorty/backend/episodes_database.dart';
import 'package:flutter_rickmorty/components/episodes_cards.dart';
import 'package:flutter_rickmorty/model/episode_fields.dart';
import 'package:flutter_rickmorty/screens/episode_details.dart';

class FavoritesList extends StatefulWidget {
  @override
  _FavoritesListState createState() => _FavoritesListState();
}

class _FavoritesListState extends State<FavoritesList> {
  List<Episode> episodes;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    refreshEpisodes();
  }

  @override
  void dispose() {
    EpisodesDatabase.instance.close();

    super.dispose();
  }

  Future refreshEpisodes() async {
    setState(() => isLoading = true);

    this.episodes = await EpisodesDatabase.instance.readAllFavoritesEpisodes();

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: isLoading
          ? CircularProgressIndicator()
          : episodes.isEmpty
              ? Text('Não há favoritos')
              : buildFavorites(),
    );
  }

  Widget buildFavorites() {
    print(episodes);
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

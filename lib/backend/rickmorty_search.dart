import 'package:flutter/material.dart';
import 'package:flutter_rickmorty/components/episodes_cards.dart';
import 'package:flutter_rickmorty/screens/episode_details.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class SearchResult extends StatelessWidget {
  const SearchResult({this.searchText});

  final String searchText;

  final String searchEpisodes = r"""
    query getEpisodes($name: String){
      episodes(filter:{name: $name}){
        results{
          id
          name
          air_date
          episode
          characters{
            id
            name
          }
        }
      }
    }
  """;

  @override
  Widget build(BuildContext context) {
    return Query(
      options: QueryOptions(
        document: gql(searchEpisodes),
        variables: {'name': searchText},
      ),
      builder: (QueryResult result, {fetchMore, refetch}) {
        if (result.hasException) {
          if (result.exception.linkException is NetworkException) {
            return Text("Erro na conexão com a Internet.");
          } else {
            return Text("Nenhum resultado encontrado.");
          }
        }

        if (result.isLoading) {
          return Container(
            margin: EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 15,
            ),
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        List episodes = result.data["episodes"]["results"];

        return ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: episodes.length,
          itemBuilder: (context, index) {
            final id = episodes[index]["id"];
            final name = episodes[index]["name"];
            final episode = episodes[index]["episode"];
            final airDate = episodes[index]["air_date"];
            final List characters = episodes[index]["characters"];

            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return EpisodeDetails(
                        episodeTitle: name,
                        episodeNumber: episode,
                        episodeDate: airDate,
                        id: id,
                      );
                    },
                  ),
                );
              },
              child: EpisodesCard(
                episodeTitle: name,
                episodeNumber: episode,
                episodeDate: airDate,
                episodeCharacters: characters.length.toString(),
              ),
            );
          },
        );
      },
    );
  }
}

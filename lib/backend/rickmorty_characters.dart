import 'package:flutter/material.dart';
import 'package:flutter_rickmorty/components/characters_cards.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class CharactersList extends StatelessWidget {
  const CharactersList({this.episodeId});

  final String episodeId;

  final String getCharacters = r"""
    query getCharacters($id: ID!){
      episode(id: $id){
        id
        episode
        characters{
          id
          name
          status
          image
          species
        }
      }
    }
  """;

  @override
  Widget build(BuildContext context) {

    return Query(
      options: QueryOptions(
        document: gql(getCharacters),
        variables: {'id': episodeId},
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
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        List characters = result.data["episode"]["characters"];

        return SizedBox(
          height: 300,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: characters.length,
            itemBuilder: (context, index) {
              final image = characters[index]["image"];
              final name = characters[index]["name"];
              final status = characters[index]["status"];
              final species = characters[index]["species"];

              return CharactersCard(
                characterName: name,
                characterImage: image,
                characterStatus: status,
                characterSpecies: species,
              );
            },
          ),
        );
      },
    );
  }
}

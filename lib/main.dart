import 'package:flutter/material.dart';
import 'package:flutter_rickmorty/screens/home.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

void main() async {
  await initHiveForFlutter();

  final HttpLink httpLink = HttpLink('https://rickandmortyapi.com/graphql');

  ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
      link: httpLink,
      cache: GraphQLCache(store: HiveStore()),
    ),
  );

  runApp(
    GraphQLProvider(
      client: client,
      child: MaterialApp(
        title: 'R&M - The App Dimension',
        home: HomePage(),
      ),
    ),
  );
}

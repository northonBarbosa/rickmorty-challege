import 'package:flutter/material.dart';
import 'package:flutter_rickmorty/backend/rickmorty_search.dart';
import 'package:flutter_rickmorty/components/appbar.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController _editingController = TextEditingController();
  String text;
  bool _visible = false;

  @override
  void dispose() {
    _editingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarContent(
        appBar: AppBar(),
        title: 'Procurar Episódios',
      ),
      backgroundColor: Colors.grey[50],
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
              child: TextField(
                controller: _editingController,
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.search),
                  labelText: 'Pesquisar',
                  hintText: 'Pesquisar por...',
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                onSubmitted: (String controllerText) {
                  setState(() {
                    text = _editingController.text;
                    _visible = true;
                  });
                },
              ),
            ),
            Visibility(
              visible: _visible,
              child: SearchResult(
                searchText: text,
              ),
            )
          ],
        ),
      ),
    );
  }
}

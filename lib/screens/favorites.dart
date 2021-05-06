import 'package:flutter/material.dart';
import 'package:flutter_rickmorty/components/appbar.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Favorites extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarContent(
        appBar: AppBar(),
        title: 'Lista de Episódios',
      ),
      backgroundColor: Color(0xffecf0f1),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10),
            SvgPicture.asset(
              'assets/icons/rick1.svg',
              height: 70,
            ),
            SizedBox(width: 20),
          ],
        ),
      ),
    );
  }
}
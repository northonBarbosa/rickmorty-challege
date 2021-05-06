import 'package:flutter/material.dart';
import 'package:flutter_rickmorty/screens/episodes.dart';

class AllEpisodesButton extends StatelessWidget {
  const AllEpisodesButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return Episodes();
            },
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 18),
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        decoration: BoxDecoration(
            color: Color(0xff009432),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Color(0xff35485D).withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 6,
                offset: Offset(0, 6),
              )
            ]),
        child: Text(
          'Todos os Episódios',
          style: TextStyle(
            color: Colors.grey[100],
            fontSize: 22,
            fontWeight: FontWeight.bold,
            shadows: [
              Shadow(
                color: Color(0xff34495e),
                offset: Offset(2, 2),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

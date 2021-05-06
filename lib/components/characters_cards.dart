import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CharactersCard extends StatelessWidget {
  const CharactersCard({
    this.characterName,
    this.characterStatus,
    this.characterImage,
    this.characterSpecies,
  });

  final String characterName;
  final String characterStatus;
  final String characterImage;
  final String characterSpecies;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    String statusIcon;

    if (characterStatus == "Alive") {
      statusIcon = 'heartbeat.svg';
    } else {
      statusIcon = 'death.svg';
    }

    return Container(
      width: screenWidth * 0.55,
      margin: EdgeInsets.symmetric(vertical: 25, horizontal: 18),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Color(0xff2ecc71),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
              color: Color(0xff27ae60),
              spreadRadius: 4,
              blurRadius: 5,
              offset: Offset(0, 5)),
        ],
      ),
      child: Stack(
        alignment: AlignmentDirectional.center,
        clipBehavior: Clip.none,
        children: [
          //Imagem do Personagem
          Positioned(
            top: -30,
            child: Container(
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                color: Color(0xff2ecc71),
                borderRadius: BorderRadius.circular(80),
                boxShadow: [
                  BoxShadow(
                      color: Color(0xff34495e).withOpacity(0.6),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 5)),
                ],
              ),
              child: CircleAvatar(
                radius: 45,
                backgroundImage: NetworkImage(
                  characterImage,
                  scale: 1,
                ),
              ),
            ),
          ),
          //Informações do Personagem
          Container(
            margin: EdgeInsets.only(top: 70),
            child: Column(
              children: [
                Text(
                  characterName,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Chip(
                  padding: EdgeInsets.symmetric(vertical: 3, horizontal: 5),
                  avatar: SvgPicture.asset('assets/icons/$statusIcon'),
                  label: Text('Status: $characterStatus'),
                  labelStyle: TextStyle(
                    fontSize: 16,
                  ),
                ),
                Chip(
                  label: Text('Espécie: $characterSpecies'),
                  labelStyle: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

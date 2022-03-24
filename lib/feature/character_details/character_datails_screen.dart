import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rick_and_morty/feature/character_details/widgets/image_circle_widget.dart';
import 'package:rick_and_morty/feature/shared/commom/domain/entities/character_entity.dart';
import 'package:rick_and_morty/feature/shared/style/constants.dart';

class CharactesrDetails extends StatelessWidget {
  const CharactesrDetails(this.character, {Key? key}) : super(key: key);
  final CharacterEntity character;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackBackground,
      appBar: AppBar(
        backgroundColor: blackBackground,
        title: Text(
          character.name,
          style: GoogleFonts.dmSans(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0.0,
        // centerTitle: true,
      ),
      body: bodyWidget(context),
    );
  }

  bodyWidget(BuildContext context) => Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height / 1.4,
            width: MediaQuery.of(context).size.width - 30,
            margin: const EdgeInsets.only(top: 110, left: 15.0),
            child: Card(
              color: const Color(0xFF3B3F43),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  const SizedBox(height: 60.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        character.name.toUpperCase(),
                        style: detailName,
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      FilterChip(
                        onSelected: (a) {},
                        label: Row(
                          children: <Widget>[
                            character.isAlive ? alive : dead,
                            const SizedBox(width: 6),
                            Text(
                              "${character.status} - ${character.species}",
                              style: bp24,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Row(
                      children: <Widget>[
                        Text("Gender: ", style: gp24),
                        Text(character.gender, style: wp24),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 29.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text("Origin: ", style: gp24),
                        Text(character.origin.name, style: wp24),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          ImageCircleWidget(character.image),
        ],
      );
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rick_and_morty/feature/shared/commom/domain/entities/character_entity.dart';
import 'package:rick_and_morty/feature/shared/style/constants.dart';

class CardCharacterWidget extends StatelessWidget {
  const CardCharacterWidget(
    this.character, {
    Key? key,
  }) : super(key: key);
  final CharacterEntity character;
  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 20.0),
        child: SizedBox(
          height: 200,
          child: Stack(
            children: <Widget>[
              Center(
                child: Container(
                  height: 200.0,
                  margin: const EdgeInsets.only(left: 46.0),
                  decoration: BoxDecoration(
                    color: const Color(0xFF3B3F43),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10.0,
                        offset: Offset(0.0, 10.0),
                      ),
                    ],
                  ),
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(105.0, 16.0, 16.0, 16.0),
                    constraints: const BoxConstraints.expand(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          character.name,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.dmSans(
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Row(
                          children: <Widget>[
                            character.isAlive
                                ? Container(
                                    height: 12,
                                    width: 12,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.green,
                                    ),
                                  )
                                : Container(
                                    height: 12,
                                    width: 12,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.red,
                                    ),
                                  ),
                            const SizedBox(width: 5),
                            Flexible(
                              child: Text(
                                "${character.status} - ${character.species}",
                                style: wp14,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        Text("Origin:", style: originText),
                        const SizedBox(height: 5.0),
                        Expanded(
                          child: Text(character.origin.name, style: originName),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                alignment: FractionalOffset.centerLeft,
                child: Hero(
                  tag: character.image,
                  child: CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage(character.image),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:rick_and_morty/feature/character/presentation/controller/character_controller.dart';

class SearchCharacterWidget extends StatelessWidget {
  const SearchCharacterWidget({Key? key, required this.controller})
      : super(key: key);
  final CharacterController controller;
  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Colors.white,
      autofocus: true,
      style: const TextStyle(color: Colors.white),
      decoration: const InputDecoration(
        iconColor: Colors.white,
        prefixIcon: Icon(
          Icons.search,
          color: Colors.white,
        ),
        counterStyle: TextStyle(color: Colors.white),
        focusColor: Colors.white,
        disabledBorder: OutlineInputBorder(),
      ),
      onChanged: (value) {
        controller.getCharacter(name: value);
      },
    );
  }
}

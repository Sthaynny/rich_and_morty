import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:rick_and_morty/feature/character/presentation/controller/character_controller.dart';
import 'package:rick_and_morty/feature/character/presentation/widgets/card_character_widget.dart';
import 'package:rick_and_morty/feature/shared/constants.dart';
import 'package:rick_and_morty/injection_conatiner.dart';

class CharacterScreen extends StatefulWidget {
  const CharacterScreen({Key? key}) : super(key: key);

  @override
  State<CharacterScreen> createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {
  ScrollController scrollController = ScrollController();
  late final CharacterController controller;
  @override
  void initState() {
    super.initState();
    controller = dependency();
    scrollController.addListener(() {
      if (scrollController.keepScrollOffset) {
        // ignore: avoid_print
        print('final');
      }
    });
    controller.getCharacter();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF202428),
        appBar: AppBar(
          backgroundColor: const Color(0xFF202428),
          elevation: 0.0,
          title: Obx(() => controller.isSearch
              ? TextField(
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
                )
              : Text("The Rick and Morty Guide", style: appbarStyle)),
          actions: <Widget>[
            IconButton(
              icon: Obx(() => controller.isSearch
                  ? const Icon(Icons.close)
                  : const Icon(Icons.search)),
              onPressed: () {
                controller.setIndicatorSearche();
              },
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Obx(
                () => body(),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget body() {
    switch (controller.status.value) {
      case CharacterStatus.loading:
        return const Center(
          child: CircularProgressIndicator(),
        );

      case CharacterStatus.success:
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: RefreshIndicator(
            onRefresh: () async {
              controller.getCharacter();
            },
            child: ListView(
              shrinkWrap: true,
              controller: scrollController,
              children: List.generate(
                controller.lengthCharacters,
                (index) => CardCharacterWidget(
                  controller.characters[index],
                ),
              ),
            ),
          ),
        );
      default:
        return Center(
          child: Text(
            'Sorry, your search could not be found. Please try again.',
            style: originName,
          ),
        );
    }
  }
}

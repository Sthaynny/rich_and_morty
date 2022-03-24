import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:rick_and_morty/feature/character/presentation/controller/character_controller.dart';
import 'package:rick_and_morty/feature/character/presentation/widgets/card_character_shimmer.dart';
import 'package:rick_and_morty/feature/character/presentation/widgets/card_character_widget.dart';
import 'package:rick_and_morty/feature/character/presentation/widgets/search_character_widget.dart';
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
      if (scrollController.position.extentAfter <= 0 &&
          !controller.isNextPageLoading) {
        controller.getNextPage();
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
              ? SearchCharacterWidget(
                  controller: controller,
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
        body: RefreshIndicator(
          onRefresh: () async {
            controller.getCharacter();
          },
          child: Obx(
            () => ListView(
              controller: scrollController,
              children: [
                ...body(),
                if (controller.isNextPageLoading)
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> body() {
    switch (controller.status.value) {
      case CharacterStatus.loading:
        return List.generate(20, (index) => const ChardCharacterShimmer());

      case CharacterStatus.success:
        return List.generate(
          controller.lengthCharacters,
          (index) => CardCharacterWidget(
            controller.characters[index],
          ),
        );
      default:
        return [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
            alignment: Alignment.center,
            child: Text(
              'Sorry, your search could not be found. Please try again.',
              style: originName,
            ),
          ),
          Image.asset(
            'assets/images/error.png',
          ),
        ];
    }
  }
}

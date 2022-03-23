import 'package:get_it/get_it.dart';
import 'package:rick_and_morty/feature/character/domain/usecases/get_character_usecase.dart';

class CharacterInjection {
  void call(GetIt dependency) {
    dependency.registerFactory(
      () => GetCharacterUsecase(
        dependency(),
      ),
    );
  }
}

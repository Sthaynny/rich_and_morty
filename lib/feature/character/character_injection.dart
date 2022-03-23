import 'package:get_it/get_it.dart';
import 'package:rick_and_morty/feature/character/data/datasouces/character_datasource.dart';
import 'package:rick_and_morty/feature/character/data/repositories/character_respository.dart';
import 'package:rick_and_morty/feature/character/domain/repositories/icharacter_repository.dart';
import 'package:rick_and_morty/feature/character/domain/usecases/get_character_usecase.dart';

class CharacterInjection {
  void call(GetIt dependency) {
    dependency.registerFactory(
      () => CharacterDatasource(),
    );
    dependency.registerFactory<ICharacterRepository>(
      () => CharacterRepository(
        dependency(),
      ),
    );
    dependency.registerFactory(
      () => GetCharacterUsecase(
        dependency(),
      ),
    );
  }
}

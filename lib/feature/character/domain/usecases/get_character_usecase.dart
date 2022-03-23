import 'package:rick_and_morty/core/utils/result_api.dart';
import 'package:rick_and_morty/feature/character/domain/repositories/icharacter_repository.dart';

class GetCharacterUsecase {
  GetCharacterUsecase(this.repository);
  final ICharacterRepository repository;
  Future<ResultApi?> call({String name = '', required int page}) async {
    return await repository.getCharacter(page: page, name: name);
  }
}

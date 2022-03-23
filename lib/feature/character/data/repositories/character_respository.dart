import 'package:pop_network/pop_network.dart';
import 'package:rick_and_morty/core/utils/result_api.dart';
import 'package:rick_and_morty/feature/character/data/datasouces/character_datasource.dart';
import 'package:rick_and_morty/feature/character/domain/repositories/icharacter_repository.dart';

class CharacterRepository implements ICharacterRepository {
  final CharacterDatasource _datasource;
  CharacterRepository(
    this._datasource,
  );
  @override
  Future<ResultApi?> getCharacter({String name = '', required int page}) async {
    final result = await _datasource.getCharacter(page: page, name: name);
    if (result is Success) {
      try {
        return ResultApi.fromMap(result.data);
      } catch (e) {
        return null;
      }
    }
    return null;
  }
}

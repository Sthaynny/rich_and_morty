import 'package:rick_and_morty/core/utils/result_api.dart';

abstract class ICharacterRepository {
  Future<ResultApi?> getCharacter({String name, required int page});
}

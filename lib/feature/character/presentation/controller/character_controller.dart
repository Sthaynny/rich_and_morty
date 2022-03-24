import 'package:get/get.dart';
import 'package:rick_and_morty/core/utils/result_api.dart';
import 'package:rick_and_morty/feature/character/domain/usecases/get_character_usecase.dart';
import 'package:rick_and_morty/feature/shared/commom/domain/entities/character_entity.dart';

enum CharacterStatus {
  empty,
  loading,
  success,
  error,
}

class CharacterController extends GetxController {
  CharacterController(this._usecase);
  final GetCharacterUsecase _usecase;
  final status = CharacterStatus.empty.obs;
  final resultApi = ResultApi.empty().obs;
  final searchName = ''.obs;
  final _seach = false.obs;

  bool get isLoading => status.value == CharacterStatus.loading;
  bool get isError => status.value == CharacterStatus.error;
  bool get isEmpty => status.value == CharacterStatus.empty;
  bool get isSearch => _seach.value;
  void setIndicatorSearche() {
    _seach.value = !isSearch;
  }

  List<CharacterEntity> get characters => resultApi.value.characters;
  int get lengthCharacters => resultApi.value.characters.length;

  Future<void> getCharacter({
    String name = '',
  }) async {
    status.value = CharacterStatus.loading;
    searchName.value = name;
    if (resultApi.value.next) {
      final result = await _usecase(
          name: searchName.value, page: resultApi.value.page + 1);
      if (result != null) {
        resultApi.value = result;
        status.value = CharacterStatus.success;
      } else {
        status.value = CharacterStatus.error;
      }
    }

    status.value = CharacterStatus.success;
  }
}

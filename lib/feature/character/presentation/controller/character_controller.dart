import 'package:get/get.dart';
import 'package:rick_and_morty/core/utils/result_api.dart';
import 'package:rick_and_morty/feature/character/domain/usecases/get_character_usecase.dart';

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

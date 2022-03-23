import 'dart:convert';

import 'package:rick_and_morty/feature/shared/commom/data/models/character_model.dart';
import 'package:rick_and_morty/feature/shared/commom/domain/entities/character_entity.dart';

class ResultApi {
  int count;
  int page;
  bool next;
  bool prev;
  List<CharacterEntity> characters;
  ResultApi({
    required this.count,
    required this.page,
    required this.next,
    required this.prev,
    required this.characters,
  });

  factory ResultApi.empty() {
    return ResultApi(
      count: 0,
      page: 0,
      next: true,
      prev: false,
      characters: [],
    );
  }

  factory ResultApi.fromMap(Map<String, dynamic> map) {
    final Map<String, dynamic> info = map['info'];
    final Map<String, dynamic> result = map['result'];
    return ResultApi(
      count: info['count']?.toInt() ?? 0,
      page: info['page']?.toInt() ?? 0,
      next: info.containsKey('next') ? true : false,
      prev: info.containsKey('prev') ? true : false,
      characters: result.containsKey('characters')
          ? List<CharacterEntity>.from(
              map['result']['characters']?.map(
                (x) => CharacterModel.fromMap(x),
              ),
            )
          : [],
    );
  }

  factory ResultApi.fromJson(String source) =>
      ResultApi.fromMap(json.decode(source));
}

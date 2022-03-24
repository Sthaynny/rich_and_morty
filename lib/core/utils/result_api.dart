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
      page: 1,
      next: true,
      prev: false,
      characters: [],
    );
  }

  factory ResultApi.fromMap(Map<String, dynamic> map) {
    final Map<String, dynamic> info = map['info'];
    final listCharacters =
        (map['results'] as List).map((e) => CharacterModel.fromMap(e)).toList();
    return ResultApi(
      count: info['count']?.toInt() ?? 0,
      page: info['page']?.toInt() ?? 0,
      next: info.containsKey('next') ? true : false,
      prev: info.containsKey('prev') ? true : false,
      characters: listCharacters,
    );
  }

  factory ResultApi.fromJson(String source) =>
      ResultApi.fromMap(json.decode(source));

  ResultApi copyWith({
    int? count,
    int? page,
    bool? next,
    bool? prev,
    List<CharacterEntity>? characters,
  }) {
    return ResultApi(
      count: count ?? this.count,
      page: page ?? this.page,
      next: next ?? this.next,
      prev: prev ?? this.prev,
      characters: characters ?? this.characters,
    );
  }
}

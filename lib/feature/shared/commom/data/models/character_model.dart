import 'dart:convert';

import 'package:rick_and_morty/feature/shared/commom/data/models/origin_model.dart';
import 'package:rick_and_morty/feature/shared/commom/domain/entities/character_entity.dart';
import 'package:rick_and_morty/feature/shared/commom/domain/entities/origin_entity.dart';

class CharacterModel extends CharacterEntity {
  CharacterModel({
    int? id = 0,
    String? name,
    String? status,
    String? species,
    String? type,
    String? gender,
    String? image,
    String? url,
    String? created,
    OriginEntity? origin,
    OriginEntity? location,
    List<String>? episode,
  }) : super(
          id: id,
          name: name,
          status: status,
          species: species,
          type: type,
          gender: gender,
          image: image,
          url: url,
          created: created,
          origin: origin,
          location: location,
          episode: episode,
        );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'status': status,
      'species': species,
      'type': type,
      'gender': gender,
      'origin': origin.model.toMap(),
      'location': location.model.toMap(),
      'image': image,
      'episode': episode,
      'url': url,
      'created': created,
    };
  }

  factory CharacterModel.fromMap(Map<String, dynamic> map) {
    return CharacterModel(
      id: map['id']?.toInt(),
      name: map['name'],
      status: map['status'],
      species: map['species'],
      type: map['type'],
      gender: map['gender'],
      origin: OriginModel.fromMap(map['origin']),
      location: OriginModel.fromMap(map['location']),
      image: map['image'],
      episode: List<String>.from(map['episode']),
      url: map['url'],
      created: map['created'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CharacterModel.fromJson(String source) =>
      CharacterModel.fromMap(json.decode(source));
}

import 'package:rick_and_morty/feature/shared/commom/domain/entities/origin_entity.dart';

class CharacterEntity {
  late final int id;
  late final String name;
  late final String status;
  late final String species;
  late final String type;
  late final String gender;
  late final OriginEntity origin;
  late final OriginEntity location;
  late final String image;
  late final List<String> episode;
  late final String url;
  late final String created;

  CharacterEntity({
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
  }) {
    this.id = id ?? 0;
    this.name = name ?? '';
    this.status = status ?? '';
    this.species = species ?? '';
    this.type = type ?? '';
    this.gender = gender ?? '';
    this.image = image ?? '';
    this.url = url ?? '';
    this.created = created ?? '';
    this.origin = origin ?? OriginEntity();
    this.location = location ?? OriginEntity();

    this.episode = episode ?? [];
  }

  bool get isAlive => status.toLowerCase().compareTo('alive') == 0;
}

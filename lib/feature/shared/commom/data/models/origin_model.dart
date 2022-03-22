import 'dart:convert';

import 'package:rick_and_morty/feature/shared/commom/domain/entities/origin_entity.dart';

class OriginModel extends OriginEntity {
  OriginModel({
    String name = '',
    String url = '',
  });

  OriginEntity get fromEntity => OriginEntity(name: name, url: url);

  OriginModel copyWith({
    String? name,
    String? url,
  }) {
    return OriginModel(
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'url': url,
    };
  }

  factory OriginModel.fromMap(Map<String, dynamic> map) {
    return OriginModel(
      name: map['name'],
      url: map['url'],
    );
  }

  String toJson() => json.encode(toMap());

  factory OriginModel.fromJson(String source) =>
      OriginModel.fromMap(json.decode(source));

  @override
  String toString() => 'OriginModel(name: $name, url: $url)';
}

extension OriginExt on OriginEntity {
  OriginModel get model => OriginModel(name: name, url: url);
}

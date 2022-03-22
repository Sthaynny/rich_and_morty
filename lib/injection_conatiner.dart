import 'package:get_it/get_it.dart';
import 'package:rick_and_morty/feature/character/character_injection.dart';

final dependency = GetIt.instance;

void setup() {
  CharacterInjection().call(dependency);
}

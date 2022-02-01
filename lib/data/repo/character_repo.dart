import 'package:breaking_bad/data/api/characters_api.dart';
import 'package:breaking_bad/data/models/character.dart';

class CharacterRepo {
  final CharactersApi charactersApi;

  CharacterRepo(this.charactersApi);
  Future<List<Character>> getAllCharacters() async {
    final characters = await charactersApi.getAllCharacters();
    return characters
        .map((character) => Character.fromJson(character))// Character is the model
        .toList();
  }
}

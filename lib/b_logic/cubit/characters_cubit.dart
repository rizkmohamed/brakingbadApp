import 'package:bloc/bloc.dart';
import 'package:breaking_bad/data/models/character.dart';
import 'package:breaking_bad/data/repo/character_repo.dart';
import 'package:meta/meta.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharacterRepo characterRepo;
   List<Character> characters = [];
  CharactersCubit(this.characterRepo) : super(CharactersInitial());
  List<Character> getCharacter() {
    characterRepo.getAllCharacters().then((character) {
      emit(CharactersLoaded(character));
      characters = character;
    });
    return characters;
  }
}

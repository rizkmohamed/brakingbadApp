import 'package:breaking_bad/b_logic/cubit/characters_cubit.dart';
import 'package:breaking_bad/data/models/character.dart';
import 'package:breaking_bad/helper/constants/colors.dart';
import 'package:breaking_bad/present/widgets/character_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharacterPage extends StatefulWidget {
  CharacterPage({Key? key}) : super(key: key);

  @override
  _CharacterPageState createState() => _CharacterPageState();
}

class _CharacterPageState extends State<CharacterPage> {
  late List<Character> allCharacters;
  @override
  void initState() {
    BlocProvider.of<CharactersCubit>(context).getCharacter();
    super.initState();
  }

  Widget buildBlocWidget() {
    return BlocBuilder<CharactersCubit, CharactersState>(
      builder: (context, state) {
        if (state is CharactersLoaded) {
          allCharacters = state.characters;
          return bulidloadedList();
        } else {
          return loadedIndicator();
        }
      },
    );
  }

  Widget loadedIndicator() {
    return Center(
      child: CircularProgressIndicator.adaptive(
        backgroundColor: MyColors.secondColor,
      ),
    );
  }

  Widget bulidloadedList() {
    return SingleChildScrollView(
      child: Container(
        color: MyColors.secondColor,
        child: Column(
          children: [buildCharactersList()],
        ),
      ),
    );
  }

  Widget buildCharactersList() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 2,
          childAspectRatio: 2 / 3,
          mainAxisSpacing: 2),
      shrinkWrap: true,
      itemCount: allCharacters.length,
      physics: const ClampingScrollPhysics(),
      itemBuilder: (context, index) => CharacterItem(
        character: allCharacters[index],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'characters',
        ),
      ),
      body:
          //  Center(child: Text('rezk'))
          buildBlocWidget(),
    );
  }
}

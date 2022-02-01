import 'package:breaking_bad/b_logic/cubit/characters_cubit.dart';
import 'package:breaking_bad/data/api/characters_api.dart';
import 'package:breaking_bad/data/repo/character_repo.dart';
import 'package:breaking_bad/helper/constants/strings.dart';
import 'package:breaking_bad/present/pages/character_page.dart';
import 'package:breaking_bad/present/pages/details_page.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  late CharacterRepo characterRepo;
  late CharactersCubit charactersCubit;
  AppRouter() {
    characterRepo = CharacterRepo(CharactersApi());
    charactersCubit = CharactersCubit(characterRepo);
  }
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case characterPage:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => CharactersCubit(characterRepo),
                  child: CharacterPage(),
                ));
      case characterDetailsPage:
        return MaterialPageRoute(builder: (_) => CharacterDetailsPage());
    }
  }
}

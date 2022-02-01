import 'package:breaking_bad/data/models/character.dart';
import 'package:breaking_bad/helper/constants/colors.dart';
import 'package:flutter/material.dart';

class CharacterItem extends StatelessWidget {
  final Character character;
  const CharacterItem({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      margin: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: EdgeInsetsDirectional.all(5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: MyColors.mywhite),
      child: GridTile(
        child: Container(
          color: MyColors.secondColor,
          child: character.img.isNotEmpty
              ? FadeInImage.assetNetwork(
                  width: double.infinity,
                  height: double.infinity,
                  placeholder: 'assets/images/9629-loading.gif',
                  image: character.img,
                  fit: BoxFit.cover,
                )
              : CircularProgressIndicator(),
        ),
        footer: Container(
          height: 40,
          width: double.infinity,
          child: Text(
            '${character.name}',
            style: TextStyle(
              height: 1.3,
              fontSize: 16,
              color: MyColors.mywhite,
              fontWeight: FontWeight.bold,
            ),
            //  Theme.of(context)
            //     .textTheme
            //     .bodyText2!
            //     .copyWith(color: MyColors.mywhite),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          alignment: Alignment.center,
          color: Colors.black54,
        ),
      ),
    );
  }
}

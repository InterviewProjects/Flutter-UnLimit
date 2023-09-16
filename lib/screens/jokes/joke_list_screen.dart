import 'package:flutter/material.dart';
import 'package:flutter_base/core/widgets/unlimit_screen_widget.dart';
import 'package:flutter_base/screens/jokes/joke_item.dart';
import 'package:flutter_base/screens/jokes/joke_list_controller.dart';
import 'package:get/get.dart';

class JokeListScreen extends UnLimitScreenWidget {
  const JokeListScreen() : super(key: null);

  @override
  Widget buildView(BuildContext context) {
    return GetX<JokeListController>(
        init: JokeListController(),
        builder: (myController) {
          final jokesColors = myController.jokeColorList;
          return (myController.jokeList.isNotEmpty
              ? ListView.builder(
              itemCount: myController.jokeList.length,
              itemBuilder: (context, index) {
                final currentColor = jokesColors[index % jokesColors.length];
                final nextColor = index == myController.jokeList.length - 1 ? Colors.white : jokesColors[(index + 1) % jokesColors.length];
                debugPrint('$currentColor $nextColor');
                return JokeItem(
                  message: myController.jokeList[index],
                  currentColor: currentColor,
                  nextColor: nextColor,
                );
              })
              : const Center(
            child: Text('No items available.'),
          ));
        });
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_base/core/controllers/unlimit_controller.dart';
import 'package:get/get.dart';
import 'dart:math' as math;

class JokeListController extends UnLimitController {
  List<Color> jokeColorList = [
    Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1),
    Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1),
    Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1),
    Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1),
    Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1),
    Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1),
    Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1),
    Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1),
    Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1),
    Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1),
  ];
  final jokeList = [].obs;


  Timer? _apiTimer;
  final int _apiTimerDurationInMin = 1;

  @override
  void onInit() {
    super.onInit();

    /// fetch the jokes from local storage
    _fetchAllJokes();

    /// start observing joke database changes
    _observingNewJokes();
  }

  /// fetch the jokes from local storage
  void _fetchAllJokes() async {
    List<String> list = await jokeListUseCase.fetchAllJokes();
    jokeList.value = list;

    _updateJokesFromApi();
  }

  /// start observing joke database changes
  void _observingNewJokes() async {
    Stream<Future<List<String>>> stream = await jokeListUseCase.getJokesAsStream();
    stream.listen((event) async {
      List<String> list = await event;
      jokeList.value = list;
    });
  }

  void _updateJokesFromApi() async {
    await jokeListUseCase.updateJokesFromApi();

    /// initiate api timer
    _initiateApiTimer();
  }

  void _initiateApiTimer() {
    _apiTimer = Timer.periodic(Duration(minutes: _apiTimerDurationInMin), (Timer timer) {
      _apiTimer?.cancel();
      _updateJokesFromApi();
    });
  }

  @override
  void dispose() {
    _apiTimer?.cancel();
    super.dispose();
  }
}
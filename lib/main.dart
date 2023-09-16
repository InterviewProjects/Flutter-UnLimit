import 'package:domain_package/domain_export.dart';
import 'package:domain_package/enums/app_env.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/screens/jokes/joke_list_screen.dart';
import 'package:get/get.dart';

void appMain(UnLimitEnvironment env) async {
  /// initialize the binding
  WidgetsFlutterBinding.ensureInitialized();

  /// domain layer
  await DomainLayer.addDomainLayerDependencies(env);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text('UnLimit Jokes')),
        body: const JokeListScreen(),
      ),
    );
  }
}
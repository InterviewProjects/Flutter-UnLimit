import 'package:domain_package/entities/api/unlimit_app_model.dart';
import 'package:domain_package/entities/joke/unlimit_joke_response.dart';

abstract class UnLimitJokeRepository {
  Future<List<String>> fetchAllJokes();
  Future<void> updateJokesFromApi();
  Future<Stream<Future<List<String>>>> getJokesAsStream();
}
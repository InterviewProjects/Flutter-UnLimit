import 'package:data_package/local/app_storage.dart';
import 'package:data_package/remote/network_controller.dart';
import 'package:domain_package/entities/joke/unlimit_joke_response.dart';
import 'package:domain_package/repositories/unlimit_joke_repository.dart';
import 'package:hive/hive.dart';

class UnLimitJokeRepositoryImpl implements UnLimitJokeRepository {
  final AppStorage _localAppStorage;
  final NetworkController _networkController;

  UnLimitJokeRepositoryImpl(this._localAppStorage, this._networkController);

  @override
  Future<Stream<Future<List<String>>>> getJokesAsStream() async {
    final Stream<BoxEvent> stream = await _localAppStorage.getJokesAsStream();
    final Stream<Future<List<String>>> streamMapper = stream.map((event) async {
      final jokeList = await _fetchJokeListFromDataBase();
      return jokeList;
    });
    return streamMapper;
  }

  @override
  Future<List<String>> fetchAllJokes() async {
    return await _fetchJokeListFromDataBase();
  }

  @override
  Future<void> updateJokesFromApi() async {
    final apiResponse = await _networkController.get<UnLimitJokeResponse>('api', queryParams: {'format': 'json'});
    if (apiResponse.isSuccess) {
      final joke = apiResponse.data?.joke;
      if (joke != null && joke.isNotEmpty == true) {
        final jokes = await _localAppStorage.getAllJokes();
        if (jokes.length == 10) {
          await _localAppStorage.removeJokeFromAppStorage();
        }
        await _localAppStorage.addJokeIntoAppStorage(joke);
      }
    }

    return Future.value();
  }

  Future<List<String>> _fetchJokeListFromDataBase() async {
    return _localAppStorage.getAllJokes();
  }
}
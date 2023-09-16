import 'package:domain_package/repositories/unlimit_joke_repository.dart';

class UnLimitJokeUseCase {
  final UnLimitJokeRepository _repository;
  UnLimitJokeUseCase(this._repository);

  Future<List<String>> fetchAllJokes() => _repository.fetchAllJokes();

  Future<void> updateJokesFromApi() => _repository.updateJokesFromApi();

  Future<Stream<Future<List<String>>>> getJokesAsStream() => _repository.getJokesAsStream();
}
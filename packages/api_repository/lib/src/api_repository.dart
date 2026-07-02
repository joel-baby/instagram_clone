/// {@template api_repository}
/// A fake api repository.
/// {@endtemplate}
class ApiRepository {
  /// {@macro api_repository}
  const ApiRepository();
  /// fetching todos
  List<String> fetchTodos() => ['Make food', 'drink water', 'do prayer'];
}

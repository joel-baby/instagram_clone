import 'package:api_repository/api_repository.dart';
import 'package:instagram_clone/app/view/app.dart';
import 'package:instagram_clone/bootstrap.dart';

Future<void> main() async {
  const apirespository = ApiRepository();
  await bootstrap(
    (powersyncRepository) {
      return const App(apiRepository: apirespository);
    },
    isDev: true,
  );
}

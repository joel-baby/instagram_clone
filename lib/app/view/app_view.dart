import 'package:flutter/material.dart';
import 'package:instagram_clone/counter/counter.dart';
import 'package:instagram_clone/l10n/l10n.dart';
import 'package:instagram_clone/todos/cubit/todos_cubit.dart';
import 'package:instagram_clone/todos/view/view_todos.dart';

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        useMaterial3: true,
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const ViewTodos(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram_clone/todos/cubit/todos_cubit.dart';

class ViewTodos extends StatefulWidget {
  const ViewTodos({super.key});

  @override
  State<ViewTodos> createState() => _ViewTodosState();
}

class _ViewTodosState extends State<ViewTodos> {
  @override
  void initState() {
    super.initState();
    context.read<TodosCubit>().fetchTodos();
  }

  @override
  Widget build(BuildContext context) {
    final todos = context.select((TodosCubit bloc) => bloc.state);
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                final todo = todos[index];
                return Text(
                  todo,
                  style: Theme.of(context).textTheme.headlineSmall,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

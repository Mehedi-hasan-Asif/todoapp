import 'package:flutter/material.dart';
import 'package:todoapp/entities/todo.dart';
import 'package:todoapp/ui/widgets/todoitem.dart';

class DoneTodoListTab extends StatelessWidget {
  const DoneTodoListTab(
      {super.key,
      required this.todoList,
      required this.onDelete,
      required this.onStatusChange});
  final List<Todo> todoList;
  final Function(int) onDelete;
  final Function(int) onStatusChange;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: todoList.length,
      itemBuilder: (context, index) {
        return Dismissible(
          background: Container(
            color: Colors.red,
            child: const Icon(Icons.delete),
          ),
          key: UniqueKey(),
          onDismissed: (_) {
            onDelete(index);
          },
          child: TodoItem(
            todo: todoList[index],
            onIconButtonPressed: () {
              onStatusChange(index);
            },
          ),
        );
      },
    );
  }
}

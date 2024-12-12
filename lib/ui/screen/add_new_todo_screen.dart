import 'package:flutter/material.dart';
import 'package:todoapp/entities/todo.dart';

class AddNewTodoScreen extends StatefulWidget {
  const AddNewTodoScreen({super.key, required this.onAddTodo});
  final Function(Todo) onAddTodo;

  @override
  State<AddNewTodoScreen> createState() => _AddNewTodoScreenState();
}

class _AddNewTodoScreenState extends State<AddNewTodoScreen> {
  final TextEditingController _titleEditingController = TextEditingController();
  final TextEditingController _descriptionEditingController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Todo'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _titleEditingController,
              decoration:
                  const InputDecoration(labelText: 'Title', hintText: 'title'),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (String? value) {
                if (value?.trim().isEmpty ?? true) {
                  return 'Enter Your Title';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 8,
            ),
            TextFormField(
              controller: _descriptionEditingController,
              decoration: const InputDecoration(
                  labelText: 'Description', hintText: 'Description'),
              maxLength: 200,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (String? value) {
                if (value?.trim().isEmpty ?? true) {
                  return 'Enter Your Description';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Todo todo = Todo(
                      _titleEditingController.text.trim(),
                      _descriptionEditingController.text.trim(),
                      DateTime.now(),
                    );
                    widget.onAddTodo(todo);
                    Navigator.pop(context);
                  }
                },
                child: const Text('Add'))
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _titleEditingController.dispose();
    _descriptionEditingController.dispose();
    super.dispose();
  }
}

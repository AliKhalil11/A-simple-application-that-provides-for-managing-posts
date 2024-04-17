// ignore_for_file: file_names

import 'package:flutter/material.dart';

class FormSubmit extends StatelessWidget {
  const FormSubmit({super.key, required this.onPressd, required this.isUpdatePost});
  final void Function()  onPressd;
  final bool isUpdatePost;


  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
              onPressed: onPressd,
              icon: isUpdatePost
                  ? const Icon(Icons.edit)
                  : const Icon(Icons.add),
              label: Text(isUpdatePost ? "update" : "Add"));
  }
}
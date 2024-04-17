// ignore_for_file: public_member_api_docs, sort_constructors_first, file_names
import 'package:flutter/material.dart';

class FormDetailsView extends StatelessWidget {
   
 final TextEditingController controller;
  final String name;
  final bool multilines;
  const FormDetailsView({
    super.key,
    required this.controller,
    required this.name,
    required this.multilines,
  });


  @override
  Widget build(BuildContext context) {
    return  Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: TextFormField(
            controller: controller,
            validator: (value) => value!.isEmpty ? "$name can not be empty": null,
            decoration: InputDecoration(hintText: name),
            minLines: multilines?6:1,
            maxLines: multilines?6:1,
          ),
        );
  }
}

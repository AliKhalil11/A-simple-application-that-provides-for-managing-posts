// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../domain/entities/post_entities.dart';
import '../pages/Post_add_update.dart';

class UpdatePost extends StatelessWidget {
  final Post post;
  const UpdatePost({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ElevatedButton.icon(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => PostAddUpdate(
                              isUpdatePost: true,
                              post: post,
                            )));
                  },
                  icon: const Icon(Icons.edit),
                  label: const Text("Edit"));
  }
}

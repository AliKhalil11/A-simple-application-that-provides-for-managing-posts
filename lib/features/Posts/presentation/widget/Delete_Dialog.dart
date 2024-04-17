// ignore_for_file: public_member_api_docs, sort_constructors_first, use_super_parameters
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getx_project/features/Posts/presentation/bloc/add_update_delete/add_delete_update_dart_bloc.dart';

class DeleteDialog extends StatelessWidget {
  final int postId;
  const DeleteDialog({
    Key? key,
    required this.postId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title:const Text("Are You Sure ?"),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("NO")),
        TextButton(
            onPressed: () {
              BlocProvider.of<AddDeleteUpdateDartBloc>(context)
                  .add(DeletePostEvent(postId: postId));
            },
            child: const Text("YES"))
      ],
    );
  }
}

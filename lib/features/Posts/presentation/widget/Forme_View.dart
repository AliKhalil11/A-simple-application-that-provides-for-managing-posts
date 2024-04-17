// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getx_project/features/Posts/presentation/bloc/add_update_delete/add_delete_update_dart_bloc.dart';
import '../../domain/entities/post_entities.dart';
import 'Form_Details_View.dart';
import 'Form_Submit.dart';

class FormeView extends StatefulWidget {
  const FormeView({super.key, this.post, required this.isUpdatePost});
  final Post? post;
  final bool isUpdatePost;

  @override
  State<FormeView> createState() => _FormeViewState();
}

class _FormeViewState extends State<FormeView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();
  @override
  void initState() {
    if (widget.isUpdatePost) {
      _titleController.text = widget.post!.pTitle!;
      _bodyController.text = widget.post!.pBody!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FormDetailsView(
            controller: _titleController,
            name: "Title",
            multilines: false,
          ),
        const  SizedBox(height: 10,),
          FormDetailsView(
            controller: _bodyController,
            name: "Body",
            multilines: true,
          ),
          const  SizedBox(height: 10,),
         FormSubmit(onPressd: validateFormThenUpdateOrAddPost, isUpdatePost: widget.isUpdatePost,)
        ],
      ),
    );
  }

  void validateFormThenUpdateOrAddPost() {
    final isValid = _formKey.currentState!.validate();
    if (isValid) {
      final post = Post(
          pId: widget.isUpdatePost ? widget.post!.pId : null,
          pTitle: _titleController.text,
          pBody: _bodyController.text);
      if (widget.isUpdatePost) {
        BlocProvider.of<AddDeleteUpdateDartBloc>(context)
            .add(UpdatePostEvent(post: post));
      }else{
         BlocProvider.of<AddDeleteUpdateDartBloc>(context)
            .add(AddPostEvent(post: post));
      }
    }
  }
}

// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getx_project/features/Posts/presentation/bloc/add_update_delete/add_delete_update_dart_bloc.dart';
import '../../../../core/utils/SnakBar.dart';
import '../../domain/entities/post_entities.dart';
import '../widget/Forme_View.dart';
import 'Posts_Page.dart';

class PostAddUpdate extends StatelessWidget {
  const PostAddUpdate({super.key, this.post, required this.isUpdatePost});
  final Post? post;
  final bool isUpdatePost;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          isUpdatePost ? "Edit Post" : "Add Post",
          style: const TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child:
                BlocConsumer<AddDeleteUpdateDartBloc, AddDeleteUpdateDartState>(
                    builder: (context, state) {
              if (state is LodingAddDeleteUpdateDart) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return FormeView(
                  isUpdatePost: isUpdatePost, post: isUpdatePost ? post : null);
            }, 
            listener: (context, state) {
              if (state is MessageAddDeleteUpdateDart) {
               SnakBar().showSuccessSnak(context: context, message:state.message);
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => const PostsPages()),
                     (route) => false  );
              }
              else if(state is FailureAddDeleteUpdateDart){
                SnakBar().showFailreSnak(context: context, message:state.message);
              }
            }),
          ),
        ),
      ),
    );
  }
}

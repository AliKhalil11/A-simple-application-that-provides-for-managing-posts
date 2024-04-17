// ignore_for_file: public_member_api_docs, sort_constructors_first, use_super_parameters
import 'package:flutter/material.dart';
import '../../domain/entities/post_entities.dart';
import 'Delete_Post_Widget.dart';
import 'Update_post.dart';

class PostDetailsBody extends StatelessWidget {
  const PostDetailsBody({
    Key? key,
    required this.post,
  }) : super(key: key);
  final Post post;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Text(
            "${post.pTitle}",
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const Divider(
            height: 50,
          ),
          Text(
            "${post.pBody}",
            style: const TextStyle(fontSize: 16),
          ),
          const Divider(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
             UpdatePost(post: post,),
                  DeletePost(postId:post.pId!),
            ],
          )
        ],
      ),
    );
  }
  
}

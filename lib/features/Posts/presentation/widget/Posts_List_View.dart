// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:getx_project/features/Posts/presentation/pages/Post_details_page.dart';

import '../../domain/entities/post_entities.dart';

class PostsListView extends StatelessWidget {
  const PostsListView({super.key, required this.posts});
  final List<Post> posts;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.78,
      child: ListView.separated(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Text(
              posts[index].pId.toString(),
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            title: Text(
              "${posts[index].pTitle}",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              "${posts[index].pBody}",
              style: const TextStyle(fontSize: 16),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 10),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => PostDetailsPage(post: posts[index])));
            },
          );
        },
        separatorBuilder: (context, index) => const Divider(
          thickness: 1,
        ),
      ),
    );
  }
}

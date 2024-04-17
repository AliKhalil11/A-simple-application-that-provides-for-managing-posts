// ignore_for_file: public_member_api_docs, sort_constructors_first, use_super_parameters
import 'package:flutter/material.dart';

import '../../domain/entities/post_entities.dart';
import '../widget/Post_details_Body.dart';

class PostDetailsPage extends StatelessWidget {
  const PostDetailsPage({
    Key? key,
    required this.post,
  }) : super(key: key);
  final Post post;

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title:const Text("Post Details",style: TextStyle(color: Colors.white),),
      iconTheme:const IconThemeData(color: Colors.white),
    ),
    body: SingleChildScrollView(
      child: Center(child: 
      Padding(padding:const EdgeInsets.all(10),
      child:PostDetailsBody(post:post) ,
      ),
      ),
    ),
    );
  }
}

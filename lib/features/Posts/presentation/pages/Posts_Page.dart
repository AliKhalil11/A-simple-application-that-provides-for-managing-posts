// ignore_for_file: non_constant_identifier_names, file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getx_project/features/Posts/presentation/bloc/bloc/posts_bloc.dart';
import '../widget/Message_Display_View.dart';
import '../widget/Posts_List_View.dart';
import 'Post_add_update.dart';

class PostsPages extends StatelessWidget {
  const PostsPages({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title:const Text("Posts",style: TextStyle(color: Colors.white),),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:const EdgeInsets.all(10),
              child: BlocBuilder<PostsBloc, PostsState>(
                builder: (context, state) {
                  if(state is LodingPostState){
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  else if (state is LodedPostState){
                    return RefreshIndicator(
                      onRefresh:()=> _RefreshView(context),
                      child: PostsListView(posts: state.posts));
                  }
                  else if (state is FailurePostsState){
                    return MessageDisplayView(message:state.massage);
                  }
                  return const Text("No Data");
                },
              ),
            ),
            FloatingActionButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context){
                return const PostAddUpdate(isUpdatePost: false,);
              }));
            },child:const Icon(Icons.add,color: Colors.white,),)
          ],
        ),
      ),
    );
  }

  Future<void> _RefreshView(BuildContext context)async{
  BlocProvider.of<PostsBloc>(context).add(RefreshPostEvent());
  }

  
}
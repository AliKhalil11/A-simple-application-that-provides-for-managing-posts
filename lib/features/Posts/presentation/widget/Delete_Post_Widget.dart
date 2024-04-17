// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getx_project/features/Posts/presentation/pages/Posts_Page.dart';
import 'package:getx_project/features/Posts/presentation/widget/Delete_Dialog.dart';
import '../../../../core/utils/SnakBar.dart';
import '../bloc/add_update_delete/add_delete_update_dart_bloc.dart';

class DeletePost extends StatelessWidget {
final int postId;
  const DeletePost({
    Key? key,
    required this.postId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   ElevatedButton.icon(
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.redAccent)),
                  onPressed:()=>deleteDialog(context,postId),
                  icon: const Icon(Icons.delete),
                  label: const Text("Delete"));
  }
  void deleteDialog(BuildContext context,int postId){
    showDialog(context: context, builder: (context){
    return  BlocConsumer<AddDeleteUpdateDartBloc,AddDeleteUpdateDartState>(builder: (context, state) {
        if(state is LodingAddDeleteUpdateDart){
          return const AlertDialog(
            title: Center(child: CircularProgressIndicator(),),
          );
        }
        return DeleteDialog(postId:postId); 
      }, 
      listener: (BuildContext context, state) {  
        if(state is MessageAddDeleteUpdateDart){
          SnakBar().showSuccessSnak(context: context, message:state.message);
          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context){
           return const PostsPages();
          }), (route) => false);

        }else if (state is FailureAddDeleteUpdateDart){
          Navigator.of(context).pop();
          SnakBar().showFailreSnak(context: context, message:state.message);
        }
      },);
    });
  }
}

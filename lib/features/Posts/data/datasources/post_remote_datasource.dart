// ignore_for_file: equal_keys_in_map, prefer_interpolation_to_compose_strings, constant_identifier_names

import 'dart:async';
import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:getx_project/core/error/excaption.dart';
import 'package:getx_project/features/Posts/data/models/post_models.dart';
import'package:http/http.dart 'as http;

abstract class PostRemoteData{
 Future<List<PostModels>> getAllPost();
 Future<Unit> deletePost(int postId);
  Future<Unit> updatePost(PostModels postModels);
   Future<Unit> addPost(PostModels postModels);
}
   const BASE_URL ="https://jsonplaceholder.typicode.com";


class PostRemoteDataImpl extends PostRemoteData{
  final http.Client client;
  PostRemoteDataImpl({required this.client});
  @override
  Future<Unit> addPost(PostModels postModels)async {
    final body= {
    "title":postModels.title,
    "title":postModels.body,
  };
  final response =await client.post(Uri.parse(BASE_URL+"/posts"),body: body);
  if(response.statusCode==201){
    return Future.value(unit);
  }else{

    throw ServerException();
  }
  }

  @override
  Future<Unit> deletePost(int postId) async{
   final response =await client.delete(Uri.parse(BASE_URL+"/posts/${postId.toString()}"),
    headers:{
    "Content-type": "application/json"
   });
   if(response.statusCode ==200){
   return Future.value(unit);
   }else{
    throw ServerException();
   }
  }

  @override
  Future<List<PostModels>> getAllPost() async{
   final response = await client.get(Uri.parse(BASE_URL+"/posts"),
   headers:{
    "Content-type": "application/json"
   });
   if(response.statusCode == 200){
    final List decodedJso = json.decode(response.body) as List;
    final List<PostModels> postModels=decodedJso.map<PostModels>((jsonPostModel) => PostModels.fromJson(jsonPostModel)).toList();
    return postModels;
   }
   else{
    throw ServerException();
   }
  }

  @override
  Future<Unit> updatePost(PostModels postModels)async {
    final postId = postModels.id.toString();
    final body={
      "title":postModels.title,
      "title":postModels.body,
    };
    final response = await client.patch(Uri.parse(BASE_URL+"/posts/$postId"),body: body);
    if(response.statusCode ==200){
    return  Future.value(unit);
    }else{
      throw ServerException();
    }
  }
  
}
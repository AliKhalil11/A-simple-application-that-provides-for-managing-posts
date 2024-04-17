import 'dart:convert';
import 'package:dartz/dartz.dart';
import '../../../../core/error/excaption.dart';
import '../models/post_models.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class PostLocalData{
  Future<List<PostModels>> getCachedPosts();
  Future<Unit>cachPosts(List<PostModels> postModels);
}
class PostLocalDataImpl extends PostLocalData{
  final SharedPreferences sharedPreferences;
  PostLocalDataImpl({required this.sharedPreferences});
  @override
  Future<Unit> cachPosts(List<PostModels> postModels) {
   List postMoselsToJson = postModels.map<Map<String,dynamic>>((postModel) => postModel.toJson()).toList();
   sharedPreferences.setString("CASHED_POSTS", json.encode(postMoselsToJson));
   return Future.value(unit);
  }

  @override
  Future<List<PostModels>> getCachedPosts() {
   final jsonString = sharedPreferences.getString("CACHED_POSTS");
   if(jsonString != null){
    List decodeJsonData = json.decode(jsonString);
    List<PostModels> jsonToPostModels = decodeJsonData.map<PostModels>((jsonPostModels) => PostModels.fromJson(jsonPostModels)).toList();
    return Future.value(jsonToPostModels);
   }else{
    throw EmptyCacheException();
   }
  }
}
import 'package:dartz/dartz.dart';
import '../entities/post_entities.dart';

import '../../../../core/error/Failures.dart';

abstract class PostsRepositories{
  Future<Either<Failure,List<Post>>> getAllposts();
  Future<Either<Failure,Unit>> deletePosts(int id);
  Future<Either<Failure,Unit>> updatePost(Post post);
  Future<Either<Failure,Unit>> addPost(Post post);  




}
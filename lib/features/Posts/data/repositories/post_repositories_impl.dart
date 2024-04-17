import 'package:dartz/dartz.dart';
import '../../../../core/error/Failures.dart';
import '../datasources/post_local_datasource.dart';
import '../datasources/post_remote_datasource.dart';
import '../models/post_models.dart';
import '../../domain/entities/post_entities.dart';
import '../../domain/repositories/post_repositories.dart';

import '../../../../core/error/excaption.dart';
import '../../../../core/network/network_conection.dart';
typedef DeleteOrUpdateOrAddPost = Future<Unit> Function();
class PostRepositoriesImpl implements PostsRepositories{
  final PostRemoteData remoteData;
  final PostLocalData localData;
  final NetworkInfo networkInfo;
  PostRepositoriesImpl({required this.localData,required this.remoteData,required this.networkInfo});
  
   @override
  Future<Either<Failure, List<Post>>> getAllposts() async {
    if (await networkInfo.isCnnected) {
      try {
        final remotePosts = await remoteData.getAllPost();
        localData.cachPosts(remotePosts);
        return Right(remotePosts);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localPosts = await localData.getCachedPosts();
        return Right(localPosts);
      } on EmptyCacheException {
        return Left(EmptyCacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, Unit>> addPost(Post post) async {
    final PostModels postModel = PostModels(title: post.pTitle, body: post.pBody);

    return await _getMessage(() {
      return remoteData.addPost(postModel);
    });
  }

  @override
  Future<Either<Failure, Unit>> deletePosts(int postId) async {
    return await _getMessage(() {
      return remoteData.deletePost(postId);
    });
  }

  @override
  Future<Either<Failure, Unit>> updatePost(Post post) async {
    final PostModels postModel =
        PostModels(id: post.pId, title: post.pTitle, body: post.pBody);

    return await _getMessage(() {
      return remoteData.updatePost(postModel);
    });
  }

  Future<Either<Failure, Unit>> _getMessage(
      DeleteOrUpdateOrAddPost deleteOrUpdateOrAddPost) async {
    if (await networkInfo.isCnnected) {
      try {
        await deleteOrUpdateOrAddPost();
        return const Right(unit);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

}
import 'package:dartz/dartz.dart';
import '../entities/post_entities.dart';

import '../../../../core/error/Failures.dart';
import '../repositories/post_repositories.dart';

class GetAllPostsUseCase{
final PostsRepositories repository;
GetAllPostsUseCase(this.repository);
Future<Either<Failure,List<Post>>> call()async{
  return await repository.getAllposts();
}
}
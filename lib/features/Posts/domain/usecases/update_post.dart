import 'package:dartz/dartz.dart';

import '../../../../core/error/Failures.dart';
import '../entities/post_entities.dart';
import '../repositories/post_repositories.dart';

class UpdatePostUseCase{
final  PostsRepositories repository;
UpdatePostUseCase(this.repository);
 Future<Either<Failure,Unit>> call(Post post)async{
  return await repository.updatePost(post);
 }
}
import 'package:dartz/dartz.dart';

import '../../../../core/error/Failures.dart';
import '../repositories/post_repositories.dart';

class DeletePostUseCase{
 final PostsRepositories repository;
 DeletePostUseCase(this.repository);
 Future<Either<Failure,Unit>>call(int postId)async{
return await repository.deletePosts(postId);
 }
}
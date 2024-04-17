import 'package:dartz/dartz.dart';
import '../../../../core/error/Failures.dart';
import '../entities/post_entities.dart';
import '../repositories/post_repositories.dart';

class AddPostUseCase {
  final PostsRepositories repository;
  AddPostUseCase(this.repository);
  Future<Either<Failure, Unit>> call(Post post) async {
    return repository.addPost(post);
  }
}

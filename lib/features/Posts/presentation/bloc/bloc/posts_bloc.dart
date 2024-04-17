// ignore_for_file: type_literal_in_constant_pattern, depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:getx_project/core/error/Failures.dart';
import 'package:getx_project/features/Posts/domain/usecases/get_all_post.dart';


import '../../../../../core/Strings/failures.dart';
import '../../../domain/entities/post_entities.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final GetAllPostsUseCase getAllPosts;
  
  PostsBloc({required this.getAllPosts}) : super(PostsInitial()) {
    on<PostsEvent>((event, emit)async {
     if(event is GetAllPostsEvent){
     emit(LodingPostState());
     final failureORposts = await getAllPosts();
    
    emit(_mapFailureOrPostsToState(failureORposts));
     }
     else if(event is RefreshPostEvent){
        emit(LodingPostState());
        final failureORposts = await getAllPosts();
       emit(_mapFailureOrPostsToState(failureORposts));
     }
    });
  }

  PostsState _mapFailureOrPostsToState(Either<Failure, List<Post>> either){
    return either.fold(
      (failure) => FailurePostsState(massage: _mapFailureToMessage(failure)),
       (posts) => LodedPostState(posts: posts));
  }

  String _mapFailureToMessage (Failure failure){
    switch (failure.runtimeType){
      case ServerFailure:
      return SERVER_FAILURE_MESSAGE;
      case EmptyCacheFailure:
      return EMPTY_CACHE_FAILURE_MESSAGE;
      case OfflineFailure:
      return OFFLINE_FAILURE_MESSAGE;
      default:
      return "Unexpected Error , Please Try again latar";
    }
  }
}

part of 'posts_bloc.dart';
sealed class PostsState extends Equatable {
  const PostsState();
  
  @override
  List<Object> get props => [];
}
final class PostsInitial extends PostsState {}
class LodingPostState extends PostsState{}
class FailurePostsState extends PostsState{
  final String massage;
  const FailurePostsState({required this.massage});
   @override
  List<Object> get props => [massage];
}
class LodedPostState extends PostsState{
  final List<Post>posts;
  const LodedPostState({required this.posts});
  @override
  List<Object> get props => [posts];
}

part of 'add_delete_update_dart_bloc.dart';

sealed class AddDeleteUpdateDartEvent extends Equatable {
  const AddDeleteUpdateDartEvent();

  @override
  List<Object> get props => [];
  
}
class DeletePostEvent extends AddDeleteUpdateDartEvent{
final int postId;
const DeletePostEvent({required this.postId});
 @override
  List<Object> get props => [postId];
}

class UpdatePostEvent extends AddDeleteUpdateDartEvent{
   final Post post;
  const UpdatePostEvent({required this.post});
   @override
  List<Object> get props => [post];
}

class AddPostEvent extends AddDeleteUpdateDartEvent{
  final Post post;
  const AddPostEvent({required this.post});
   @override
  List<Object> get props => [post];
}
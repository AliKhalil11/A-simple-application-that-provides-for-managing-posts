import 'package:equatable/equatable.dart';

class Post extends Equatable {
  final int? pId;
  final String? pTitle;
  final String? pBody;
  const Post({required this.pBody,  this.pId, required this.pTitle});
  @override
  List<Object?> get props => [pId, pTitle, pBody];
}

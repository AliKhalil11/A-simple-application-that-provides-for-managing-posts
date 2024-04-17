// ignore_for_file: must_be_immutable

import '../../domain/entities/post_entities.dart';

class PostModels extends Post {

  int? id;
  String? title;
  String? body;

  PostModels({  this.id,required this.title,required this.body}):super(pId: id,pBody: body,pTitle: title);

  factory PostModels.fromJson(Map<String, dynamic> json) => PostModels(
        
        id: json['id'],
        title: json['title'] ,
        body: json['body'] ,
      );

  Map<String, dynamic> toJson() => {
        
        'id': id,
        'title': title,
        'body': body,
      };
}

// ignore_for_file: type_literal_in_constant_pattern, unused_element, depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:getx_project/core/Strings/message.dart';


import '../../../../../core/Strings/failures.dart';
import '../../../../../core/error/Failures.dart';
import '../../../domain/entities/post_entities.dart';
import '../../../domain/usecases/add_post.dart';
import '../../../domain/usecases/delete_post.dart';
import '../../../domain/usecases/update_post.dart';

part 'add_delete_update_dart_event.dart';
part 'add_delete_update_dart_state.dart';

class AddDeleteUpdateDartBloc extends Bloc<AddDeleteUpdateDartEvent, AddDeleteUpdateDartState> {
  final AddPostUseCase addPostUseCase;
  final DeletePostUseCase deletePostUseCase;
 final UpdatePostUseCase updatePostUseCase;
  AddDeleteUpdateDartBloc({required this.addPostUseCase,
   required this.deletePostUseCase, 
   required this.updatePostUseCase})
    : super(AddDeleteUpdateDartInitial()) {
    on<AddDeleteUpdateDartEvent>((event, emit)async {
     if(event is AddPostEvent){
      emit (LodingAddDeleteUpdateDart());
      final failureOrDonemessage = await addPostUseCase(event.post);
      emit(_etherDonEMessageOrErrorState(failureOrDonemessage, ADD_SUCCESS_MESSAGE));
     }
     else if(event is UpdatePostEvent){
       emit (LodingAddDeleteUpdateDart());
      final failureOrDonemessage = await updatePostUseCase(event.post);
     emit(_etherDonEMessageOrErrorState(failureOrDonemessage, UPDATE_SUCCESS_MESSAGE));
     }
     else if(event is DeletePostEvent){
       emit (LodingAddDeleteUpdateDart());
      final failureOrDonemessage = await deletePostUseCase(event.postId);
      emit (_etherDonEMessageOrErrorState(failureOrDonemessage, DELETE_SUCCESS_MESSAGE));
     }
    });
  }

   String _mapFailureToMessage (Failure failure){
    switch (failure.runtimeType){
      case ServerFailure:
      return SERVER_FAILURE_MESSAGE;
      
      case OfflineFailure:
      return OFFLINE_FAILURE_MESSAGE;
      default:
      return "Unexpected Error , Please Try again latar";
    }
  }

  AddDeleteUpdateDartState _etherDonEMessageOrErrorState (Either<Failure, Unit> either,String message){
    return either.fold(
      (failure) => FailureAddDeleteUpdateDart(message: _mapFailureToMessage(failure)),
       (_) => MessageAddDeleteUpdateDart(message: message));
  } 
}

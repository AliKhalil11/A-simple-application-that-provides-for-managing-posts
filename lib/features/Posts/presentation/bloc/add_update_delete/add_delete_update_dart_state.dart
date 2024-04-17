// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'add_delete_update_dart_bloc.dart';

sealed class AddDeleteUpdateDartState extends Equatable {
  const AddDeleteUpdateDartState();
  
  @override
  List<Object> get props => [];
}

final class AddDeleteUpdateDartInitial extends AddDeleteUpdateDartState {}
class LodingAddDeleteUpdateDart extends AddDeleteUpdateDartState{}
class MessageAddDeleteUpdateDart extends AddDeleteUpdateDartState {
  final String message;
  const MessageAddDeleteUpdateDart({
    required this.message,
  });
   @override
  List<Object> get props => [message];
  
}
class FailureAddDeleteUpdateDart extends AddDeleteUpdateDartState {
  final String message;
  const FailureAddDeleteUpdateDart({
    required this.message,
  });
   @override
  List<Object> get props => [message];
  
}


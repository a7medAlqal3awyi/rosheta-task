import 'package:task/feature/delete_rosheta/data/model/delete_rosheta_model.dart';

abstract class DeleteRoshtaState {}

class DeleteRoshtaInitial extends DeleteRoshtaState {}

class DeleteRoshtaLoading extends DeleteRoshtaState {}

class DeleteRoshtaSuccess extends DeleteRoshtaState {
  final DeleteRoshtaResponse response;

  DeleteRoshtaSuccess(this.response);
}

class DeleteRoshtaError extends DeleteRoshtaState {
  final String error;

  DeleteRoshtaError(this.error);
}

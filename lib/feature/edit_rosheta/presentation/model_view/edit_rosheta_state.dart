import 'package:task/feature/edit_rosheta/data/model/edit_rosheta_model.dart';
import 'package:task/feature/upload_rosheta/data/model/update_rosheta_model.dart';

abstract class EditRoshtaState {}

class EditRoshtaInitial extends EditRoshtaState {}

class EditRoshtaLoading extends EditRoshtaState {}

class EditRoshtaSuccess extends EditRoshtaState {
  final EditRoshetaModel response;

  EditRoshtaSuccess(this.response);
}

class EditRoshtaError extends EditRoshtaState {
  final String error;

  EditRoshtaError(this.error);
}

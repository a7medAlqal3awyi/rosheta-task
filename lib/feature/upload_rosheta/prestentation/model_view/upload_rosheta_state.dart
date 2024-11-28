import 'package:task/feature/upload_rosheta/data/model/update_rosheta_model.dart';

abstract class UploadRoshtaState {}

class UploadRoshtaInitial extends UploadRoshtaState {}

class UploadRoshtaLoading extends UploadRoshtaState {}

class UploadRoshtaSuccess extends UploadRoshtaState {
  final UploadRoshetaModel response;

  UploadRoshtaSuccess(this.response);
}

class UploadRoshtaError extends UploadRoshtaState {
  final String error;

  UploadRoshtaError(this.error);
}

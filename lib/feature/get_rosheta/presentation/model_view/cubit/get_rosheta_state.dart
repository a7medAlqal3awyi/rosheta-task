part of 'get_rosheta_cubit.dart';

@immutable
sealed class GetRoshetaState {}

final class GetRoshetaInitial extends GetRoshetaState {}
final class GetRoshetaLoading extends GetRoshetaState {}
final class GetRoshetaSuccess extends GetRoshetaState {
  final Roshta getModel;

  GetRoshetaSuccess(this.getModel);
}
final class GetRoshetaError extends GetRoshetaState {
  final String error;

   GetRoshetaError( this.error);
}

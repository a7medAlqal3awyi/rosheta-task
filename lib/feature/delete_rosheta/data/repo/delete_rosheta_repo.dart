import 'package:dartz/dartz.dart';
import 'package:task/feature/delete_rosheta/data/model/delete_rosheta_model.dart';

abstract class DeleteRoshetaRepo {
  Future<Either<String, DeleteRoshtaResponse>> deleteRoshtaRepo();
}

import 'package:dartz/dartz.dart';
import 'package:task/feature/edit_rosheta/data/model/edit_rosheta_model.dart';

abstract class EditRepo{

  Future<Either<String,EditRoshetaModel>> editRoshetaRepo(
  {
    required String terms,
    required String special,
    required String imagePath,
}
      );
}
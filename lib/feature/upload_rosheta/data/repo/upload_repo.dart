import 'package:dartz/dartz.dart';
import 'package:task/feature/upload_rosheta/data/model/update_rosheta_model.dart';

import 'package:dartz/dartz.dart';

abstract class UploadRoshtaRepo {
  Future<Either<String, UploadRoshetaModel>> uploadRoshta({
    required String id,
    required String title,
    required String terms,
    required String imagePath,
  });
}

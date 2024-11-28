import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:task/core/api/api_consumer.dart';
import 'package:task/core/api/end_point.dart';
import 'package:task/feature/edit_rosheta/data/model/edit_rosheta_model.dart';
import 'package:task/feature/edit_rosheta/data/repo/edit_repo.dart';

class EditRoshetaRepoImpl extends EditRepo {
  ApiConsumer api;

  EditRoshetaRepoImpl(this.api);

  @override
  Future<Either<String, EditRoshetaModel>> editRoshetaRepo({
    required String terms,
    required String special,
    required String imagePath,
  }) async {
    try {
      final formData = FormData.fromMap({
        'terms': terms,
        'special': special,
        'image': await MultipartFile.fromFile(imagePath, filename: 'report.jpg'),
      });
      final response = await api.put(ApiEndPoint.editRosheta,
      data: formData);
      if ((response.statusCode == 200 ) && response.data is Map<String, dynamic>)
      {
        final responseData = EditRoshetaModel.fromJson(response.data);
        return Right(responseData);
      }
      else {
        return Left('Failed to edit Rosheta');
      }
    } on Exception catch (e) {
      return Left(e.toString());
    }
  }
}

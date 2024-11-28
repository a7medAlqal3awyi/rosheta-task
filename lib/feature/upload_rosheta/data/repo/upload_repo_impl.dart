import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:task/core/api/api_consumer.dart';
import 'package:task/core/api/end_point.dart';
import 'package:task/feature/upload_rosheta/data/model/update_rosheta_model.dart';
import 'package:task/feature/upload_rosheta/data/repo/upload_repo.dart';

class UploadRepoImpl extends UploadRoshtaRepo {
  ApiConsumer api;

  UploadRepoImpl(this.api);

  @override
  Future<Either<String, UploadRoshetaModel>> uploadRoshta({
    required String id,
    required String title,
    required String terms,
    required String imagePath,
  }) async {
    try {
      final formData = FormData.fromMap({
        'id': id,
        'title': title,
        'terms': terms,
        'image': await MultipartFile.fromFile(imagePath, filename: 'report.jpg'),
      });
      final response = await api.post(
          ApiEndPoint.uploadRosheta,
          data: formData
      );
      if ((response.statusCode == 200 || response.statusCode == 201) && response.data is Map<String, dynamic>) {
        final responseData = UploadRoshetaModel.fromJson(response.data);
    return Right(responseData);
      }  else {
        return Left('Failed to upload Rosheta');
      }
    } on Exception catch (e) {
      return Left(e.toString());
    }
  }
}

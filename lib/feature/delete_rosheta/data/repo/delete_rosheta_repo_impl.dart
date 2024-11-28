import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:task/core/api/api_consumer.dart';
import 'package:task/core/api/end_point.dart';
import 'package:task/feature/delete_rosheta/data/model/delete_rosheta_model.dart';
import 'package:task/feature/delete_rosheta/data/repo/delete_rosheta_repo.dart';

class DeleteRepoIml extends DeleteRoshetaRepo {
  ApiConsumer api;

  DeleteRepoIml(this.api);

  @override
  Future<Either<String, DeleteRoshtaResponse>> deleteRoshtaRepo(
      ) async {
    try {

      final response =
          await api.delete(ApiEndPoint.deleteRosheta,  );

      if (response.statusCode == 200) {
        final responseData = DeleteRoshtaResponse.fromJson(response.data);
        return Right(responseData);
      } else {
        return Left('Failed to edit Rosheta');
      }
    } on Exception catch (e) {
      return Left(e.toString());
    }
  }
}

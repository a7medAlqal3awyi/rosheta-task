import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:task/core/api/api_consumer.dart';
import 'package:task/core/api/end_point.dart';

import '../model/get_model.dart';
import 'get_repo.dart';

class GetRepoImlp extends GetRepo {
   ApiConsumer api;

  GetRepoImlp(this.api);

  @override
  Future<Either<String, Roshta>> getRosheta() async {
    try {
      final response = await api.get(ApiEndPoint.getRosheta);
      print("API Response: ${response.statusCode}");
      if (response.statusCode==200) {
        final responseModel = GetResponseModel.fromJson(response.data);
        log("999999999Parsed Response: ${responseModel.message}999999999999999999999999");
        return right(responseModel.roshta);
      }


      else {
        print("Unexpected response format");
        return left("Unexpected response format");
      }
    } on Exception catch (e) {
      print("Error occurred: $e");
      return left(e.toString());
    }
  }

}

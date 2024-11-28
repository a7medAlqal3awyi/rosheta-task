import 'package:dartz/dartz.dart';

import '../model/get_model.dart';


abstract class GetRepo {
  Future<Either<String,Roshta>>getRosheta();
}

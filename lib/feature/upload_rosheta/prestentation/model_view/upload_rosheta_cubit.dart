import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/feature/upload_rosheta/data/repo/upload_repo.dart';
import 'package:task/feature/upload_rosheta/prestentation/model_view/upload_rosheta_state.dart';

class UploadRoshetaCubit extends Cubit<UploadRoshtaState> {
  UploadRoshetaCubit(this.repo) : super(UploadRoshtaInitial());

  UploadRoshtaRepo repo;

  Future<void> uploadRoshta({
    required String id,
    required String title,
    required String terms,
    required String imagePath,
  }) async {
    emit(UploadRoshtaLoading());

    final result = await repo.uploadRoshta(
      id: id,
      title: title,
      terms: terms,
      imagePath: imagePath,
    );

    result.fold(
      (failure) => emit(UploadRoshtaError(failure)),
      (response) => emit(UploadRoshtaSuccess(response)),
    );
  }
}

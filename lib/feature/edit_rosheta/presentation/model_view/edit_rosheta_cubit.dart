import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/feature/edit_rosheta/data/repo/edit_repo.dart';
import 'package:task/feature/edit_rosheta/presentation/model_view/edit_rosheta_state.dart';

class EditRoshetaCubit extends Cubit<EditRoshtaState> {
  EditRoshetaCubit(this.repo) : super(EditRoshtaInitial());

  EditRepo repo;

  Future<void> editRosheta({
    required String terms,
    required String special,
    required String imagePath,
  }) async {
    emit(EditRoshtaLoading());
    final result = await repo.editRoshetaRepo(
      terms: terms,
      special: special,
      imagePath: imagePath,
    );

    result.fold(
      (fail) => emit(EditRoshtaError(fail)),
      (success) => emit(EditRoshtaSuccess(success)),
    );
  }
}

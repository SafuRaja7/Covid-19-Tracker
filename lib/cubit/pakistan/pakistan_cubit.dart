import 'package:bloc/bloc.dart';
import 'package:covid_tracker/models/pakistan.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

part 'pakistan_state.dart';
part 'data_provider.dart';
part 'repository.dart';

class PakistanCubit extends Cubit<PakistanState> {
  PakistanCubit() : super(const PakistanLoading());

  final repo = PakistanRepo();

  Future<void> fetchData() async {
    emit(const PakistanLoading());

    try {
      Pakistan? data = await repo.fetchData();

      emit(
        PakistanSuccess(data),
      );
    } catch (e) {
      emit(
        PakistanFailure(
          e.toString(),
        ),
      );
    }
  }
}

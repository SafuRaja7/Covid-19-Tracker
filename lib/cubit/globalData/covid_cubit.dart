import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import 'package:covid_tracker/models/covid.dart';

part 'covid_state.dart';
part 'data_provider.dart';
part 'repository.dart';

class CovidCubit extends Cubit<CovidState> {
  CovidCubit() : super(const CovidLoading());

  final repository = CovidRepo();

  Future<void> fetchData() async {
    emit(const CovidLoading());
    try {
      final data = await repository.fetchData();
      emit(
        CovidSuccess(data),
      );
    } catch (e) {
      emit(
        CovidFailure(
          e.toString(),
        ),
      );
    }
  }
}

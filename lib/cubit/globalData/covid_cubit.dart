import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import 'package:covid_tracker/models/global.dart';
import 'package:hive/hive.dart';

part 'covid_state.dart';
part 'data_provider.dart';
part 'repository.dart';

class CovidCubit extends Cubit<CovidState> {
  CovidCubit() : super(const CovidLoading());

  final repository = CovidRepo();

  Future<void> fetchData() async {
    emit(const CovidLoading());
    try {
      Duration? difference;
      final currentTime = DateTime.now();
      Covid? data;

      data = await repository.fetchHive();
      DateTime? dataTime = Hive.box('app').get('covidData');
      if (dataTime != null) {
        difference = currentTime.difference(dataTime);
      }
      if (data == null || (difference != null && difference.inHours > 1)) {
        data = await repository.fetchData();
      }
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

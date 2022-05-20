import 'package:bloc/bloc.dart';
import 'package:covid_tracker/models/countries.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

part 'countries_state.dart';
part 'data_provider.dart';
part 'repository.dart';

class CountriesdataCubit extends Cubit<CountriesdataState> {
  CountriesdataCubit() : super(const CountriesdataLoading());

  final repo = CountryRepo();

  Future<void> fetchCountry() async {
    emit(
      const CountriesdataLoading(),
    );
    try {
      final data = await repo.fetchCountry();

      emit(
        CountriesdataSuccess(data),
      );
    } catch (e) {
      emit(
        CountriesdataFailure(
          e.toString(),
        ),
      );
    }
  }
}

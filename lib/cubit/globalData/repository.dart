part of 'covid_cubit.dart';

class CovidRepo {
  Future<List<Covid>> fetchData() => CovidDataProvider.fetchData();
}

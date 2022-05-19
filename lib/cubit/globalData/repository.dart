part of 'covid_cubit.dart';

class CovidRepo {
  Future<Covid> fetchData() => CovidDataProvider.fetchData();
}

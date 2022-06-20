part of 'covid_cubit.dart';

class CovidRepo {
  Future<Covid> fetchData() => GlobalDataProvider.fetchData();
  Future<Covid?> fetchHive() => GlobalDataProvider.fetchHive();
}

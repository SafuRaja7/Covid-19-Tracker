part of 'covid_cubit.dart';

class GlobalDataProvider {
  static final dio = Dio();
  static final cache = Hive.box('globalBox');
  static final appcache = Hive.box('app');

  static Future<Covid> fetchData() async {
    try {
      final response =
          await dio.get('https://coronavirus-19-api.herokuapp.com/all');
      Map<String, dynamic> raw = response.data;
      Covid covidData = Covid.fromMap(raw);

      return covidData;
    } catch (e) {
      throw Exception("Internal Server Error");
    }
  }
}

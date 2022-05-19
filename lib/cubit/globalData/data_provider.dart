part of 'covid_cubit.dart';

class GlobalDataProvider {
  static final dio = Dio();

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

part of 'covid_cubit.dart';

class CovidDataProvider {
  static final dio = Dio();

  static Future<List<Covid>> fetchData() async {
    try {
      final response =
          await dio.get('https://coronavirus-19-api.herokuapp.com/all');
      Map raw = response.data;
      List<Covid> covidData = List.generate(
        raw.length,
        (index) => Covid.fromMap(
          raw[index],
        ),
      );
      return covidData;
    } catch (e) {
      throw Exception("Internal Server Error");
    }
  }
}

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
      await cache.put('covidData', covidData);
      await appcache.put('covidData', covidData);
      return covidData;
    } catch (e) {
      throw Exception("Internal Server Error");
    }
  }

  static Future<Covid?> fetchHive() async {
    try {
      Map<String, dynamic> cachedCovid = cache.get('covidData');
      if (cachedCovid == null) {
        return null;
      }
      Covid? covid = Covid.fromMap(cachedCovid);

      return covid;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}

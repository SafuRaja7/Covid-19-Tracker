part of 'covid_cubit.dart';

class GlobalDataProvider {
  static final dio = Dio();
  static final cache = Hive.box('globalBox');
  static final appcache = Hive.box('app');

  static Future<Covid> fetchData() async {
    try {
      final response =
          await dio.get('https://corona.lmao.ninja/v2/all');

      Map<String, dynamic> raw = response.data;
      Covid covidData = Covid.fromMap(raw);

      await cache.put('covidData', covidData);
      await appcache.put('covidData', covidData);

      return covidData;
    } on DioError catch (e) {
      if (DioErrorType.other == e.type) {
        if (e.message.contains('SocketException')) {
          throw Exception('Poor internet connection. Please try again!');
        } else {
          throw Exception(e.message);
        }
      } else {
        throw Exception('Problem connecting to the server. Please try again.');
      }
    } catch (e) {
      throw Exception("Internal Server Error");
    }
  }
}

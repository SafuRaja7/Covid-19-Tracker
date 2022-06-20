part of 'countries_cubit.dart';

class CountryDataProvider {
  static final dio = Dio();

  static Future<List<Country>> fetchCountry() async {
    try {
      final response =
          await dio.get('https://coronavirus-19-api.herokuapp.com/countries');
      List raw = response.data;
      List<Country> countries = List.generate(
        raw.length,
        (index) => Country.fromMap(
          raw[index],
        ),
      );
      return countries;
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

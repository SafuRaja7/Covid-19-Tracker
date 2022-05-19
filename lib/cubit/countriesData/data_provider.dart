part of 'countries_cubit.dart';

class CountryDataProvider {
  static final dio = Dio();

  Future<List<Country>> fetchCountry() async {
    try {
      final response =
          await dio.get('https://coronavirus-19-api.herokuapp.com/countries');
      List<Country> raw = response.data; // to be removed
      return raw; //to be removed
    } catch (e) {
      throw Exception("Internal Server Error");
    }
  }
}

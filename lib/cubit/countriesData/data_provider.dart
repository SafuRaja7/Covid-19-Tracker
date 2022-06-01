part of 'countries_cubit.dart';

class CountryDataProvider {
  static final dio = Dio();

  static Future<List<Country>> fetchCountry({required String? query}) async {
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
      // if (query != null) {
      //   countries = countries
      //       .where((element) =>
      //           element.country!.toLowerCase().contains(query.toLowerCase()))
      //       .toList();
      // }
      return countries;
    } catch (e) {
      throw Exception("Internal Server Error");
    }
  }
}

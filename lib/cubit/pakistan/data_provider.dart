part of 'pakistan_cubit.dart';

class PakistanDataProvider {
  static final dio = Dio();

  static Future<Pakistan>? fetchData() async {
    try {
      final response = await dio.get(
          'https://api.apify.com/v2/key-value-stores/QhfG8Kj6tVYMgud6R/records/LATEST?disableRedirect=true');

      Map<String, dynamic> raw = response.data;

      Pakistan data = Pakistan.fromMap(raw);
      return data;
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

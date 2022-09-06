import 'package:http/http.dart' as http;

class Network {
  Future<http.Response> get(String url) async => await http.get(
        Uri.parse(url),
      );
}

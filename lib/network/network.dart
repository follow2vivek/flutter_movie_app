import 'package:http/http.dart' as http;
import 'package:riverpod/riverpod.dart';

final networkProvider = Provider((_) => Network());

class Network {
  Future<http.Response> get(String url) async => await http.get(
        Uri.parse(url),
      );
}

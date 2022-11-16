import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';

final httpConnector = Provider<HttpConnector>((ref) {
  return HttpConnector();
});

class HttpConnector {
  final host = "http://localhost:5000";
  final Client _client = Client();

  Future<Response> get() async {
    Uri uri = Uri.parse("${host}/api/product");
    Response response = await _client.get(uri);
    return response;
  }
}

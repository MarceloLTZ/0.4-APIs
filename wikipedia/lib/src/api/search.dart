import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../model/search_results.dart';

Future<SearchResults> search(String searchTerm) async {
  final client = http.Client();
  try {
    final uri = Uri.https(
      'en.wikipedia.org',
      '/w/api.php',
      <String, Object?>{
        'action': 'opensearch',
        'format': 'json',
        'search': searchTerm,
      },
    );
    final response = await client.get(uri);

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body) as List<Object?>;
      return SearchResults.fromJson(jsonData);
    } else {
      throw HttpException(
        'Erro na busca por "$searchTerm" (Status: ${response.statusCode})',
      );
    }
  } finally {
    client.close();
  }
}

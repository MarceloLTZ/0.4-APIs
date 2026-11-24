import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../model/summary.dart';

Future<Summary> getArticleSummaryByTitle(String articleTitle) async {
  final client = http.Client();
  try {
    final uri = Uri.https(
      'en.wikipedia.org',
      '/api/rest_v1/page/summary/${Uri.encodeComponent(articleTitle)}',
    );
    final response = await client.get(uri);

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body) as Map<String, Object?>;
      return Summary.fromJson(jsonData);
    } else {
      throw HttpException(
        'Erro ao buscar artigo "$articleTitle" (Status: ${response.statusCode})',
      );
    }
  } finally {
    client.close();
  }
}

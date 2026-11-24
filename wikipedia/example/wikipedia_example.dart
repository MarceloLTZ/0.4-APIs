import 'package:wikipedia/wikipedia.dart';

Future<void> main() async {
  print('--- Buscando "Dart programming language" ---');
  final results = await search('Dart programming language');
  for (final item in results.results) {
    print('• ${item.title}: ${item.url}');
  }

  print('\n--- Buscando Resumo do artigo "Dart" ---');
  final summary = await getArticleSummaryByTitle('Dart');
  print('Título: ${summary.titles.display}');
  print('Resumo: ${summary.extract}');
}

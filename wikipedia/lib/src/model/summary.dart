import 'title_set.dart';

class Summary {
  Summary({
    required this.titles,
    required this.pageid,
    required this.extract,
    required this.extractHtml,
    required this.lang,
    required this.dir,
    this.description,
  });

  final TitleSet titles;
  final int pageid;
  final String extract;
  final String extractHtml;
  final String lang;
  final String dir;
  final String? description;

  factory Summary.fromJson(Map<String, Object?> json) {
    if (json case {
      'titles': final Map<String, Object?> titlesJson,
      'pageid': final int pageid,
      'extract': final String extract,
      'extract_html': final String extractHtml,
      'lang': final String lang,
      'dir': final String dir,
    }) {
      return Summary(
        titles: TitleSet.fromJson(titlesJson),
        pageid: pageid,
        extract: extract,
        extractHtml: extractHtml,
        lang: lang,
        dir: dir,
        description: json['description'] as String?,
      );
    }
    throw FormatException('JSON inválido para Summary: $json');
  }
}

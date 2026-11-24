class SearchResult {
  SearchResult({
    required this.title,
    required this.url,
    this.description,
  });

  final String title;
  final String url;
  final String? description;
}

class SearchResults {
  SearchResults(this.results, {this.searchTerm});

  final List<SearchResult> results;
  final String? searchTerm;

  factory SearchResults.fromJson(List<Object?> json) {
    final searchTerm = json[0] as String?;
    final titles = (json[1] as List<Object?>).cast<String>();
    final descriptions = (json[2] as List<Object?>).cast<String>();
    final urls = (json[3] as List<Object?>).cast<String>();

    final results = <SearchResult>[];
    for (int i = 0; i < titles.length; i++) {
      results.add(
        SearchResult(
          title: titles[i],
          description: descriptions[i].isNotEmpty ? descriptions[i] : null,
          url: urls[i],
        ),
      );
    }

    return SearchResults(results, searchTerm: searchTerm);
  }
}

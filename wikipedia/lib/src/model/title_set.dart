class TitleSet {
  TitleSet({
    required this.canonical,
    required this.normalized,
    required this.display,
  });

  final String canonical;
  final String normalized;
  final String display;

  factory TitleSet.fromJson(Map<String, Object?> json) {
    if (json case {
      'canonical': final String canonical,
      'normalized': final String normalized,
      'display': final String display,
    }) {
      return TitleSet(
        canonical: canonical,
        normalized: normalized,
        display: display,
      );
    }
    throw FormatException('JSON inválido para TitleSet: $json');
  }
}

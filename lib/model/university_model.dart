
class University {
  List<String> domains;
  String country;
  String? stateProvince;
  List<String> webPages;
  String name;

  University({
    required this.domains,
    required this.country,
    required this.stateProvince,
    required this.webPages,
    required this.name,
  });

  factory University.fromJson(Map<String, dynamic> json) {
    return University(
      name: json['name'] ?? 'Sin nombre',
      country: json['country'] ?? 'Desconocido',
      domains:
          json['domains'] == null ? [] : List<String>.from(json['domains']),
      stateProvince: json['state-province'],
      webPages:
          json['web_pages'] == null ? [] : List<String>.from(json['web_pages']),
    );
  }
}

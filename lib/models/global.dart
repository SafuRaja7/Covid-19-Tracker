import 'dart:convert';

class Covid {
  final int? cases;
  final int? deaths;
  final int? recovered;
  Covid({
    required this.cases,
    required this.deaths,
    required this.recovered,
  });

  Covid copyWith({
    int? cases,
    int? deaths,
    int? recovered,
  }) {
    return Covid(
      cases: cases ?? this.cases,
      deaths: deaths ?? this.deaths,
      recovered: recovered ?? this.recovered,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'cases': cases,
      'deaths': deaths,
      'recovered': recovered,
    };
  }

  factory Covid.fromMap(Map<String, dynamic> map) {
    return Covid(
      cases: map['cases'] != null ? map['cases'] as int : null,
      deaths: map['deaths'] != null ? map['deaths'] as int : null,
      recovered: map['recovered'] != null ? map['recovered'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Covid.fromJson(String source) =>
      Covid.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'Covid(cases: $cases, deaths: $deaths, recovered: $recovered)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Covid &&
        other.cases == cases &&
        other.deaths == deaths &&
        other.recovered == recovered;
  }

  @override
  int get hashCode => cases.hashCode ^ deaths.hashCode ^ recovered.hashCode;
}

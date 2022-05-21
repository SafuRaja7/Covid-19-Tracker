// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Country {
  final String? country;
  final int? cases;
  final int? todayCases;
  final int? deaths;
  final int? todayDeaths;
  final int? active;
  final int? critical;
  Country({
    this.country,
    this.cases,
    this.todayCases,
    required this.deaths,
    required this.todayDeaths,
    required this.active,
    required this.critical,
  });

  Country copyWith({
    String? country,
    int? cases,
    int? todayCases,
    int? deaths,
    int? todayDeaths,
    int? active,
    int? critical,
  }) {
    return Country(
      country: country ?? this.country,
      cases: cases ?? this.cases,
      todayCases: todayCases ?? this.todayCases,
      deaths: deaths ?? this.deaths,
      todayDeaths: todayDeaths ?? this.todayDeaths,
      active: active ?? this.active,
      critical: critical ?? this.critical,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'country': country,
      'cases': cases,
      'todayCases': todayCases,
      'deaths': deaths,
      'todayDeaths': todayDeaths,
      'active': active,
      'critical': critical,
    };
  }

  factory Country.fromMap(Map<String, dynamic> map) {
    return Country(
      country: map['country'] != null ? map['country'] as String : null,
      cases: map['cases'] != null ? map['cases'] as int : null,
      todayCases: map['todayCases'] != null ? map['todayCases'] as int : null,
      deaths: map['deaths'] != null ? map['deaths'] as int : null,
      todayDeaths:
          map['todayDeaths'] != null ? map['todayDeaths'] as int : null,
      active: map['active'] != null ? map['active'] as int : null,
      critical: map['critical'] != null ? map['critical'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Country.fromJson(String source) =>
      Country.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Country(country: $country, cases: $cases, todayCases: $todayCases, deaths: $deaths, todayDeaths: $todayDeaths, active: $active, critical: $critical)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Country &&
        other.country == country &&
        other.cases == cases &&
        other.todayCases == todayCases &&
        other.deaths == deaths &&
        other.todayDeaths == todayDeaths &&
        other.active == active &&
        other.critical == critical;
  }

  @override
  int get hashCode {
    return country.hashCode ^
        cases.hashCode ^
        todayCases.hashCode ^
        deaths.hashCode ^
        todayDeaths.hashCode ^
        active.hashCode ^
        critical.hashCode;
  }
}

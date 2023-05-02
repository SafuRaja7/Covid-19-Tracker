// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Country {
  final String? country;
  final int? cases;
  final int? deaths;
  final int? active;
  final int? recovered;
  Country({
    this.country,
    this.cases,
    this.deaths,
    this.active,
    this.recovered,
  });

  Country copyWith({
    String? country,
    int? cases,
    int? deaths,
    int? active,
    int? recovered,
  }) {
    return Country(
      country: country ?? this.country,
      cases: cases ?? this.cases,
      deaths: deaths ?? this.deaths,
      active: active ?? this.active,
      recovered: recovered ?? this.recovered,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'country': country,
      'cases': cases,
      'deaths': deaths,
      'active': active,
      'recovered': recovered,
    };
  }

  factory Country.fromMap(Map<String, dynamic> map) {
    return Country(
      country: map['country'] != null ? map['country'] as String : null,
      cases: map['cases'] != null ? map['cases'] as int : null,
      deaths: map['deaths'] != null ? map['deaths'] as int : null,
      active: map['active'] != null ? map['active'] as int : null,
      recovered: map['recovered'] != null ? map['recovered'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Country.fromJson(String source) =>
      Country.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Country(country: $country, cases: $cases, deaths: $deaths, active: $active, recovered: $recovered)';
  }

  @override
  bool operator ==(covariant Country other) {
    if (identical(this, other)) return true;

    return other.country == country &&
        other.cases == cases &&
        other.deaths == deaths &&
        other.active == active &&
        other.recovered == recovered;
  }

  @override
  int get hashCode {
    return country.hashCode ^
        cases.hashCode ^
        deaths.hashCode ^
        active.hashCode ^
        recovered.hashCode;
  }
}

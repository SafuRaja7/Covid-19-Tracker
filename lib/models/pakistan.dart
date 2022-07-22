// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Pakistan {
  final String? country;
  final int? cases;
  final int? todayCases;
  final int? deaths;
  final int? todayDeaths;
  final int? recovered;

  Pakistan({
    this.country,
    this.cases,
    this.todayCases,
    this.deaths,
    this.todayDeaths,
    this.recovered,
  });

  Pakistan copyWith({
    String? country,
    int? cases,
    int? todayCases,
    int? deaths,
    int? todayDeaths,
    int? recovered,
  }) {
    return Pakistan(
      country: country ?? this.country,
      cases: cases ?? this.cases,
      todayCases: todayCases ?? this.todayCases,
      deaths: deaths ?? this.deaths,
      todayDeaths: todayDeaths ?? this.todayDeaths,
      recovered: recovered ?? this.recovered,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'country': country,
      'cases': cases,
      'todayCases': todayCases,
      'deaths': deaths,
      'todayDeaths': todayDeaths,
      'recovered': recovered,
    };
  }

  factory Pakistan.fromMap(Map<String, dynamic> map) {
    return Pakistan(
      country: map['country'] != null ? map['country'] as String : null,
      cases: map['cases'] != null ? map['cases'] as int : null,
      todayCases: map['todayCases'] != null ? map['todayCases'] as int : null,
      deaths: map['deaths'] != null ? map['deaths'] as int : null,
      todayDeaths:
          map['todayDeaths'] != null ? map['todayDeaths'] as int : null,
      recovered: map['recovered'] != null ? map['recovered'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Pakistan.fromJson(String source) =>
      Pakistan.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Pakistan(country: $country, cases: $cases, todayCases: $todayCases, deaths: $deaths, todayDeaths: $todayDeaths, recovered: $recovered)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Pakistan &&
        other.country == country &&
        other.cases == cases &&
        other.todayCases == todayCases &&
        other.deaths == deaths &&
        other.todayDeaths == todayDeaths &&
        other.recovered == recovered;
  }

  @override
  int get hashCode {
    return country.hashCode ^
        cases.hashCode ^
        todayCases.hashCode ^
        deaths.hashCode ^
        todayDeaths.hashCode ^
        recovered.hashCode;
  }
}

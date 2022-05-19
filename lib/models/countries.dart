// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Country {
  final String? country;
  final int? cases;
  Country({
    this.country,
    this.cases,
  });

  Country copyWith({
    String? country,
    int? cases,
  }) {
    return Country(
      country: country ?? this.country,
      cases: cases ?? this.cases,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'country': country,
      'cases': cases,
    };
  }

  factory Country.fromMap(Map<String, dynamic> map) {
    return Country(
      country: map['country'] != null ? map['country'] as String : null,
      cases: map['cases'] != null ? map['cases'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Country.fromJson(String source) =>
      Country.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Country(country: $country, cases: $cases)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Country && other.country == country && other.cases == cases;
  }

  @override
  int get hashCode => country.hashCode ^ cases.hashCode;
}

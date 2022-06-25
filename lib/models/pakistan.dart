// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Pakistan {
  final int? infected;
  final int? tested;
  final int? recovered;
  final int? deceased;
  final int? critical;
  Pakistan({
    this.infected,
    this.tested,
    this.recovered,
    this.deceased,
    this.critical,
  });


  Pakistan copyWith({
    int? infected,
    int? tested,
    int? recovered,
    int? deceased,
    int? critical,
  }) {
    return Pakistan(
      infected: infected ?? this.infected,
      tested: tested ?? this.tested,
      recovered: recovered ?? this.recovered,
      deceased: deceased ?? this.deceased,
      critical: critical ?? this.critical,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'infected': infected,
      'tested': tested,
      'recovered': recovered,
      'deceased': deceased,
      'critical': critical,
    };
  }

  factory Pakistan.fromMap(Map<String, dynamic> map) {
    return Pakistan(
      infected: map['infected'] != null ? map['infected'] as int : null,
      tested: map['tested'] != null ? map['tested'] as int : null,
      recovered: map['recovered'] != null ? map['recovered'] as int : null,
      deceased: map['deceased'] != null ? map['deceased'] as int : null,
      critical: map['critical'] != null ? map['critical'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Pakistan.fromJson(String source) => Pakistan.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Pakistan(infected: $infected, tested: $tested, recovered: $recovered, deceased: $deceased, critical: $critical)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Pakistan &&
      other.infected == infected &&
      other.tested == tested &&
      other.recovered == recovered &&
      other.deceased == deceased &&
      other.critical == critical;
  }

  @override
  int get hashCode {
    return infected.hashCode ^
      tested.hashCode ^
      recovered.hashCode ^
      deceased.hashCode ^
      critical.hashCode;
  }
}

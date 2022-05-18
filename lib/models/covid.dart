import 'dart:convert';

class Covid {
  final int totalCases;
  final int totalDeaths;
  final int totalRecovered;
  Covid({
    required this.totalCases,
    required this.totalDeaths,
    required this.totalRecovered,
  });

  Covid copyWith({
    int? totalCases,
    int? totalDeaths,
    int? totalRecovered,
  }) {
    return Covid(
      totalCases: totalCases ?? this.totalCases,
      totalDeaths: totalDeaths ?? this.totalDeaths,
      totalRecovered: totalRecovered ?? this.totalRecovered,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'totalCases': totalCases,
      'totalDeaths': totalDeaths,
      'totalRecovered': totalRecovered,
    };
  }

  factory Covid.fromMap(Map<String, dynamic> map) {
    return Covid(
      totalCases: map['totalCases'] as int,
      totalDeaths: map['totalDeaths'] as int,
      totalRecovered: map['totalRecovered'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Covid.fromJson(String source) =>
      Covid.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'Covid(totalCases: $totalCases, totalDeaths: $totalDeaths, totalRecovered: $totalRecovered)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Covid &&
        other.totalCases == totalCases &&
        other.totalDeaths == totalDeaths &&
        other.totalRecovered == totalRecovered;
  }

  @override
  int get hashCode =>
      totalCases.hashCode ^ totalDeaths.hashCode ^ totalRecovered.hashCode;
}

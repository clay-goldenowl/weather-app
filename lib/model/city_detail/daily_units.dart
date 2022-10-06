class DailyUnits {
  String? time;
  String? temperature2mMax;

  DailyUnits({this.time, this.temperature2mMax});

  factory DailyUnits.fromJson(Map<String, dynamic> json) => DailyUnits(
        time: json['time'] as String?,
        temperature2mMax: json['temperature_2m_max'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'time': time,
        'temperature_2m_max': temperature2mMax,
      };
}

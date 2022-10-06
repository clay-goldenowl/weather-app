class Daily {
  List<dynamic>? time;
  List<dynamic>? temperature2mMax;

  Daily({this.time, this.temperature2mMax});

  factory Daily.fromJson(Map<String, dynamic> json) => Daily(
        time: json['time'] as List<dynamic>?,
        temperature2mMax: json['temperature_2m_max'] as List<dynamic>?,
      );

  Map<String, dynamic> toJson() => {
        'time': time,
        'temperature_2m_max': temperature2mMax,
      };
}

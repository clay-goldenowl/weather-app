class City {
  int? id;
  String? name;
  double? latitude;
  double? longitude;
  double? elevation;
  String? featureCode;
  String? countryCode;
  int? admin1Id;
  int? admin2Id;
  int? admin3Id;
  int? admin4Id;
  String? timezone;
  int? population;
  int? countryId;
  String? country;
  String? admin1;
  String? admin2;
  String? admin3;
  String? admin4;

  City({
    this.id,
    this.name,
    this.latitude,
    this.longitude,
    this.elevation,
    this.featureCode,
    this.countryCode,
    this.admin1Id,
    this.admin2Id,
    this.admin3Id,
    this.admin4Id,
    this.timezone,
    this.population,
    this.countryId,
    this.country,
    this.admin1,
    this.admin2,
    this.admin3,
    this.admin4,
  });

  factory City.fromJson(Map<String, dynamic> json) => City(
        id: json['id'] as int?,
        name: json['name'] as String?,
        latitude: (json['latitude'] as num?)?.toDouble(),
        longitude: (json['longitude'] as num?)?.toDouble(),
        elevation: (json['elevation'] as num?)?.toDouble(),
        featureCode: json['feature_code'] as String?,
        countryCode: json['country_code'] as String?,
        admin1Id: json['admin1_id'] as int?,
        admin2Id: json['admin2_id'] as int?,
        admin3Id: json['admin3_id'] as int?,
        admin4Id: json['admin4_id'] as int?,
        timezone: json['timezone'] as String?,
        population: json['population'] as int?,
        countryId: json['country_id'] as int?,
        country: json['country'] as String?,
        admin1: json['admin1'] as String?,
        admin2: json['admin2'] as String?,
        admin3: json['admin3'] as String?,
        admin4: json['admin4'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'latitude': latitude,
        'longitude': longitude,
        'elevation': elevation,
        'feature_code': featureCode,
        'country_code': countryCode,
        'admin1_id': admin1Id,
        'admin2_id': admin2Id,
        'admin3_id': admin3Id,
        'admin4_id': admin4Id,
        'timezone': timezone,
        'population': population,
        'country_id': countryId,
        'country': country,
        'admin1': admin1,
        'admin2': admin2,
        'admin3': admin3,
        'admin4': admin4,
      };
}

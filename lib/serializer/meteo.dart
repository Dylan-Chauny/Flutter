class Meteo {
  final CityInfo cityInfo;

  Meteo(this.cityInfo);
}

class CityInfo {
  final String name;
  final String country;
  final String lagitude;
  final String longitude;
  final String elevation;
  final String sunrise;
  final String sunset;

  CityInfo(this.name, this.country, this.lagitude, this.longitude, this.elevation, this.sunrise, this.sunset);

  factory CityInfo.fromJson(dynamic json) {
    return CityInfo(
      json['name'] as String,
      json['country'] as String,
      json['lagitude'] as String,
      json['longitude'] as String,
      json['elevation'] as String,
      json['sunrise'] as String,
      json['sunset'] as String,
    );
  }

  @override
  String toString() {
    return '{ ${this.name}, ${this.country}, ${this.lagitude}, ${this.longitude}, ${this.elevation}, ${this.sunrise}, ${this.sunset} }';
  }
}
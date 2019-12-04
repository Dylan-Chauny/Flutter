class CityInfo {
  final String name;
  final String country;
  final String latitude;
  final String longitude;
  final String elevation;
  final String sunrise;
  final String sunset;

  CityInfo.fromJson(Map<String, dynamic> json):
        name = json['name'],
        country = json['country'],
        latitude = json['latitude'],
        longitude = json['longitude'],
        elevation = json['elevation'],
        sunrise = json['sunrise'],
        sunset = json['sunset'];
}

class CurrentCondition {
  final String date;
  final String hour;
  final int tmp;
  final String wnd_spd;
  final String wnd_gust;
  final String wnd_dir;
  final String pressure;
  final String humidity;
  final String condition;
  final String condition_key;
  final String icon;
  final String icon_big;

  CurrentCondition(this.date, this.hour, this.tmp, this.wnd_spd, this.wnd_gust, this.wnd_dir, this.pressure, this.humidity, this.condition, this.condition_key, this.icon, this.icon_big);

  /*@override
  String toString() {
    return '{ ${this.date}, ${this.hour}, ${this.tmp}, ${this.longitude}, ${this.elevation}, ${this.sunrise}, ${this.sunset} }';
  }*/
}
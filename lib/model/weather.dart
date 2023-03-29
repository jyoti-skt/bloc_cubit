

class Weather {
  final String cityName;
  final double tempratureCelsius;

  Weather({required this.cityName,required this.tempratureCelsius});


  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Weather &&
        o.cityName == cityName &&
        o.tempratureCelsius == tempratureCelsius;
  }

  @override
  int get hashCode => cityName.hashCode ^ tempratureCelsius.hashCode;
}


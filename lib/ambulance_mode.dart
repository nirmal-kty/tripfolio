class Ambulance {
  final String vehicleNumber;

  final double? latitude;
  final double? longitude;

  Ambulance({
    required this.vehicleNumber,

    this.latitude,
    this.longitude,
  });

  factory Ambulance.fromJson(Map<String, dynamic> json) {
    return Ambulance(
      vehicleNumber: json['Ambulance'],

      latitude:
          json['Latitude'] != null ? double.parse(json['Latitude']) : null,
      longitude:
          json['Longitude'] != null ? double.parse(json['Longitude']) : null,
    );
  }
}

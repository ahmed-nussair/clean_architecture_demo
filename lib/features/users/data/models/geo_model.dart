import 'package:clean_architecture_demo/features/users/domain/entities/geo.dart';

class GeoModel extends Geo {
  const GeoModel({required super.lat, required super.lng});

  factory GeoModel.fromJson(Map<String, dynamic> json) => GeoModel(
        lat: json["lat"],
        lng: json["lng"],
      );

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "lng": lng,
      };
}

import 'package:clean_architecture_demo/features/users/data/models/geo_model.dart';
import 'package:clean_architecture_demo/features/users/domain/entities/address.dart';

class AddressModel extends Address {
  final GeoModel? geoModel;
  const AddressModel({
    required String street,
    required String suite,
    required String city,
    required String zipcode,
    required this.geoModel,
  }) : super(
          street: street,
          suite: suite,
          city: city,
          zipcode: zipcode,
          geo: geoModel,
        );

  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
        street: json["street"],
        suite: json["suite"],
        city: json["city"],
        zipcode: json["zipcode"],
        geoModel: GeoModel.fromJson(json["geo"]),
      );

  Map<String, dynamic> toJson() => {
        "street": street,
        "suite": suite,
        "city": city,
        "zipcode": zipcode,
        "geo": geoModel!.toJson(),
      };
}

import 'package:clean_architecture_demo/features/users/data/models/address_model.dart';
import 'package:clean_architecture_demo/features/users/data/models/company_model.dart';

import '../../domain/entities/user.dart';

class UserModel extends User {
  final AddressModel addressModel;
  final CompanyModel companyModel;
  const UserModel({
    required int? id,
    required String? name,
    required String? username,
    required String? email,
    required this.addressModel,
    required String? phone,
    required String? website,
    required this.companyModel,
  }) : super(
          id: id,
          name: name,
          username: username,
          email: email,
          address: addressModel,
          phone: phone,
          website: website,
          company: companyModel,
        );
  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        name: json["name"],
        username: json["username"],
        email: json["email"],
        addressModel: AddressModel.fromJson(json["address"]),
        phone: json["phone"],
        website: json["website"],
        companyModel: CompanyModel.fromJson(json["company"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "username": username,
        "email": email,
        "address": addressModel.toJson(),
        "phone": phone,
        "website": website,
        "company": companyModel.toJson(),
      };
}

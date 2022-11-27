import 'package:clean_architecture_demo/features/users/domain/entities/company.dart';

class CompanyModel extends Company {
  const CompanyModel({
    required super.name,
    required super.catchPhrase,
    required super.bs,
  });

  factory CompanyModel.fromJson(Map<String, dynamic> json) => CompanyModel(
        name: json["name"],
        catchPhrase: json["catchPhrase"],
        bs: json["bs"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "catchPhrase": catchPhrase,
        "bs": bs,
      };
}

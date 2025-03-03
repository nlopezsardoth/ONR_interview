import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
    @JsonKey(name: "address")
    AddressModel address;
    @JsonKey(name: "id")
    int id;
    @JsonKey(name: "email")
    String email;
    @JsonKey(name: "username")
    String username;
    @JsonKey(name: "password")
    String password;
    @JsonKey(name: "name")
    NameModel name;
    @JsonKey(name: "phone")
    String phone;

    UserModel({
        required this.address,
        required this.id,
        required this.email,
        required this.username,
        required this.password,
        required this.name,
        required this.phone,
    });

    factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

    Map<String, dynamic> toJson() => _$UserModelToJson(this);
}

@JsonSerializable()
class AddressModel {
    @JsonKey(name: "geolocation")
    GeolocationModel geolocation;
    @JsonKey(name: "city")
    String city;
    @JsonKey(name: "street")
    String street;
    @JsonKey(name: "number")
    int number;
    @JsonKey(name: "zipcode")
    String zipcode;

    AddressModel({
        required this.geolocation,
        required this.city,
        required this.street,
        required this.number,
        required this.zipcode,
    });

    factory AddressModel.fromJson(Map<String, dynamic> json) => _$AddressModelFromJson(json);

    Map<String, dynamic> toJson() => _$AddressModelToJson(this);
}

@JsonSerializable()
class GeolocationModel {
    @JsonKey(name: "lat")
    String lat;
    @JsonKey(name: "long")
    String long;

    GeolocationModel({
        required this.lat,
        required this.long,
    });

    factory GeolocationModel.fromJson(Map<String, dynamic> json) => _$GeolocationModelFromJson(json);

    Map<String, dynamic> toJson() => _$GeolocationModelToJson(this);
}

@JsonSerializable()
class NameModel {
    @JsonKey(name: "firstname")
    String firstname;
    @JsonKey(name: "lastname")
    String lastname;

    NameModel({
        required this.firstname,
        required this.lastname,
    });

    factory NameModel.fromJson(Map<String, dynamic> json) => _$NameModelFromJson(json);

    Map<String, dynamic> toJson() => _$NameModelToJson(this);
}

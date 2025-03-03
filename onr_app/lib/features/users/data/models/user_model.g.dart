// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      address: AddressModel.fromJson(json['address'] as Map<String, dynamic>),
      id: (json['id'] as num).toInt(),
      email: json['email'] as String,
      username: json['username'] as String,
      password: json['password'] as String,
      name: NameModel.fromJson(json['name'] as Map<String, dynamic>),
      phone: json['phone'] as String,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'address': instance.address,
      'id': instance.id,
      'email': instance.email,
      'username': instance.username,
      'password': instance.password,
      'name': instance.name,
      'phone': instance.phone,
    };

AddressModel _$AddressModelFromJson(Map<String, dynamic> json) => AddressModel(
      geolocation: GeolocationModel.fromJson(
          json['geolocation'] as Map<String, dynamic>),
      city: json['city'] as String,
      street: json['street'] as String,
      number: (json['number'] as num).toInt(),
      zipcode: json['zipcode'] as String,
    );

Map<String, dynamic> _$AddressModelToJson(AddressModel instance) =>
    <String, dynamic>{
      'geolocation': instance.geolocation,
      'city': instance.city,
      'street': instance.street,
      'number': instance.number,
      'zipcode': instance.zipcode,
    };

GeolocationModel _$GeolocationModelFromJson(Map<String, dynamic> json) =>
    GeolocationModel(
      lat: json['lat'] as String,
      long: json['long'] as String,
    );

Map<String, dynamic> _$GeolocationModelToJson(GeolocationModel instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'long': instance.long,
    };

NameModel _$NameModelFromJson(Map<String, dynamic> json) => NameModel(
      firstname: json['firstname'] as String,
      lastname: json['lastname'] as String,
    );

Map<String, dynamic> _$NameModelToJson(NameModel instance) => <String, dynamic>{
      'firstname': instance.firstname,
      'lastname': instance.lastname,
    };

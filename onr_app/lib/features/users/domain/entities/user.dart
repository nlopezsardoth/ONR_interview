import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int id;
  final String email;
  final String username;
  final String phone;
  final Address address;
  final Name name;

  const User({
    required this.id,
    required this.email,
    required this.username,
    required this.phone,
    required this.address,
    required this.name,
  });

  User copyWith({
    int? id,
    Name? name,
    String? username,
    String? email,
    String? phone,
    Address? address,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      username: username ?? this.username,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      address: address ?? this.address,
    );
  }

  @override
  List<Object?> get props => [id, email, username, phone, address, name];
}

class Address extends Equatable {
  final String city;
  final String street;
  final String number;
  final String zipcode;

  const Address({
    required this.city,
    required this.street,
    required this.number,
    required this.zipcode,
  });

  @override
  List<Object?> get props => [city, street, number, zipcode];
}

class Name extends Equatable {
  final String firstname;
  final String lastname;

  const Name({required this.firstname, required this.lastname});

  @override
  List<Object?> get props => [firstname, lastname];
}

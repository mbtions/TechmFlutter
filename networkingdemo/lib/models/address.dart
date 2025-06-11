import 'dart:convert';
import 'geo.dart';

class Address {
  String street;
  String suite;
  String city;
  String zipcode;
  Geo geo;

  Address({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.geo,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    street: json["street"],
    suite: json["suite"],
    city: json["city"],
    zipcode: json["zipcode"],
    geo: Geo.fromJson(json["geo"]),
  );

  Map<String, dynamic> toJson() => {
    "street": street,
    "suite": suite,
    "city": city,
    "zipcode": zipcode,
    "geo": geo.toJson(),
  };
}

// Function to parse a JSON string into an Address object
Address addressFromJson(String str) => Address.fromJson(json.decode(str));

// Function to convert an Address object into a JSON string
String addressToJson(Address data) => json.encode(data.toJson());

// Function to parse a list of JSON strings into a list of Address objects
List<Address> addressListFromJson(String str) {
  final jsonData = json.decode(str) as List;
  return jsonData.map((item) => Address.fromJson(item)).toList();
}

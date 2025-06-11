import 'dart:convert';

class Company {
  String name;
  String catchPhrase;
  String bs;

  Company({required this.name, required this.catchPhrase, required this.bs});

  factory Company.fromJson(Map<String, dynamic> json) => Company(
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

// Function to parse a JSON string into a Company object
Company companyFromJson(String str) => Company.fromJson(json.decode(str));

// Function to convert a Company object into a JSON string
String companyToJson(Company data) => json.encode(data.toJson());

// Function to parse a list of JSON strings into a list of Company objects
List<Company> companyListFromJson(String str) {
  final jsonData = json.decode(str) as List;
  return jsonData.map((item) => Company.fromJson(item)).toList();
}

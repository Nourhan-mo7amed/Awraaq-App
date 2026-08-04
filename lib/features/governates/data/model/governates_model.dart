class GovernoratesModel {
  final String message;
  final List<Governorate> data;

  GovernoratesModel({
    required this.message,
    required this.data,
  });

  factory GovernoratesModel.fromJson(Map<String, dynamic> json) {
    return GovernoratesModel(
      message: json["message"],
      data: (json["data"] as List)
          .map((e) => Governorate.fromJson(e))
          .toList(),
    );
  }
}

class Governorate {
  final int id;
  final String name;

  Governorate({
    required this.id,
    required this.name,
  });

  factory Governorate.fromJson(Map<String, dynamic> json) {
    return Governorate(
      id: json["id"],
      name: json["name"],
    );
  }
}
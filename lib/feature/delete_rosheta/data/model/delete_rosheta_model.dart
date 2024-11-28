class DeleteRoshtaResponse {
  final String message;
  final Roshta roshta;

  DeleteRoshtaResponse({
    required this.message,
    required this.roshta,
  });

  factory DeleteRoshtaResponse.fromJson(Map<String, dynamic> json) {
    return DeleteRoshtaResponse(
      message: json['message'],
      roshta: Roshta.fromJson(json['roshta']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'roshta': roshta.toJson(),
    };
  }
}

class Roshta {
  final String id;
  final String title;
  final String userId;
  final List<dynamic> image; // Adjust the type if the image array has specific data
  final String terms;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int version;

  Roshta({
    required this.id,
    required this.title,
    required this.userId,
    required this.image,
    required this.terms,
    required this.createdAt,
    required this.updatedAt,
    required this.version,
  });

  factory Roshta.fromJson(Map<String, dynamic> json) {
    return Roshta(
      id: json['_id'],
      title: json['title'],
      userId: json['userid'],
      image: json['image'] ?? [],
      terms: json['terms'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      version: json['__v'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'title': title,
      'userid': userId,
      'image': image,
      'terms': terms,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      '__v': version,
    };
  }
}

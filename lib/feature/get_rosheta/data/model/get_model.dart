class GetResponseModel {
  final String message;
  final Roshta roshta;

  GetResponseModel({
    required this.message,
    required this.roshta,
  });

  factory GetResponseModel.fromJson(Map<String, dynamic> json) {
    return GetResponseModel(
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
  final User userid;
  final List<String> image;
  final String terms;
  final String createdAt;
  final String updatedAt;
  final int v;

  Roshta({
    required this.id,
    required this.title,
    required this.userid,
    required this.image,
    required this.terms,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory Roshta.fromJson(Map<String, dynamic> json) {
    return Roshta(
      id: json['_id'],
      title: json['title'],
      userid: User.fromJson(json['userid']),
      image: List<String>.from(json['image']),
      terms: json['terms'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      v: json['__v'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'title': title,
      'userid': userid.toJson(),
      'image': image,
      'terms': terms,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      '__v': v,
    };
  }
}

class User {
  final String id;
  final String fullName;
  final String phone;
  final String role;
  final List<dynamic> tahalil;
  final List<String> roshta;
  final List<dynamic> asheaa;
  final List<dynamic> medicin;
  final List<String> reservs;
  final bool blocked;
  final String subscriptionId;
  final String gender;
  final String createdAt;
  final String updatedAt;
  final int v;

  User({
    required this.id,
    required this.fullName,
    required this.phone,
    required this.role,
    required this.tahalil,
    required this.roshta,
    required this.asheaa,
    required this.medicin,
    required this.reservs,
    required this.blocked,
    required this.subscriptionId,
    required this.gender,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'],
      fullName: json['fullName'],
      phone: json['phone'],
      role: json['role'],
      tahalil: List<dynamic>.from(json['tahalil']),
      roshta: List<String>.from(json['roshta']),
      asheaa: List<dynamic>.from(json['asheaa']),
      medicin: List<dynamic>.from(json['medicin']),
      reservs: List<String>.from(json['reservs']),
      blocked: json['blocked'],
      subscriptionId: json['subscriptionId'],
      gender: json['gender'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      v: json['__v'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'fullName': fullName,
      'phone': phone,
      'role': role,
      'tahalil': tahalil,
      'roshta': roshta,
      'asheaa': asheaa,
      'medicin': medicin,
      'reservs': reservs,
      'blocked': blocked,
      'subscriptionId': subscriptionId,
      'gender': gender,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      '__v': v,
    };
  }
}

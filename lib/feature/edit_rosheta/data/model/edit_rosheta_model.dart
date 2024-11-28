class EditRoshetaModel {
  String? message;
  Roshta? roshta;

  EditRoshetaModel({this.message, this.roshta});

  EditRoshetaModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    roshta =
    json['roshta'] != null ? new Roshta.fromJson(json['roshta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['message'] = this.message;
    if (this.roshta != null) {
      data['roshta'] = this.roshta!.toJson();
    }
    return data;
  }
}

class Roshta {
  String? sId;
  String? userid;
  List<String>? image;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? terms;

  Roshta(
      {this.sId,
        this.userid,
        this.image,
        this.createdAt,
        this.updatedAt,
        this.iV,
        this.terms});

  Roshta.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userid = json['userid'];
    image = json['image'].cast<String>();
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    terms = json['terms'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['_id'] = this.sId;
    data['userid'] = this.userid;
    data['image'] = this.image;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['terms'] = this.terms;
    return data;
  }
}

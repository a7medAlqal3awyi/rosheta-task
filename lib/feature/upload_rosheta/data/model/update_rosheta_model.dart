class UploadRoshetaModel {
  String? message;
  Report? report;

  UploadRoshetaModel({this.message, this.report});

  UploadRoshetaModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    report =
    json['report'] != null ?  Report.fromJson(json['report']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['message'] = this.message;
    if (this.report != null) {
      data['report'] = this.report!.toJson();
    }
    return data;
  }
}

class Report {
  String? title;
  String? userid;
  List<String>? image;
  String? terms;
  String? sId;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Report(
      {this.title,
        this.userid,
        this.image,
        this.terms,
        this.sId,
        this.createdAt,
        this.updatedAt,
        this.iV});

  Report.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    userid = json['userid'];
    image = json['image'].cast<String>();
    terms = json['terms'];
    sId = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['title'] = this.title;
    data['userid'] = this.userid;
    data['image'] = this.image;
    data['terms'] = this.terms;
    data['_id'] = this.sId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

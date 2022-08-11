class SocialUserModel {
  String? name;
  String? uId;
  String? phone;
  String? email;

  SocialUserModel({this.email, this.name, this.phone, this.uId});

  SocialUserModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    name = json['name'];
    phone = json['phone'];
    uId = json['uId'];
  }
  Map<String, dynamic> toMap() {
    return {'name': name, 'phone': phone, 'email': email, 'uId': uId};
  }
}

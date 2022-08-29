class SocialUserModel {
  String? name;
  String? uId;
  String? phone;
  String? email;
  bool? isEmailVerified;

  SocialUserModel({this.email, this.name, this.phone, this.uId,this.isEmailVerified});

  SocialUserModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    name = json['name'];
    phone = json['phone'];
    uId = json['uId'];
    isEmailVerified=json['isEmailVerified'];
  }
  Map<String, dynamic> toMap() {
    return {'name': name, 'phone': phone, 'email': email, 'uId': uId,'isEmailVerified':isEmailVerified};
  }
}

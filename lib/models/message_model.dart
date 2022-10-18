class MessageModel {
  String? text;
  String? receiverId;
  String? senderId;
  String? dateTime;
  String? image;
  MessageModel(
      {required this.dateTime,
      required this.receiverId,
      required this.senderId,
      required this.text,
      this.image});
  MessageModel.fromJson(Map<String, dynamic>? json) {
    text = json!['text'];
    receiverId = json['reseiverId'];
    senderId = json['senderId'];
    dateTime = json['dateTime'];
    image = json['image'];
  }
  Map<String, dynamic> toMap() {
    return {
      'text': text,
      'reseiverId': receiverId,
      'senderId': senderId,
      'dateTime': dateTime,
      'image': image
    };
  }
}

class MessageModel {
  String? text;
  String? receiverId;
  String? senderId;
  String? dateTime;
  MessageModel(
      {required this.dateTime,
      required this.receiverId,
      required this.senderId,
      required this.text});
  MessageModel.fromJson(Map<String, dynamic>? json) {
    text = json!['text'];
    receiverId = json['reseiverId'];
    senderId = json['senderId'];
    dateTime = json['dateTime'];
  }
  Map<String, dynamic> toMap() {
    return {
      'text': text,
      'reseiverId': receiverId,
      'senderId': senderId,
      'dateTime': dateTime,
    };
  }
}

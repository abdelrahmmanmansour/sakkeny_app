class Chatmodel {
  Chatmodel({
      this.userChatId, 
      this.userChatDate, 
      this.userChatTime, 
      this.userChatType, 
      this.userChatText, 
      this.userChatImage, 
      this.userChatFrom, 
      this.userChatTo,});

  Chatmodel.fromJson(dynamic json) {
    userChatId = json['userChatId'];
    userChatDate = json['userChatDate'];
    userChatTime = json['userChatTime'];
    userChatType = json['userChatType'];
    userChatText = json['userChatText'];
    userChatImage = json['userChatImage'];
    userChatFrom = json['userChatFrom'];
    userChatTo = json['userChatTo'];
  }
  num? userChatId;
  String? userChatDate;
  String? userChatTime;
  String? userChatType;
  String? userChatText;
  dynamic userChatImage;
  String? userChatFrom;
  String? userChatTo;
Chatmodel copyWith({  num? userChatId,
  String? userChatDate,
  String? userChatTime,
  String? userChatType,
  String? userChatText,
  dynamic userChatImage,
  String? userChatFrom,
  String? userChatTo,
}) => Chatmodel(  userChatId: userChatId ?? this.userChatId,
  userChatDate: userChatDate ?? this.userChatDate,
  userChatTime: userChatTime ?? this.userChatTime,
  userChatType: userChatType ?? this.userChatType,
  userChatText: userChatText ?? this.userChatText,
  userChatImage: userChatImage ?? this.userChatImage,
  userChatFrom: userChatFrom ?? this.userChatFrom,
  userChatTo: userChatTo ?? this.userChatTo,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userChatId'] = userChatId;
    map['userChatDate'] = userChatDate;
    map['userChatTime'] = userChatTime;
    map['userChatType'] = userChatType;
    map['userChatText'] = userChatText;
    map['userChatImage'] = userChatImage;
    map['userChatFrom'] = userChatFrom;
    map['userChatTo'] = userChatTo;
    return map;
  }

}
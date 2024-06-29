class MessgeModel {
  MessgeModel({
      this.timeCreated, 
      this.feedbackText, 
      this.dateCreated, 
      this.user,});

  MessgeModel.fromJson(dynamic json) {
    timeCreated = json['timeCreated'];
    feedbackText = json['feedbackText'];
    dateCreated = json['dateCreated'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
  String? timeCreated;
  String? feedbackText;
  dynamic dateCreated;
  User? user;
MessgeModel copyWith({  String? timeCreated,
  String? feedbackText,
  dynamic dateCreated,
  User? user,
}) => MessgeModel(  timeCreated: timeCreated ?? this.timeCreated,
  feedbackText: feedbackText ?? this.feedbackText,
  dateCreated: dateCreated ?? this.dateCreated,
  user: user ?? this.user,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['timeCreated'] = timeCreated;
    map['feedbackText'] = feedbackText;
    map['dateCreated'] = dateCreated;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    return map;
  }

}

class User {
  User({
      this.userId, 
      this.userName, 
      this.userPassword, 
      this.userFullName, 
      this.userEmail, 
      this.userNatId, 
      this.userGender, 
      this.userAge, 
      this.userInfo, 
      this.userAddress, 
      this.userAccountType,});

  User.fromJson(dynamic json) {
    userId = json['userId'];
    userName = json['userName'];
    userPassword = json['userPassword'];
    userFullName = json['userFullName'];
    userEmail = json['userEmail'];
    userNatId = json['userNatId'];
    userGender = json['userGender'];
    userAge = json['userAge'];
    userInfo = json['userInfo'];
    userAddress = json['userAddress'];
    userAccountType = json['userAccountType'];
  }
  num? userId;
  String? userName;
  String? userPassword;
  String? userFullName;
  String? userEmail;
  String? userNatId;
  String? userGender;
  num? userAge;
  String? userInfo;
  String? userAddress;
  String? userAccountType;
User copyWith({  num? userId,
  String? userName,
  String? userPassword,
  String? userFullName,
  String? userEmail,
  String? userNatId,
  String? userGender,
  num? userAge,
  String? userInfo,
  String? userAddress,
  String? userAccountType,
}) => User(  userId: userId ?? this.userId,
  userName: userName ?? this.userName,
  userPassword: userPassword ?? this.userPassword,
  userFullName: userFullName ?? this.userFullName,
  userEmail: userEmail ?? this.userEmail,
  userNatId: userNatId ?? this.userNatId,
  userGender: userGender ?? this.userGender,
  userAge: userAge ?? this.userAge,
  userInfo: userInfo ?? this.userInfo,
  userAddress: userAddress ?? this.userAddress,
  userAccountType: userAccountType ?? this.userAccountType,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userId'] = userId;
    map['userName'] = userName;
    map['userPassword'] = userPassword;
    map['userFullName'] = userFullName;
    map['userEmail'] = userEmail;
    map['userNatId'] = userNatId;
    map['userGender'] = userGender;
    map['userAge'] = userAge;
    map['userInfo'] = userInfo;
    map['userAddress'] = userAddress;
    map['userAccountType'] = userAccountType;
    return map;
  }

}
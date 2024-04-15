class UserModel {
  UserModel({
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

  UserModel.fromJson(dynamic json) {
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
UserModel copyWith({  num? userId,
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
}) => UserModel(  userId: userId ?? this.userId,
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
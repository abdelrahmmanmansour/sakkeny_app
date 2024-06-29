class FeedBackUser {
  FeedBackUser({
      this.userFeedback, 
      this.userWhoMadeTheFeedback,});

  FeedBackUser.fromJson(dynamic json) {
    userFeedback = json['userFeedback'] != null ? UserFeedback.fromJson(json['userFeedback']) : null;
    userWhoMadeTheFeedback = json['userWhoMadeTheFeedback'] != null ? UserWhoMadeTheFeedback.fromJson(json['userWhoMadeTheFeedback']) : null;
  }
  UserFeedback? userFeedback;
  UserWhoMadeTheFeedback? userWhoMadeTheFeedback;
FeedBackUser copyWith({  UserFeedback? userFeedback,
  UserWhoMadeTheFeedback? userWhoMadeTheFeedback,
}) => FeedBackUser(  userFeedback: userFeedback ?? this.userFeedback,
  userWhoMadeTheFeedback: userWhoMadeTheFeedback ?? this.userWhoMadeTheFeedback,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (userFeedback != null) {
      map['userFeedback'] = userFeedback?.toJson();
    }
    if (userWhoMadeTheFeedback != null) {
      map['userWhoMadeTheFeedback'] = userWhoMadeTheFeedback?.toJson();
    }
    return map;
  }

}

class UserWhoMadeTheFeedback {
  UserWhoMadeTheFeedback({
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

  UserWhoMadeTheFeedback.fromJson(dynamic json) {
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
UserWhoMadeTheFeedback copyWith({  num? userId,
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
}) => UserWhoMadeTheFeedback(  userId: userId ?? this.userId,
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

class UserFeedback {
  UserFeedback({
      this.feedbackId, 
      this.feedbackText, 
      this.feedbackDate, 
      this.feedbackTime, 
      this.feedbackFrom, 
      this.feedbackTo,});

  UserFeedback.fromJson(dynamic json) {
    feedbackId = json['feedbackId'];
    feedbackText = json['feedbackText'];
    feedbackDate = json['feedbackDate'];
    feedbackTime = json['feedbackTime'];
    feedbackFrom = json['feedbackFrom'];
    feedbackTo = json['feedbackTo'];
  }
  num? feedbackId;
  String? feedbackText;
  String? feedbackDate;
  String? feedbackTime;
  String? feedbackFrom;
  String? feedbackTo;
UserFeedback copyWith({  num? feedbackId,
  String? feedbackText,
  String? feedbackDate,
  String? feedbackTime,
  String? feedbackFrom,
  String? feedbackTo,
}) => UserFeedback(  feedbackId: feedbackId ?? this.feedbackId,
  feedbackText: feedbackText ?? this.feedbackText,
  feedbackDate: feedbackDate ?? this.feedbackDate,
  feedbackTime: feedbackTime ?? this.feedbackTime,
  feedbackFrom: feedbackFrom ?? this.feedbackFrom,
  feedbackTo: feedbackTo ?? this.feedbackTo,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['feedbackId'] = feedbackId;
    map['feedbackText'] = feedbackText;
    map['feedbackDate'] = feedbackDate;
    map['feedbackTime'] = feedbackTime;
    map['feedbackFrom'] = feedbackFrom;
    map['feedbackTo'] = feedbackTo;
    return map;
  }

}
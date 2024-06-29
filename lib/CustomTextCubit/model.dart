class Model {
  Model({
      num? userId, 
      String? userName, 
      String? userPassword, 
      String? userFullName, 
      String? userEmail, 
      String? userNatId, 
      String? userGender, 
      num? userAge, 
      String? userInfo, 
      String? userAddress, 
      String? userAccountType,}){
    _userId = userId;
    _userName = userName;
    _userPassword = userPassword;
    _userFullName = userFullName;
    _userEmail = userEmail;
    _userNatId = userNatId;
    _userGender = userGender;
    _userAge = userAge;
    _userInfo = userInfo;
    _userAddress = userAddress;
    _userAccountType = userAccountType;
}

  Model.fromJson(dynamic json) {
    _userId = json['userId'];
    _userName = json['userName'];
    _userPassword = json['userPassword'];
    _userFullName = json['userFullName'];
    _userEmail = json['userEmail'];
    _userNatId = json['userNatId'];
    _userGender = json['userGender'];
    _userAge = json['userAge'];
    _userInfo = json['userInfo'];
    _userAddress = json['userAddress'];
    _userAccountType = json['userAccountType'];
  }
  num? _userId;
  String? _userName;
  String? _userPassword;
  String? _userFullName;
  String? _userEmail;
  String? _userNatId;
  String? _userGender;
  num? _userAge;
  String? _userInfo;
  String? _userAddress;
  String? _userAccountType;
Model copyWith({  num? userId,
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
}) => Model(  userId: userId ?? _userId,
  userName: userName ?? _userName,
  userPassword: userPassword ?? _userPassword,
  userFullName: userFullName ?? _userFullName,
  userEmail: userEmail ?? _userEmail,
  userNatId: userNatId ?? _userNatId,
  userGender: userGender ?? _userGender,
  userAge: userAge ?? _userAge,
  userInfo: userInfo ?? _userInfo,
  userAddress: userAddress ?? _userAddress,
  userAccountType: userAccountType ?? _userAccountType,
);
  num? get userId => _userId;
  String? get userName => _userName;
  String? get userPassword => _userPassword;
  String? get userFullName => _userFullName;
  String? get userEmail => _userEmail;
  String? get userNatId => _userNatId;
  String? get userGender => _userGender;
  num? get userAge => _userAge;
  String? get userInfo => _userInfo;
  String? get userAddress => _userAddress;
  String? get userAccountType => _userAccountType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userId'] = _userId;
    map['userName'] = _userName;
    map['userPassword'] = _userPassword;
    map['userFullName'] = _userFullName;
    map['userEmail'] = _userEmail;
    map['userNatId'] = _userNatId;
    map['userGender'] = _userGender;
    map['userAge'] = _userAge;
    map['userInfo'] = _userInfo;
    map['userAddress'] = _userAddress;
    map['userAccountType'] = _userAccountType;
    return map;
  }

}
class GetPostDataUser {
  GetPostDataUser({
      this.postId, 
      this.postDate, 
      this.postTime, 
      this.postCategory, 
      this.postTitle, 
      this.postBody, 
      this.postArea, 
      this.postKitchens, 
      this.postBedrooms, 
      this.postBathrooms, 
      this.postLookSea, 
      this.postPetsAllow, 
      this.postCurrency, 
      this.postPriceAi, 
      this.postPriceDisplay, 
      this.postPriceType, 
      this.postAddress, 
      this.postCity, 
      this.postState, 
      this.postFloor, 
      this.postLatitude, 
      this.postLongitude, 
      this.postStatue, 
      this.postUserId, 
      this.postPicTbls, 
      this.features,});

  GetPostDataUser.fromJson(dynamic json) {
    postId = json['postId'];
    postDate = json['postDate'];
    postTime = json['postTime'];
    postCategory = json['postCategory'];
    postTitle = json['postTitle'];
    postBody = json['postBody'];
    postArea = json['postArea'];
    postKitchens = json['postKitchens'];
    postBedrooms = json['postBedrooms'];
    postBathrooms = json['postBathrooms'];
    postLookSea = json['postLookSea'];
    postPetsAllow = json['postPetsAllow'];
    postCurrency = json['postCurrency'];
    postPriceAi = json['postPriceAi'];
    postPriceDisplay = json['postPriceDisplay'];
    postPriceType = json['postPriceType'];
    postAddress = json['postAddress'];
    postCity = json['postCity'];
    postState = json['postState'];
    postFloor = json['postFloor'];
    postLatitude = json['postLatitude'];
    postLongitude = json['postLongitude'];
    postStatue = json['postStatue'];
    postUserId = json['postUserId'];
    if (json['postPicTbls'] != null) {
      postPicTbls = [];
      json['postPicTbls'].forEach((v) {
        postPicTbls?.add(PostPicTbls.fromJson(v));
      });
    }
    if (json['features'] != null) {
      features = [];
      json['features'].forEach((v) {
        features?.add(Features.fromJson(v));
      });
    }
  }
  num? postId;
  String? postDate;
  String? postTime;
  String? postCategory;
  String? postTitle;
  String? postBody;
  num? postArea;
  num? postKitchens;
  num? postBedrooms;
  num? postBathrooms;
  bool? postLookSea;
  bool? postPetsAllow;
  String? postCurrency;
  num? postPriceAi;
  num? postPriceDisplay;
  String? postPriceType;
  String? postAddress;
  String? postCity;
  String? postState;
  num? postFloor;
  String? postLatitude;
  String? postLongitude;
  bool? postStatue;
  num? postUserId;
  List<PostPicTbls>? postPicTbls;
  List<Features>? features;
GetPostDataUser copyWith({  num? postId,
  String? postDate,
  String? postTime,
  String? postCategory,
  String? postTitle,
  String? postBody,
  num? postArea,
  num? postKitchens,
  num? postBedrooms,
  num? postBathrooms,
  bool? postLookSea,
  bool? postPetsAllow,
  String? postCurrency,
  num? postPriceAi,
  num? postPriceDisplay,
  String? postPriceType,
  String? postAddress,
  String? postCity,
  String? postState,
  num? postFloor,
  String? postLatitude,
  String? postLongitude,
  bool? postStatue,
  num? postUserId,
  List<PostPicTbls>? postPicTbls,
  List<Features>? features,
}) => GetPostDataUser(  postId: postId ?? this.postId,
  postDate: postDate ?? this.postDate,
  postTime: postTime ?? this.postTime,
  postCategory: postCategory ?? this.postCategory,
  postTitle: postTitle ?? this.postTitle,
  postBody: postBody ?? this.postBody,
  postArea: postArea ?? this.postArea,
  postKitchens: postKitchens ?? this.postKitchens,
  postBedrooms: postBedrooms ?? this.postBedrooms,
  postBathrooms: postBathrooms ?? this.postBathrooms,
  postLookSea: postLookSea ?? this.postLookSea,
  postPetsAllow: postPetsAllow ?? this.postPetsAllow,
  postCurrency: postCurrency ?? this.postCurrency,
  postPriceAi: postPriceAi ?? this.postPriceAi,
  postPriceDisplay: postPriceDisplay ?? this.postPriceDisplay,
  postPriceType: postPriceType ?? this.postPriceType,
  postAddress: postAddress ?? this.postAddress,
  postCity: postCity ?? this.postCity,
  postState: postState ?? this.postState,
  postFloor: postFloor ?? this.postFloor,
  postLatitude: postLatitude ?? this.postLatitude,
  postLongitude: postLongitude ?? this.postLongitude,
  postStatue: postStatue ?? this.postStatue,
  postUserId: postUserId ?? this.postUserId,
  postPicTbls: postPicTbls ?? this.postPicTbls,
  features: features ?? this.features,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['postId'] = postId;
    map['postDate'] = postDate;
    map['postTime'] = postTime;
    map['postCategory'] = postCategory;
    map['postTitle'] = postTitle;
    map['postBody'] = postBody;
    map['postArea'] = postArea;
    map['postKitchens'] = postKitchens;
    map['postBedrooms'] = postBedrooms;
    map['postBathrooms'] = postBathrooms;
    map['postLookSea'] = postLookSea;
    map['postPetsAllow'] = postPetsAllow;
    map['postCurrency'] = postCurrency;
    map['postPriceAi'] = postPriceAi;
    map['postPriceDisplay'] = postPriceDisplay;
    map['postPriceType'] = postPriceType;
    map['postAddress'] = postAddress;
    map['postCity'] = postCity;
    map['postState'] = postState;
    map['postFloor'] = postFloor;
    map['postLatitude'] = postLatitude;
    map['postLongitude'] = postLongitude;
    map['postStatue'] = postStatue;
    map['postUserId'] = postUserId;
    if (postPicTbls != null) {
      map['postPicTbls'] = postPicTbls?.map((v) => v.toJson()).toList();
    }
    if (features != null) {
      map['features'] = features?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Features {
  Features({
      this.featuresName,});

  Features.fromJson(dynamic json) {
    featuresName = json['featuresName'];
  }
  String? featuresName;
Features copyWith({  String? featuresName,
}) => Features(  featuresName: featuresName ?? this.featuresName,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['featuresName'] = featuresName;
    return map;
  }

}

class PostPicTbls {
  PostPicTbls({
      this.pictureString,});

  PostPicTbls.fromJson(dynamic json) {
    pictureString = json['pictureString'];
  }
  String? pictureString;
PostPicTbls copyWith({  String? pictureString,
}) => PostPicTbls(  pictureString: pictureString ?? this.pictureString,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['pictureString'] = pictureString;
    return map;
  }

}
import 'dart:convert';

/// data : {"id":2,"user_id":259,"country_id":167,"state_id":3176,"city_id":85437,"name":"Jack Daneal","first_name":"Jack","last_name":"Daneal","description":"First off, thank you for living your dharma and purpose. We understand the path has been long, windy and sometimes obstacle-ridden, we get it! We here at","address_line_1":"Test","address_line_2":"Test2","user_name":"jack","zip_code":"38000","is_approved":1,"approved_at":"2023-01-22T02:18:09.000000Z","is_active":1,"is_featured":1,"icon":null,"image":"/images/profile_images/642c759a97971.png","cover_image":null,"rating":4.5,"lawyer_settings":{"facebook_url":"facebook.com","twitter_url":"twitter.com","youtube_url":"youtube.com","tiktok_url":"tiktok.com","linkedin_url":"linkedin.com","whatsapp_url":"whatsapp.com","snapchat_url":"snapchat.com","instagram_url":"instagram.com","pinterest_url":"pinterest.com","youtube_playlist_link":"https://www.youtube.com/embed/videoseries?list=PLmfcCDSUSykbw9ewtVgSDKazPDwoTBm8E","youtube_channel_link":"https://www.youtube.com/@GeetMP3","instagram_profile_link":"https://lawyer-consultation.dev.trigonotech.com","instagram_access_token":"IGQVJXT1BLMzRsR3BsX3ZAFQmhKRzgwR3VwOWstbk5YWHBlOFNfeFJDUzZA6bldvZAm1BdDI2STVwUkRsVnppVzY1UUs5Xy1ENFRZATEZA6RUVSRzdneE1Fb0J3X0FNZATZAJSkZACMENQZA2pCLTduT0k4SVNLeQZDZD","calendly_link":"https://calendly.com/mbilalnaeem5/test"},"lawyer_category_ids":[1,2],"lawyer_categories":[{"id":1,"name":"Astrology","description":null,"slug":"astrology-1","is_active":1,"is_featured":0,"icon":null,"image":null,"created_at":"2023-03-16T11:13:22.000000Z","updated_at":"2023-03-16T11:13:22.000000Z"},{"id":2,"name":"Chinese Astrology","description":null,"slug":"chinese-astrology-2","is_active":1,"is_featured":0,"icon":null,"image":null,"created_at":"2023-03-16T11:13:22.000000Z","updated_at":"2023-03-16T11:13:22.000000Z"}],"created_at":"2023-01-18T18:09:26.000000Z","updated_at":"2023-04-04T16:08:10.000000Z"}
/// success : true
/// message : "Lawyer Fetched Successfully"
/// errors : null

LawyerDetailModel lawyerDetailModelFromJson(String str) =>
    LawyerDetailModel.fromJson(json.decode(str));
String lawyerDetailModelToJson(LawyerDetailModel data) =>
    json.encode(data.toJson());

class LawyerDetailModel {
  LawyerDetailModel({
    Data? data,
    bool? success,
    String? message,
    dynamic errors,
  }) {
    _data = data;
    _success = success;
    _message = message;
    _errors = errors;
  }

  LawyerDetailModel.fromJson(dynamic json) {
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _success = json['success'];
    _message = json['message'];
    _errors = json['errors'];
  }
  Data? _data;
  bool? _success;
  String? _message;
  dynamic _errors;
  LawyerDetailModel copyWith({
    Data? data,
    bool? success,
    String? message,
    dynamic errors,
  }) =>
      LawyerDetailModel(
        data: data ?? _data,
        success: success ?? _success,
        message: message ?? _message,
        errors: errors ?? _errors,
      );
  Data? get data => _data;
  bool? get success => _success;
  String? get message => _message;
  dynamic get errors => _errors;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    map['success'] = _success;
    map['message'] = _message;
    map['errors'] = _errors;
    return map;
  }
}

/// id : 2
/// user_id : 259
/// country_id : 167
/// state_id : 3176
/// city_id : 85437
/// name : "Jack Daneal"
/// first_name : "Jack"
/// last_name : "Daneal"
/// description : "First off, thank you for living your dharma and purpose. We understand the path has been long, windy and sometimes obstacle-ridden, we get it! We here at"
/// address_line_1 : "Test"
/// address_line_2 : "Test2"
/// user_name : "jack"
/// zip_code : "38000"
/// is_approved : 1
/// approved_at : "2023-01-22T02:18:09.000000Z"
/// is_active : 1
/// is_featured : 1
/// icon : null
/// image : "/images/profile_images/642c759a97971.png"
/// cover_image : null
/// rating : 4.5
/// lawyer_settings : {"facebook_url":"facebook.com","twitter_url":"twitter.com","youtube_url":"youtube.com","tiktok_url":"tiktok.com","linkedin_url":"linkedin.com","whatsapp_url":"whatsapp.com","snapchat_url":"snapchat.com","instagram_url":"instagram.com","pinterest_url":"pinterest.com","youtube_playlist_link":"https://www.youtube.com/embed/videoseries?list=PLmfcCDSUSykbw9ewtVgSDKazPDwoTBm8E","youtube_channel_link":"https://www.youtube.com/@GeetMP3","instagram_profile_link":"https://lawyer-consultation.dev.trigonotech.com","instagram_access_token":"IGQVJXT1BLMzRsR3BsX3ZAFQmhKRzgwR3VwOWstbk5YWHBlOFNfeFJDUzZA6bldvZAm1BdDI2STVwUkRsVnppVzY1UUs5Xy1ENFRZATEZA6RUVSRzdneE1Fb0J3X0FNZATZAJSkZACMENQZA2pCLTduT0k4SVNLeQZDZD","calendly_link":"https://calendly.com/mbilalnaeem5/test"}
/// lawyer_category_ids : [1,2]
/// lawyer_categories : [{"id":1,"name":"Astrology","description":null,"slug":"astrology-1","is_active":1,"is_featured":0,"icon":null,"image":null,"created_at":"2023-03-16T11:13:22.000000Z","updated_at":"2023-03-16T11:13:22.000000Z"},{"id":2,"name":"Chinese Astrology","description":null,"slug":"chinese-astrology-2","is_active":1,"is_featured":0,"icon":null,"image":null,"created_at":"2023-03-16T11:13:22.000000Z","updated_at":"2023-03-16T11:13:22.000000Z"}]
/// created_at : "2023-01-18T18:09:26.000000Z"
/// updated_at : "2023-04-04T16:08:10.000000Z"

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());

class Data {
  Data({
    num? id,
    num? userId,
    num? countryId,
    num? stateId,
    num? cityId,
    String? name,
    String? firstName,
    String? lastName,
    String? description,
    String? addressLine1,
    String? addressLine2,
    String? userName,
    String? zipCode,
    num? isApproved,
    String? approvedAt,
    num? isActive,
    num? isFeatured,
    dynamic icon,
    String? image,
    dynamic coverImage,
    num? rating,
    LawyerSettings? lawyerSettings,
    List<num>? lawyerCategoryIds,
    List<LawyerCategories>? lawyerCategories,
    String? createdAt,
    String? updatedAt,
  }) {
    _id = id;
    _userId = userId;
    _countryId = countryId;
    _stateId = stateId;
    _cityId = cityId;
    _name = name;
    _firstName = firstName;
    _lastName = lastName;
    _description = description;
    _addressLine1 = addressLine1;
    _addressLine2 = addressLine2;
    _userName = userName;
    _zipCode = zipCode;
    _isApproved = isApproved;
    _approvedAt = approvedAt;
    _isActive = isActive;
    _isFeatured = isFeatured;
    _icon = icon;
    _image = image;
    _coverImage = coverImage;
    _rating = rating;
    _lawyerSettings = lawyerSettings;
    _lawyerCategoryIds = lawyerCategoryIds;
    _lawyerCategories = lawyerCategories;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _countryId = json['country_id'];
    _stateId = json['state_id'];
    _cityId = json['city_id'];
    _name = json['name'];
    _firstName = json['first_name'];
    _lastName = json['last_name'];
    _description = json['description'];
    _addressLine1 = json['address_line_1'];
    _addressLine2 = json['address_line_2'];
    _userName = json['user_name'];
    _zipCode = json['zip_code'];
    _isApproved = json['is_approved'];
    _approvedAt = json['approved_at'];
    _isActive = json['is_active'];
    _isFeatured = json['is_featured'];
    _icon = json['icon'];
    _image = json['image'];
    _coverImage = json['cover_image'];
    _rating = json['rating'];
    _lawyerSettings = json['lawyer_settings'] != null
        ? LawyerSettings.fromJson(json['lawyer_settings'])
        : null;
    _lawyerCategoryIds = json['lawyer_category_ids'] != null
        ? json['lawyer_category_ids'].cast<num>()
        : [];
    if (json['lawyer_categories'] != null) {
      _lawyerCategories = [];
      json['lawyer_categories'].forEach((v) {
        _lawyerCategories?.add(LawyerCategories.fromJson(v));
      });
    }
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  num? _userId;
  num? _countryId;
  num? _stateId;
  num? _cityId;
  String? _name;
  String? _firstName;
  String? _lastName;
  String? _description;
  String? _addressLine1;
  String? _addressLine2;
  String? _userName;
  String? _zipCode;
  num? _isApproved;
  String? _approvedAt;
  num? _isActive;
  num? _isFeatured;
  dynamic _icon;
  String? _image;
  dynamic _coverImage;
  num? _rating;
  LawyerSettings? _lawyerSettings;
  List<num>? _lawyerCategoryIds;
  List<LawyerCategories>? _lawyerCategories;
  String? _createdAt;
  String? _updatedAt;
  Data copyWith({
    num? id,
    num? userId,
    num? countryId,
    num? stateId,
    num? cityId,
    String? name,
    String? firstName,
    String? lastName,
    String? description,
    String? addressLine1,
    String? addressLine2,
    String? userName,
    String? zipCode,
    num? isApproved,
    String? approvedAt,
    num? isActive,
    num? isFeatured,
    dynamic icon,
    String? image,
    dynamic coverImage,
    num? rating,
    LawyerSettings? lawyerSettings,
    List<num>? lawyerCategoryIds,
    List<LawyerCategories>? lawyerCategories,
    String? createdAt,
    String? updatedAt,
  }) =>
      Data(
        id: id ?? _id,
        userId: userId ?? _userId,
        countryId: countryId ?? _countryId,
        stateId: stateId ?? _stateId,
        cityId: cityId ?? _cityId,
        name: name ?? _name,
        firstName: firstName ?? _firstName,
        lastName: lastName ?? _lastName,
        description: description ?? _description,
        addressLine1: addressLine1 ?? _addressLine1,
        addressLine2: addressLine2 ?? _addressLine2,
        userName: userName ?? _userName,
        zipCode: zipCode ?? _zipCode,
        isApproved: isApproved ?? _isApproved,
        approvedAt: approvedAt ?? _approvedAt,
        isActive: isActive ?? _isActive,
        isFeatured: isFeatured ?? _isFeatured,
        icon: icon ?? _icon,
        image: image ?? _image,
        coverImage: coverImage ?? _coverImage,
        rating: rating ?? _rating,
        lawyerSettings: lawyerSettings ?? _lawyerSettings,
        lawyerCategoryIds: lawyerCategoryIds ?? _lawyerCategoryIds,
        lawyerCategories: lawyerCategories ?? _lawyerCategories,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
      );
  num? get id => _id;
  num? get userId => _userId;
  num? get countryId => _countryId;
  num? get stateId => _stateId;
  num? get cityId => _cityId;
  String? get name => _name;
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get description => _description;
  String? get addressLine1 => _addressLine1;
  String? get addressLine2 => _addressLine2;
  String? get userName => _userName;
  String? get zipCode => _zipCode;
  num? get isApproved => _isApproved;
  String? get approvedAt => _approvedAt;
  num? get isActive => _isActive;
  num? get isFeatured => _isFeatured;
  dynamic get icon => _icon;
  String? get image => _image;
  dynamic get coverImage => _coverImage;
  num? get rating => _rating;
  LawyerSettings? get lawyerSettings => _lawyerSettings;
  List<num>? get lawyerCategoryIds => _lawyerCategoryIds;
  List<LawyerCategories>? get lawyerCategories => _lawyerCategories;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['country_id'] = _countryId;
    map['state_id'] = _stateId;
    map['city_id'] = _cityId;
    map['name'] = _name;
    map['first_name'] = _firstName;
    map['last_name'] = _lastName;
    map['description'] = _description;
    map['address_line_1'] = _addressLine1;
    map['address_line_2'] = _addressLine2;
    map['user_name'] = _userName;
    map['zip_code'] = _zipCode;
    map['is_approved'] = _isApproved;
    map['approved_at'] = _approvedAt;
    map['is_active'] = _isActive;
    map['is_featured'] = _isFeatured;
    map['icon'] = _icon;
    map['image'] = _image;
    map['cover_image'] = _coverImage;
    map['rating'] = _rating;
    if (_lawyerSettings != null) {
      map['lawyer_settings'] = _lawyerSettings?.toJson();
    }
    map['lawyer_category_ids'] = _lawyerCategoryIds;
    if (_lawyerCategories != null) {
      map['lawyer_categories'] =
          _lawyerCategories?.map((v) => v.toJson()).toList();
    }
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }
}

/// id : 1
/// name : "Astrology"
/// description : null
/// slug : "astrology-1"
/// is_active : 1
/// is_featured : 0
/// icon : null
/// image : null
/// created_at : "2023-03-16T11:13:22.000000Z"
/// updated_at : "2023-03-16T11:13:22.000000Z"

LawyerCategories lawyerCategoriesFromJson(String str) =>
    LawyerCategories.fromJson(json.decode(str));
String lawyerCategoriesToJson(LawyerCategories data) =>
    json.encode(data.toJson());

class LawyerCategories {
  LawyerCategories({
    num? id,
    String? name,
    dynamic description,
    String? slug,
    num? isActive,
    num? isFeatured,
    dynamic icon,
    dynamic image,
    String? createdAt,
    String? updatedAt,
  }) {
    _id = id;
    _name = name;
    _description = description;
    _slug = slug;
    _isActive = isActive;
    _isFeatured = isFeatured;
    _icon = icon;
    _image = image;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  LawyerCategories.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _description = json['description'];
    _slug = json['slug'];
    _isActive = json['is_active'];
    _isFeatured = json['is_featured'];
    _icon = json['icon'];
    _image = json['image'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  String? _name;
  dynamic _description;
  String? _slug;
  num? _isActive;
  num? _isFeatured;
  dynamic _icon;
  dynamic _image;
  String? _createdAt;
  String? _updatedAt;
  LawyerCategories copyWith({
    num? id,
    String? name,
    dynamic description,
    String? slug,
    num? isActive,
    num? isFeatured,
    dynamic icon,
    dynamic image,
    String? createdAt,
    String? updatedAt,
  }) =>
      LawyerCategories(
        id: id ?? _id,
        name: name ?? _name,
        description: description ?? _description,
        slug: slug ?? _slug,
        isActive: isActive ?? _isActive,
        isFeatured: isFeatured ?? _isFeatured,
        icon: icon ?? _icon,
        image: image ?? _image,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
      );
  num? get id => _id;
  String? get name => _name;
  dynamic get description => _description;
  String? get slug => _slug;
  num? get isActive => _isActive;
  num? get isFeatured => _isFeatured;
  dynamic get icon => _icon;
  dynamic get image => _image;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['description'] = _description;
    map['slug'] = _slug;
    map['is_active'] = _isActive;
    map['is_featured'] = _isFeatured;
    map['icon'] = _icon;
    map['image'] = _image;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }
}

/// facebook_url : "facebook.com"
/// twitter_url : "twitter.com"
/// youtube_url : "youtube.com"
/// tiktok_url : "tiktok.com"
/// linkedin_url : "linkedin.com"
/// whatsapp_url : "whatsapp.com"
/// snapchat_url : "snapchat.com"
/// instagram_url : "instagram.com"
/// pinterest_url : "pinterest.com"
/// youtube_playlist_link : "https://www.youtube.com/embed/videoseries?list=PLmfcCDSUSykbw9ewtVgSDKazPDwoTBm8E"
/// youtube_channel_link : "https://www.youtube.com/@GeetMP3"
/// instagram_profile_link : "https://lawyer-consultation.dev.trigonotech.com"
/// instagram_access_token : "IGQVJXT1BLMzRsR3BsX3ZAFQmhKRzgwR3VwOWstbk5YWHBlOFNfeFJDUzZA6bldvZAm1BdDI2STVwUkRsVnppVzY1UUs5Xy1ENFRZATEZA6RUVSRzdneE1Fb0J3X0FNZATZAJSkZACMENQZA2pCLTduT0k4SVNLeQZDZD"
/// calendly_link : "https://calendly.com/mbilalnaeem5/test"

LawyerSettings lawyerSettingsFromJson(String str) =>
    LawyerSettings.fromJson(json.decode(str));
String lawyerSettingsToJson(LawyerSettings data) => json.encode(data.toJson());

class LawyerSettings {
  LawyerSettings({
    String? facebookUrl,
    String? twitterUrl,
    String? youtubeUrl,
    String? tiktokUrl,
    String? linkedinUrl,
    String? whatsappUrl,
    String? snapchatUrl,
    String? instagramUrl,
    String? pinterestUrl,
    String? youtubePlaylistLink,
    String? youtubeChannelLink,
    String? instagramProfileLink,
    String? instagramAccessToken,
    String? calendlyLink,
  }) {
    _facebookUrl = facebookUrl;
    _twitterUrl = twitterUrl;
    _youtubeUrl = youtubeUrl;
    _tiktokUrl = tiktokUrl;
    _linkedinUrl = linkedinUrl;
    _whatsappUrl = whatsappUrl;
    _snapchatUrl = snapchatUrl;
    _instagramUrl = instagramUrl;
    _pinterestUrl = pinterestUrl;
    _youtubePlaylistLink = youtubePlaylistLink;
    _youtubeChannelLink = youtubeChannelLink;
    _instagramProfileLink = instagramProfileLink;
    _instagramAccessToken = instagramAccessToken;
    _calendlyLink = calendlyLink;
  }

  LawyerSettings.fromJson(dynamic json) {
    _facebookUrl = json['facebook_url'];
    _twitterUrl = json['twitter_url'];
    _youtubeUrl = json['youtube_url'];
    _tiktokUrl = json['tiktok_url'];
    _linkedinUrl = json['linkedin_url'];
    _whatsappUrl = json['whatsapp_url'];
    _snapchatUrl = json['snapchat_url'];
    _instagramUrl = json['instagram_url'];
    _pinterestUrl = json['pinterest_url'];
    _youtubePlaylistLink = json['youtube_playlist_link'];
    _youtubeChannelLink = json['youtube_channel_link'];
    _instagramProfileLink = json['instagram_profile_link'];
    _instagramAccessToken = json['instagram_access_token'];
    _calendlyLink = json['calendly_link'];
  }
  String? _facebookUrl;
  String? _twitterUrl;
  String? _youtubeUrl;
  String? _tiktokUrl;
  String? _linkedinUrl;
  String? _whatsappUrl;
  String? _snapchatUrl;
  String? _instagramUrl;
  String? _pinterestUrl;
  String? _youtubePlaylistLink;
  String? _youtubeChannelLink;
  String? _instagramProfileLink;
  String? _instagramAccessToken;
  String? _calendlyLink;
  LawyerSettings copyWith({
    String? facebookUrl,
    String? twitterUrl,
    String? youtubeUrl,
    String? tiktokUrl,
    String? linkedinUrl,
    String? whatsappUrl,
    String? snapchatUrl,
    String? instagramUrl,
    String? pinterestUrl,
    String? youtubePlaylistLink,
    String? youtubeChannelLink,
    String? instagramProfileLink,
    String? instagramAccessToken,
    String? calendlyLink,
  }) =>
      LawyerSettings(
        facebookUrl: facebookUrl ?? _facebookUrl,
        twitterUrl: twitterUrl ?? _twitterUrl,
        youtubeUrl: youtubeUrl ?? _youtubeUrl,
        tiktokUrl: tiktokUrl ?? _tiktokUrl,
        linkedinUrl: linkedinUrl ?? _linkedinUrl,
        whatsappUrl: whatsappUrl ?? _whatsappUrl,
        snapchatUrl: snapchatUrl ?? _snapchatUrl,
        instagramUrl: instagramUrl ?? _instagramUrl,
        pinterestUrl: pinterestUrl ?? _pinterestUrl,
        youtubePlaylistLink: youtubePlaylistLink ?? _youtubePlaylistLink,
        youtubeChannelLink: youtubeChannelLink ?? _youtubeChannelLink,
        instagramProfileLink: instagramProfileLink ?? _instagramProfileLink,
        instagramAccessToken: instagramAccessToken ?? _instagramAccessToken,
        calendlyLink: calendlyLink ?? _calendlyLink,
      );
  String? get facebookUrl => _facebookUrl;
  String? get twitterUrl => _twitterUrl;
  String? get youtubeUrl => _youtubeUrl;
  String? get tiktokUrl => _tiktokUrl;
  String? get linkedinUrl => _linkedinUrl;
  String? get whatsappUrl => _whatsappUrl;
  String? get snapchatUrl => _snapchatUrl;
  String? get instagramUrl => _instagramUrl;
  String? get pinterestUrl => _pinterestUrl;
  String? get youtubePlaylistLink => _youtubePlaylistLink;
  String? get youtubeChannelLink => _youtubeChannelLink;
  String? get instagramProfileLink => _instagramProfileLink;
  String? get instagramAccessToken => _instagramAccessToken;
  String? get calendlyLink => _calendlyLink;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['facebook_url'] = _facebookUrl;
    map['twitter_url'] = _twitterUrl;
    map['youtube_url'] = _youtubeUrl;
    map['tiktok_url'] = _tiktokUrl;
    map['linkedin_url'] = _linkedinUrl;
    map['whatsapp_url'] = _whatsappUrl;
    map['snapchat_url'] = _snapchatUrl;
    map['instagram_url'] = _instagramUrl;
    map['pinterest_url'] = _pinterestUrl;
    map['youtube_playlist_link'] = _youtubePlaylistLink;
    map['youtube_channel_link'] = _youtubeChannelLink;
    map['instagram_profile_link'] = _instagramProfileLink;
    map['instagram_access_token'] = _instagramAccessToken;
    map['calendly_link'] = _calendlyLink;
    return map;
  }
}

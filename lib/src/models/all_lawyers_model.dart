import 'dart:convert';

GetAllLawyersModel allLawyersModelFromJson(String str) =>
    GetAllLawyersModel.fromJson(json.decode(str));
String allLawyersModelToJson(GetAllLawyersModel data) =>
    json.encode(data.toJson());

class GetAllLawyersModel {
  GetAllLawyersModel({
    GetAllLawyersDataModel? data,
    bool? success,
    String? message,
    dynamic errors,
  }) {
    _data = data;
    _success = success;
    _message = message;
    _errors = errors;
  }

  GetAllLawyersModel.fromJson(dynamic json) {
    _data = json['data'] != null
        ? GetAllLawyersDataModel.fromJson(json['data'])
        : null;
    _success = json['success'];
    _message = json['message'];
    _errors = json['errors'];
  }
  GetAllLawyersDataModel? _data;
  bool? _success;
  String? _message;
  dynamic _errors;
  GetAllLawyersModel copyWith({
    GetAllLawyersDataModel? data,
    bool? success,
    String? message,
    dynamic errors,
  }) =>
      GetAllLawyersModel(
        data: data ?? _data,
        success: success ?? _success,
        message: message ?? _message,
        errors: errors ?? _errors,
      );
  GetAllLawyersDataModel? get data => _data;
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

GetAllLawyersDataModel data1FromJson(String str) =>
    GetAllLawyersDataModel.fromJson(json.decode(str));
String data1ToJson(GetAllLawyersDataModel data) => json.encode(data.toJson());

class GetAllLawyersDataModel {
  GetAllLawyersDataModel({
    List<LawyerModel>? data,
    Links? links,
    Meta? meta,
  }) {
    _data = data;
    _links = links;
    _meta = meta;
  }

  GetAllLawyersDataModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(LawyerModel.fromJson(v));
      });
    }
    _links = json['links'] != null ? Links.fromJson(json['links']) : null;
    _meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }
  List<LawyerModel>? _data;
  Links? _links;
  Meta? _meta;
  GetAllLawyersDataModel copyWith({
    List<LawyerModel>? data,
    Links? links,
    Meta? meta,
  }) =>
      GetAllLawyersDataModel(
        data: data ?? _data,
        links: links ?? _links,
        meta: meta ?? _meta,
      );
  List<LawyerModel>? get data => _data;
  Links? get links => _links;
  Meta? get meta => _meta;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    if (_links != null) {
      map['links'] = _links?.toJson();
    }
    if (_meta != null) {
      map['meta'] = _meta?.toJson();
    }
    return map;
  }
}

Meta metaFromJson(String str) => Meta.fromJson(json.decode(str));
String metaToJson(Meta data) => json.encode(data.toJson());

class Meta {
  Meta({
    int? currentPage,
    int? from,
    int? lastPage,
    List<Links>? links,
    String? path,
    int? perPage,
    int? to,
    int? total,
  }) {
    _currentPage = currentPage;
    _from = from;
    _lastPage = lastPage;
    _links = links;
    _path = path;
    _perPage = perPage;
    _to = to;
    _total = total;
  }

  Meta.fromJson(dynamic json) {
    _currentPage = json['current_page'];
    _from = json['from'];
    _lastPage = json['last_page'];
    if (json['links'] != null) {
      _links = [];
      json['links'].forEach((v) {
        _links?.add(Links.fromJson(v));
      });
    }
    _path = json['path'];
    _perPage = json['per_page'];
    _to = json['to'];
    _total = json['total'];
  }
  int? _currentPage;
  int? _from;
  int? _lastPage;
  List<Links>? _links;
  String? _path;
  int? _perPage;
  int? _to;
  int? _total;
  Meta copyWith({
    int? currentPage,
    int? from,
    int? lastPage,
    List<Links>? links,
    String? path,
    int? perPage,
    int? to,
    int? total,
  }) =>
      Meta(
        currentPage: currentPage ?? _currentPage,
        from: from ?? _from,
        lastPage: lastPage ?? _lastPage,
        links: links ?? _links,
        path: path ?? _path,
        perPage: perPage ?? _perPage,
        to: to ?? _to,
        total: total ?? _total,
      );
  int? get currentPage => _currentPage;
  int? get from => _from;
  int? get lastPage => _lastPage;
  List<Links>? get links => _links;
  String? get path => _path;
  int? get perPage => _perPage;
  int? get to => _to;
  int? get total => _total;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['current_page'] = _currentPage;
    map['from'] = _from;
    map['last_page'] = _lastPage;
    if (_links != null) {
      map['links'] = _links?.map((v) => v.toJson()).toList();
    }
    map['path'] = _path;
    map['per_page'] = _perPage;
    map['to'] = _to;
    map['total'] = _total;
    return map;
  }
}

Links linksFromJson(String str) => Links.fromJson(json.decode(str));
String linksToJson(Links data) => json.encode(data.toJson());

class Links {
  Links({
    dynamic url,
    String? label,
    bool? active,
  }) {
    _url = url;
    _label = label;
    _active = active;
  }

  Links.fromJson(dynamic json) {
    _url = json['url'];
    _label = json['label'];
    _active = json['active'];
  }
  dynamic _url;
  String? _label;
  bool? _active;
  Links copyWith({
    dynamic url,
    String? label,
    bool? active,
  }) =>
      Links(
        url: url ?? _url,
        label: label ?? _label,
        active: active ?? _active,
      );
  dynamic get url => _url;
  String? get label => _label;
  bool? get active => _active;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['url'] = _url;
    map['label'] = _label;
    map['active'] = _active;
    return map;
  }
}

LawyerModel dataFromJson(String str) => LawyerModel.fromJson(json.decode(str));
String dataToJson(LawyerModel data) => json.encode(data.toJson());

class LawyerModel {
  LawyerModel({
    int? id,
    int? userId,
    int? countryId,
    int? stateId,
    int? cityId,
    String? name,
    String? firstName,
    String? lastName,
    String? description,
    String? addressLine1,
    String? addressLine2,
    String? userName,
    String? zipCode,
    int? isApproved,
    String? approvedAt,
    int? isActive,
    int? isOnline,
    int? isFeatured,
    dynamic icon,
    String? image,
    dynamic coverImage,
    num? rating,
    LawyerSettings? lawyerSettings,
    List<int>? lawyerCategoryIds,
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
    _isOnline = isOnline;
    _isFeatured = isFeatured;
    _icon = icon;
    _image = image;
    _coverImage = coverImage;
    _rating = rating;
    // _lawyerSettings = lawyerSettings;
    _lawyerCategoryIds = lawyerCategoryIds;
    _lawyerCategories = lawyerCategories;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  LawyerModel.fromJson(dynamic json) {
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
    _isOnline = json['is_online'];
    _isFeatured = json['is_featured'];
    _icon = json['icon'];
    _image = json['image'];
    _coverImage = json['cover_image'];
    _rating = json['rating'];
    // _lawyerSettings = json['lawyer_settings'] != null
    //     ? LawyerSettings.fromJson(json['lawyer_settings'])
    //     : null;
    _lawyerCategoryIds = json['lawyer_category_ids'] != null
        ? json['lawyer_category_ids'].cast<int>()
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
  int? _id;
  int? _userId;
  int? _countryId;
  int? _stateId;
  int? _cityId;
  String? _name;
  String? _firstName;
  String? _lastName;
  String? _description;
  String? _addressLine1;
  String? _addressLine2;
  String? _userName;
  String? _zipCode;
  int? _isApproved;
  String? _approvedAt;
  int? _isActive;
  int? _isOnline;
  int? _isFeatured;
  dynamic _icon;
  String? _image;
  dynamic _coverImage;
  num? _rating;
  LawyerSettings? _lawyerSettings;
  List<int>? _lawyerCategoryIds;
  List<LawyerCategories>? _lawyerCategories;
  String? _createdAt;
  String? _updatedAt;
  LawyerModel copyWith({
    int? id,
    int? userId,
    int? countryId,
    int? stateId,
    int? cityId,
    String? name,
    String? firstName,
    String? lastName,
    String? description,
    String? addressLine1,
    String? addressLine2,
    String? userName,
    String? zipCode,
    int? isApproved,
    String? approvedAt,
    int? isActive,
    int? isOnline,
    int? isFeatured,
    dynamic icon,
    String? image,
    dynamic coverImage,
    num? rating,
    LawyerSettings? lawyerSettings,
    List<int>? lawyerCategoryIds,
    List<LawyerCategories>? lawyerCategories,
    String? createdAt,
    String? updatedAt,
  }) =>
      LawyerModel(
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
        isOnline: isOnline ?? _isOnline,
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
  int? get id => _id;
  int? get userId => _userId;
  int? get countryId => _countryId;
  int? get stateId => _stateId;
  int? get cityId => _cityId;
  String? get name => _name;
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get description => _description;
  String? get addressLine1 => _addressLine1;
  String? get addressLine2 => _addressLine2;
  String? get userName => _userName;
  String? get zipCode => _zipCode;
  int? get isApproved => _isApproved;
  String? get approvedAt => _approvedAt;
  int? get isActive => _isActive;
  int? get isOnline => _isOnline;
  int? get isFeatured => _isFeatured;
  dynamic get icon => _icon;
  String? get image => _image;
  dynamic get coverImage => _coverImage;
  num? get rating => _rating;
  LawyerSettings? get lawyerSettings => _lawyerSettings;
  List<int>? get lawyerCategoryIds => _lawyerCategoryIds;
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
    map['is_online'] = _isOnline;
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

LawyerCategories lawyerCategoriesFromJson(String str) =>
    LawyerCategories.fromJson(json.decode(str));
String lawyerCategoriesToJson(LawyerCategories data) =>
    json.encode(data.toJson());

class LawyerCategories {
  LawyerCategories({
    int? id,
    String? name,
    dynamic description,
    String? slug,
    int? isActive,
    int? isFeatured,
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
  int? _id;
  String? _name;
  dynamic _description;
  String? _slug;
  int? _isActive;
  int? _isFeatured;
  dynamic _icon;
  dynamic _image;
  String? _createdAt;
  String? _updatedAt;
  LawyerCategories copyWith({
    int? id,
    String? name,
    dynamic description,
    String? slug,
    int? isActive,
    int? isFeatured,
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
  int? get id => _id;
  String? get name => _name;
  dynamic get description => _description;
  String? get slug => _slug;
  int? get isActive => _isActive;
  int? get isFeatured => _isFeatured;
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

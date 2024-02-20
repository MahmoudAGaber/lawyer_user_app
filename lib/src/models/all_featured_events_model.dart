import 'dart:convert';

/// data : [{"id":8,"lawyer_id":2,"lawyer_name":"Jack Daneal","law_firm_id":null,"law_firm_name":"","tag_ids":[1],"tags":[{"id":1,"name":"Healing with Meditation","description":null,"slug":"healing-with-meditation-1","is_active":1,"is_featured":0,"icon":null,"image":null,"created_at":"2023-02-04T18:10:57.000000Z","updated_at":"2023-02-04T18:10:57.000000Z"}],"name":"Tc Event 02","description":"lorem ipsum","slug":"tc-event-02-8","is_active":1,"is_featured":0,"starts_at":"2024-01-31T15:14:00.000000Z","ends_at":"2024-02-29T15:14:00.000000Z","sponsor":"Tc Sponsor 2","icon":null,"address_line_1":"lorem ipsum","address_line_2":"lorem ipsum","image":"/images/lawyer_events/642f0512af512.png","created_at":"2023-02-23","updated_at":"2023-04-06T14:44:50.000000Z"}]
/// success : true
/// message : "Featured Events Fetched Successfully"
/// errors : null

GetAllFeaturedEventsModel getAllFeaturedEventsFromJson(String str) =>
    GetAllFeaturedEventsModel.fromJson(json.decode(str));
String getAllFeaturedEventsToJson(GetAllFeaturedEventsModel data) =>
    json.encode(data.toJson());

class GetAllFeaturedEventsModel {
  GetAllFeaturedEventsModel({
    List<Data>? data,
    bool? success,
    String? message,
    dynamic errors,
  }) {
    _data = data;
    _success = success;
    _message = message;
    _errors = errors;
  }

  GetAllFeaturedEventsModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
    _success = json['success'];
    _message = json['message'];
    _errors = json['errors'];
  }
  List<Data>? _data;
  bool? _success;
  String? _message;
  dynamic _errors;
  GetAllFeaturedEventsModel copyWith({
    List<Data>? data,
    bool? success,
    String? message,
    dynamic errors,
  }) =>
      GetAllFeaturedEventsModel(
        data: data ?? _data,
        success: success ?? _success,
        message: message ?? _message,
        errors: errors ?? _errors,
      );
  List<Data>? get data => _data;
  bool? get success => _success;
  String? get message => _message;
  dynamic get errors => _errors;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    map['success'] = _success;
    map['message'] = _message;
    map['errors'] = _errors;
    return map;
  }
}

/// id : 8
/// lawyer_id : 2
/// lawyer_name : "Jack Daneal"
/// law_firm_id : null
/// law_firm_name : ""
/// tag_ids : [1]
/// tags : [{"id":1,"name":"Healing with Meditation","description":null,"slug":"healing-with-meditation-1","is_active":1,"is_featured":0,"icon":null,"image":null,"created_at":"2023-02-04T18:10:57.000000Z","updated_at":"2023-02-04T18:10:57.000000Z"}]
/// name : "Tc Event 02"
/// description : "lorem ipsum"
/// slug : "tc-event-02-8"
/// is_active : 1
/// is_featured : 0
/// starts_at : "2024-01-31T15:14:00.000000Z"
/// ends_at : "2024-02-29T15:14:00.000000Z"
/// sponsor : "Tc Sponsor 2"
/// icon : null
/// address_line_1 : "lorem ipsum"
/// address_line_2 : "lorem ipsum"
/// image : "/images/lawyer_events/642f0512af512.png"
/// created_at : "2023-02-23"
/// updated_at : "2023-04-06T14:44:50.000000Z"

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());

class Data {
  Data({
    num? id,
    num? lawyerId,
    String? lawyerName,
    dynamic lawFirmId,
    String? lawFirmName,
    List<num>? tagIds,
    List<Tags>? tags,
    String? name,
    String? description,
    String? slug,
    num? isActive,
    num? isFeatured,
    String? startsAt,
    String? endsAt,
    String? sponsor,
    dynamic icon,
    String? addressLine1,
    String? addressLine2,
    String? image,
    String? createdAt,
    String? updatedAt,
  }) {
    _id = id;
    _lawyerId = lawyerId;
    _lawyerName = lawyerName;
    _lawFirmId = lawFirmId;
    _lawFirmName = lawFirmName;
    _tagIds = tagIds;
    _tags = tags;
    _name = name;
    _description = description;
    _slug = slug;
    _isActive = isActive;
    _isFeatured = isFeatured;
    _startsAt = startsAt;
    _endsAt = endsAt;
    _sponsor = sponsor;
    _icon = icon;
    _addressLine1 = addressLine1;
    _addressLine2 = addressLine2;
    _image = image;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _lawyerId = json['lawyer_id'];
    _lawyerName = json['lawyer_name'];
    _lawFirmId = json['law_firm_id'];
    _lawFirmName = json['law_firm_name'];
    _tagIds = json['tag_ids'] != null ? json['tag_ids'].cast<num>() : [];
    if (json['tags'] != null) {
      _tags = [];
      json['tags'].forEach((v) {
        _tags?.add(Tags.fromJson(v));
      });
    }
    _name = json['name'];
    _description = json['description'];
    _slug = json['slug'];
    _isActive = json['is_active'];
    _isFeatured = json['is_featured'];
    _startsAt = json['starts_at'];
    _endsAt = json['ends_at'];
    _sponsor = json['sponsor'];
    _icon = json['icon'];
    _addressLine1 = json['address_line_1'];
    _addressLine2 = json['address_line_2'];
    _image = json['image'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  num? _lawyerId;
  String? _lawyerName;
  dynamic _lawFirmId;
  String? _lawFirmName;
  List<num>? _tagIds;
  List<Tags>? _tags;
  String? _name;
  String? _description;
  String? _slug;
  num? _isActive;
  num? _isFeatured;
  String? _startsAt;
  String? _endsAt;
  String? _sponsor;
  dynamic _icon;
  String? _addressLine1;
  String? _addressLine2;
  String? _image;
  String? _createdAt;
  String? _updatedAt;
  Data copyWith({
    num? id,
    num? lawyerId,
    String? lawyerName,
    dynamic lawFirmId,
    String? lawFirmName,
    List<num>? tagIds,
    List<Tags>? tags,
    String? name,
    String? description,
    String? slug,
    num? isActive,
    num? isFeatured,
    String? startsAt,
    String? endsAt,
    String? sponsor,
    dynamic icon,
    String? addressLine1,
    String? addressLine2,
    String? image,
    String? createdAt,
    String? updatedAt,
  }) =>
      Data(
        id: id ?? _id,
        lawyerId: lawyerId ?? _lawyerId,
        lawyerName: lawyerName ?? _lawyerName,
        lawFirmId: lawFirmId ?? _lawFirmId,
        lawFirmName: lawFirmName ?? _lawFirmName,
        tagIds: tagIds ?? _tagIds,
        tags: tags ?? _tags,
        name: name ?? _name,
        description: description ?? _description,
        slug: slug ?? _slug,
        isActive: isActive ?? _isActive,
        isFeatured: isFeatured ?? _isFeatured,
        startsAt: startsAt ?? _startsAt,
        endsAt: endsAt ?? _endsAt,
        sponsor: sponsor ?? _sponsor,
        icon: icon ?? _icon,
        addressLine1: addressLine1 ?? _addressLine1,
        addressLine2: addressLine2 ?? _addressLine2,
        image: image ?? _image,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
      );
  num? get id => _id;
  num? get lawyerId => _lawyerId;
  String? get lawyerName => _lawyerName;
  dynamic get lawFirmId => _lawFirmId;
  String? get lawFirmName => _lawFirmName;
  List<num>? get tagIds => _tagIds;
  List<Tags>? get tags => _tags;
  String? get name => _name;
  String? get description => _description;
  String? get slug => _slug;
  num? get isActive => _isActive;
  num? get isFeatured => _isFeatured;
  String? get startsAt => _startsAt;
  String? get endsAt => _endsAt;
  String? get sponsor => _sponsor;
  dynamic get icon => _icon;
  String? get addressLine1 => _addressLine1;
  String? get addressLine2 => _addressLine2;
  String? get image => _image;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['lawyer_id'] = _lawyerId;
    map['lawyer_name'] = _lawyerName;
    map['law_firm_id'] = _lawFirmId;
    map['law_firm_name'] = _lawFirmName;
    map['tag_ids'] = _tagIds;
    if (_tags != null) {
      map['tags'] = _tags?.map((v) => v.toJson()).toList();
    }
    map['name'] = _name;
    map['description'] = _description;
    map['slug'] = _slug;
    map['is_active'] = _isActive;
    map['is_featured'] = _isFeatured;
    map['starts_at'] = _startsAt;
    map['ends_at'] = _endsAt;
    map['sponsor'] = _sponsor;
    map['icon'] = _icon;
    map['address_line_1'] = _addressLine1;
    map['address_line_2'] = _addressLine2;
    map['image'] = _image;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }
}

/// id : 1
/// name : "Healing with Meditation"
/// description : null
/// slug : "healing-with-meditation-1"
/// is_active : 1
/// is_featured : 0
/// icon : null
/// image : null
/// created_at : "2023-02-04T18:10:57.000000Z"
/// updated_at : "2023-02-04T18:10:57.000000Z"

Tags tagsFromJson(String str) => Tags.fromJson(json.decode(str));
String tagsToJson(Tags data) => json.encode(data.toJson());

class Tags {
  Tags({
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

  Tags.fromJson(dynamic json) {
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
  Tags copyWith({
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
      Tags(
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

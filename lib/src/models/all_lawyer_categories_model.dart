import 'dart:convert';

/// data : [{"id":1,"name":"Astrology","description":null,"slug":"astrology-1","is_active":1,"is_featured":0,"icon":null,"image":null,"created_at":"2023-03-16T11:13:22.000000Z","updated_at":"2023-03-16T11:13:22.000000Z"}]
/// success : true
/// message : "Lawyer Categories Fetched Successfully"
/// errors : null

GetAllLawyerCategoriesModel getAllLawyerCategoriesFromJson(String str) =>
    GetAllLawyerCategoriesModel.fromJson(json.decode(str));
String getAllLawyerCategoriesToJson(GetAllLawyerCategoriesModel data) =>
    json.encode(data.toJson());

class GetAllLawyerCategoriesModel {
  GetAllLawyerCategoriesModel({
    List<GetAllLawyerCategoriesDataModel>? data,
    bool? success,
    String? message,
    dynamic errors,
  }) {
    _data = data;
    _success = success;
    _message = message;
    _errors = errors;
  }

  GetAllLawyerCategoriesModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(GetAllLawyerCategoriesDataModel.fromJson(v));
      });
    }

    _success = json['success'];
    _message = json['message'];
    _errors = json['errors'];
  }
  List<GetAllLawyerCategoriesDataModel>? _data;
  bool? _success;
  String? _message;
  dynamic _errors;
  GetAllLawyerCategoriesModel copyWith({
    List<GetAllLawyerCategoriesDataModel>? data,
    bool? success,
    String? message,
    dynamic errors,
  }) =>
      GetAllLawyerCategoriesModel(
        data: data ?? _data,
        success: success ?? _success,
        message: message ?? _message,
        errors: errors ?? _errors,
      );
  List<GetAllLawyerCategoriesDataModel>? get data => _data;
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

GetAllLawyerCategoriesDataModel dataFromJson(String str) =>
    GetAllLawyerCategoriesDataModel.fromJson(json.decode(str));
String dataToJson(GetAllLawyerCategoriesDataModel data) =>
    json.encode(data.toJson());

class GetAllLawyerCategoriesDataModel {
  GetAllLawyerCategoriesDataModel({
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

  GetAllLawyerCategoriesDataModel.fromJson(dynamic json) {
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
  GetAllLawyerCategoriesDataModel copyWith({
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
      GetAllLawyerCategoriesDataModel(
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

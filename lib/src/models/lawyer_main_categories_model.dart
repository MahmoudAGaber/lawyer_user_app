import 'dart:convert';

GetLawyerMainCategoriesModel getLawyerMainCategoriesModelFromJson(String str) =>
    GetLawyerMainCategoriesModel.fromJson(json.decode(str));
String getLawyerMainCategoriesModelToJson(GetLawyerMainCategoriesModel data) =>
    json.encode(data.toJson());

class GetLawyerMainCategoriesModel {
  GetLawyerMainCategoriesModel({
    List<GetLawyerMainCategoriesDataModel>? data,
    bool? success,
    String? message,
    dynamic errors,
  }) {
    _data = data;
    _success = success;
    _message = message;
    _errors = errors;
  }

  GetLawyerMainCategoriesModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(GetLawyerMainCategoriesDataModel.fromJson(v));
      });
    }
    _success = json['success'];
    _message = json['message'];
    _errors = json['errors'];
  }
  List<GetLawyerMainCategoriesDataModel>? _data;
  bool? _success;
  String? _message;
  dynamic _errors;
  GetLawyerMainCategoriesModel copyWith({
    List<GetLawyerMainCategoriesDataModel>? data,
    bool? success,
    String? message,
    dynamic errors,
  }) =>
      GetLawyerMainCategoriesModel(
        data: data ?? _data,
        success: success ?? _success,
        message: message ?? _message,
        errors: errors ?? _errors,
      );
  List<GetLawyerMainCategoriesDataModel>? get data => _data;
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

GetLawyerMainCategoriesDataModel dataFromJson(String str) =>
    GetLawyerMainCategoriesDataModel.fromJson(json.decode(str));
String dataToJson(GetLawyerMainCategoriesDataModel data) =>
    json.encode(data.toJson());

class GetLawyerMainCategoriesDataModel {
  GetLawyerMainCategoriesDataModel({
    num? id,
    String? name,
    dynamic description,
    dynamic slug,
    num? isActive,
    num? isFeatured,
    dynamic icon,
    dynamic image,
    List<Categories>? categories,
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
    _categories = categories;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  GetLawyerMainCategoriesDataModel.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _description = json['description'];
    _slug = json['slug'];
    _isActive = json['is_active'];
    _isFeatured = json['is_featured'];
    _icon = json['icon'];
    _image = json['image'];
    if (json['categories'] != null) {
      _categories = [];
      json['categories'].forEach((v) {
        _categories?.add(Categories.fromJson(v));
      });
    }
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  String? _name;
  dynamic _description;
  dynamic _slug;
  num? _isActive;
  num? _isFeatured;
  dynamic _icon;
  dynamic _image;
  List<Categories>? _categories;
  String? _createdAt;
  String? _updatedAt;
  GetLawyerMainCategoriesDataModel copyWith({
    num? id,
    String? name,
    dynamic description,
    dynamic slug,
    num? isActive,
    num? isFeatured,
    dynamic icon,
    dynamic image,
    List<Categories>? categories,
    String? createdAt,
    String? updatedAt,
  }) =>
      GetLawyerMainCategoriesDataModel(
        id: id ?? _id,
        name: name ?? _name,
        description: description ?? _description,
        slug: slug ?? _slug,
        isActive: isActive ?? _isActive,
        isFeatured: isFeatured ?? _isFeatured,
        icon: icon ?? _icon,
        image: image ?? _image,
        categories: categories ?? _categories,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
      );
  num? get id => _id;
  String? get name => _name;
  dynamic get description => _description;
  dynamic get slug => _slug;
  num? get isActive => _isActive;
  num? get isFeatured => _isFeatured;
  dynamic get icon => _icon;
  dynamic get image => _image;
  List<Categories>? get categories => _categories;
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
    if (_categories != null) {
      map['categories'] = _categories?.map((v) => v.toJson()).toList();
    }
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }
}

Categories categoriesFromJson(String str) =>
    Categories.fromJson(json.decode(str));
String categoriesToJson(Categories data) => json.encode(data.toJson());

class Categories {
  Categories({
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

  Categories.fromJson(dynamic json) {
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
  Categories copyWith({
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
      Categories(
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

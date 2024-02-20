import 'dart:convert';

import 'all_lawyers_model.dart';

GetAllLawFirmsModel getAllLawFirmsModelFromJson(String str) =>
    GetAllLawFirmsModel.fromJson(json.decode(str));
String getAllLawFirmsModelToJson(GetAllLawFirmsModel data) =>
    json.encode(data.toJson());

class GetAllLawFirmsModel {
  GetAllLawFirmsModel({
    GetAllLawFirmsDataModel? data,
    bool? success,
    String? message,
    dynamic errors,
  }) {
    _data = data;
    _success = success;
    _message = message;
    _errors = errors;
  }

  GetAllLawFirmsModel.fromJson(dynamic json) {
    _data = json['data'] != null
        ? GetAllLawFirmsDataModel.fromJson(json['data'])
        : null;
    _success = json['success'];
    _message = json['message'];
    _errors = json['errors'];
  }
  GetAllLawFirmsDataModel? _data;
  bool? _success;
  String? _message;
  dynamic _errors;
  GetAllLawFirmsModel copyWith({
    GetAllLawFirmsDataModel? data,
    bool? success,
    String? message,
    dynamic errors,
  }) =>
      GetAllLawFirmsModel(
        data: data ?? _data,
        success: success ?? _success,
        message: message ?? _message,
        errors: errors ?? _errors,
      );
  GetAllLawFirmsDataModel? get data => _data;
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

GetAllLawFirmsDataModel dataFromJson(String str) =>
    GetAllLawFirmsDataModel.fromJson(json.decode(str));
String dataToJson(GetAllLawFirmsDataModel data) => json.encode(data.toJson());

class GetAllLawFirmsDataModel {
  GetAllLawFirmsDataModel({
    List<LawFirmModel>? data,
    Links? links,
    Meta? meta,
  }) {
    _data = data;
    _links = links;
    _meta = meta;
  }

  GetAllLawFirmsDataModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(LawFirmModel.fromJson(v));
      });
    }
    _links = json['links'] != null ? Links.fromJson(json['links']) : null;
    _meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }
  List<LawFirmModel>? _data;
  Links? _links;
  Meta? _meta;
  GetAllLawFirmsDataModel copyWith({
    List<LawFirmModel>? data,
    Links? links,
    Meta? meta,
  }) =>
      GetAllLawFirmsDataModel(
        data: data ?? _data,
        links: links ?? _links,
        meta: meta ?? _meta,
      );
  List<LawFirmModel>? get data => _data;
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
    num? currentPage,
    num? from,
    num? lastPage,
    List<Links>? links,
    String? path,
    num? perPage,
    num? to,
    num? total,
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
  num? _currentPage;
  num? _from;
  num? _lastPage;
  List<Links>? _links;
  String? _path;
  num? _perPage;
  num? _to;
  num? _total;
  Meta copyWith({
    num? currentPage,
    num? from,
    num? lastPage,
    List<Links>? links,
    String? path,
    num? perPage,
    num? to,
    num? total,
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
  num? get currentPage => _currentPage;
  num? get from => _from;
  num? get lastPage => _lastPage;
  List<Links>? get links => _links;
  String? get path => _path;
  num? get perPage => _perPage;
  num? get to => _to;
  num? get total => _total;

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

LawFirmModel lawFirmModelFromJson(String str) =>
    LawFirmModel.fromJson(json.decode(str));
String lawFirmModelToJson(LawFirmModel data) => json.encode(data.toJson());

class LawFirmModel {
  LawFirmModel({
    num? id,
    num? userId,
    dynamic countryId,
    dynamic stateId,
    dynamic cityId,
    String? name,
    String? firstName,
    String? lastName,
    dynamic lawFirmName,
    dynamic lawFirmWebsite,
    String? description,
    dynamic addressLine1,
    dynamic addressLine2,
    String? userName,
    dynamic zipCode,
    num? isApproved,
    String? approvedAt,
    num? isActive,
    num? isFeatured,
    dynamic icon,
    String? image,
    dynamic coverImage,
    num? rating,
    num? bookedAppointments,
    List<dynamic>? lawFirmModules,
    dynamic lawFirmSettings,
    List<num>? lawFirmCategoryIds,
    List<LawyerModel>? lawFirmLawyers,
    List<LawFirmCategories>? lawFirmCategories,
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
    _lawFirmName = lawFirmName;
    _lawFirmWebsite = lawFirmWebsite;
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
    _bookedAppointments = bookedAppointments;
    _lawFirmModules = lawFirmModules;
    _lawFirmSettings = lawFirmSettings;
    _lawFirmCategoryIds = lawFirmCategoryIds;
    _lawFirmLawyers = lawFirmLawyers;
    _lawFirmCategories = lawFirmCategories;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  LawFirmModel.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _countryId = json['country_id'];
    _stateId = json['state_id'];
    _cityId = json['city_id'];
    _name = json['name'];
    _firstName = json['first_name'];
    _lastName = json['last_name'];
    _lawFirmName = json['law_firm_name'];
    _lawFirmWebsite = json['law_firm_website'];
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
    _bookedAppointments = json['booked_appointments'];
    if (json['law_firm_modules'] != null) {
      _lawFirmModules = [];
      json['law_firm_modules'].forEach((v) {
        // _lawFirmModules?.add(Dynamic.fromJson(v));
      });
    }
    _lawFirmSettings = json['law_firm_settings'];
    _lawFirmCategoryIds = json['law_firm_category_ids'] != null
        ? json['law_firm_category_ids'].cast<num>()
        : [];
    if (json['law_firm_lawyers'] != null) {
      _lawFirmLawyers = [];
      json['law_firm_lawyers'].forEach((v) {
        _lawFirmLawyers?.add(LawyerModel.fromJson(v));
      });
    }
    if (json['law_firm_categories'] != null) {
      _lawFirmCategories = [];
      json['law_firm_categories'].forEach((v) {
        _lawFirmCategories?.add(LawFirmCategories.fromJson(v));
      });
    }
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  num? _userId;
  dynamic _countryId;
  dynamic _stateId;
  dynamic _cityId;
  String? _name;
  String? _firstName;
  String? _lastName;
  dynamic _lawFirmName;
  dynamic _lawFirmWebsite;
  String? _description;
  dynamic _addressLine1;
  dynamic _addressLine2;
  String? _userName;
  dynamic _zipCode;
  num? _isApproved;
  String? _approvedAt;
  num? _isActive;
  num? _isFeatured;
  dynamic _icon;
  String? _image;
  dynamic _coverImage;
  num? _rating;
  num? _bookedAppointments;
  List<dynamic>? _lawFirmModules;
  dynamic _lawFirmSettings;
  List<num>? _lawFirmCategoryIds;
  List<LawyerModel>? _lawFirmLawyers;
  List<LawFirmCategories>? _lawFirmCategories;
  String? _createdAt;
  String? _updatedAt;
  LawFirmModel copyWith({
    num? id,
    num? userId,
    dynamic countryId,
    dynamic stateId,
    dynamic cityId,
    String? name,
    String? firstName,
    String? lastName,
    dynamic lawFirmName,
    dynamic lawFirmWebsite,
    String? description,
    dynamic addressLine1,
    dynamic addressLine2,
    String? userName,
    dynamic zipCode,
    num? isApproved,
    String? approvedAt,
    num? isActive,
    num? isFeatured,
    dynamic icon,
    String? image,
    dynamic coverImage,
    num? rating,
    num? bookedAppointments,
    List<dynamic>? lawFirmModules,
    dynamic lawFirmSettings,
    List<num>? lawFirmCategoryIds,
    List<LawyerModel>? lawFirmLawyers,
    List<LawFirmCategories>? lawFirmCategories,
    String? createdAt,
    String? updatedAt,
  }) =>
      LawFirmModel(
        id: id ?? _id,
        userId: userId ?? _userId,
        countryId: countryId ?? _countryId,
        stateId: stateId ?? _stateId,
        cityId: cityId ?? _cityId,
        name: name ?? _name,
        firstName: firstName ?? _firstName,
        lastName: lastName ?? _lastName,
        lawFirmName: lawFirmName ?? _lawFirmName,
        lawFirmWebsite: lawFirmWebsite ?? _lawFirmWebsite,
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
        bookedAppointments: bookedAppointments ?? _bookedAppointments,
        lawFirmModules: lawFirmModules ?? _lawFirmModules,
        lawFirmSettings: lawFirmSettings ?? _lawFirmSettings,
        lawFirmCategoryIds: lawFirmCategoryIds ?? _lawFirmCategoryIds,
        lawFirmLawyers: lawFirmLawyers ?? _lawFirmLawyers,
        lawFirmCategories: lawFirmCategories ?? _lawFirmCategories,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
      );
  num? get id => _id;
  num? get userId => _userId;
  dynamic get countryId => _countryId;
  dynamic get stateId => _stateId;
  dynamic get cityId => _cityId;
  String? get name => _name;
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  dynamic get lawFirmName => _lawFirmName;
  dynamic get lawFirmWebsite => _lawFirmWebsite;
  String? get description => _description;
  dynamic get addressLine1 => _addressLine1;
  dynamic get addressLine2 => _addressLine2;
  String? get userName => _userName;
  dynamic get zipCode => _zipCode;
  num? get isApproved => _isApproved;
  String? get approvedAt => _approvedAt;
  num? get isActive => _isActive;
  num? get isFeatured => _isFeatured;
  dynamic get icon => _icon;
  String? get image => _image;
  dynamic get coverImage => _coverImage;
  num? get rating => _rating;
  num? get bookedAppointments => _bookedAppointments;
  List<dynamic>? get lawFirmModules => _lawFirmModules;
  dynamic get lawFirmSettings => _lawFirmSettings;
  List<num>? get lawFirmCategoryIds => _lawFirmCategoryIds;
  List<LawyerModel>? get lawFirmLawyers => _lawFirmLawyers;
  List<LawFirmCategories>? get lawFirmCategories => _lawFirmCategories;
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
    map['law_firm_name'] = _lawFirmName;
    map['law_firm_website'] = _lawFirmWebsite;
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
    map['booked_appointments'] = _bookedAppointments;
    if (_lawFirmModules != null) {
      map['law_firm_modules'] =
          _lawFirmModules?.map((v) => v.toJson()).toList();
    }
    map['law_firm_settings'] = _lawFirmSettings;
    map['law_firm_category_ids'] = _lawFirmCategoryIds;
    if (_lawFirmLawyers != null) {
      map['law_firm_lawyers'] =
          _lawFirmLawyers?.map((v) => v.toJson()).toList();
    }
    if (_lawFirmCategories != null) {
      map['law_firm_categories'] =
          _lawFirmCategories?.map((v) => v.toJson()).toList();
    }
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }
}

LawFirmCategories lawFirmCategoriesFromJson(String str) =>
    LawFirmCategories.fromJson(json.decode(str));
String lawFirmCategoriesToJson(LawFirmCategories data) =>
    json.encode(data.toJson());

class LawFirmCategories {
  LawFirmCategories({
    num? id,
    String? name,
    String? description,
    String? slug,
    num? isActive,
    num? isFeatured,
    dynamic icon,
    String? image,
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

  LawFirmCategories.fromJson(dynamic json) {
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
  String? _description;
  String? _slug;
  num? _isActive;
  num? _isFeatured;
  dynamic _icon;
  String? _image;
  String? _createdAt;
  String? _updatedAt;
  LawFirmCategories copyWith({
    num? id,
    String? name,
    String? description,
    String? slug,
    num? isActive,
    num? isFeatured,
    dynamic icon,
    String? image,
    String? createdAt,
    String? updatedAt,
  }) =>
      LawFirmCategories(
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
  String? get description => _description;
  String? get slug => _slug;
  num? get isActive => _isActive;
  num? get isFeatured => _isFeatured;
  dynamic get icon => _icon;
  String? get image => _image;
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

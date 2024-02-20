import 'dart:convert';

GetLoggedInUserModel getLoggedInUserModelFromJson(String str) =>
    GetLoggedInUserModel.fromJson(json.decode(str));
String getLoggedInUserModelToJson(GetLoggedInUserModel data) =>
    json.encode(data.toJson());

class GetLoggedInUserModel {
  GetLoggedInUserModel({
    GetLoggedInUserDataModel? data,
    bool? success,
    String? message,
    dynamic errors,
  }) {
    _data = data;
    _success = success;
    _message = message;
    _errors = errors;
  }

  GetLoggedInUserModel.fromJson(dynamic json) {
    _data = json['data'] != null
        ? GetLoggedInUserDataModel.fromJson(json['data'])
        : null;
    _success = json['success'];
    _message = json['message'];
    _errors = json['errors'];
  }
  GetLoggedInUserDataModel? _data;
  bool? _success;
  String? _message;
  dynamic _errors;
  GetLoggedInUserModel copyWith({
    GetLoggedInUserDataModel? data,
    bool? success,
    String? message,
    dynamic errors,
  }) =>
      GetLoggedInUserModel(
        data: data ?? _data,
        success: success ?? _success,
        message: message ?? _message,
        errors: errors ?? _errors,
      );
  GetLoggedInUserDataModel? get data => _data;
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

GetLoggedInUserDataModel dataFromJson(String str) =>
    GetLoggedInUserDataModel.fromJson(json.decode(str));
String dataToJson(GetLoggedInUserDataModel data) => json.encode(data.toJson());

class GetLoggedInUserDataModel {
  GetLoggedInUserDataModel({
    User? user,
  }) {
    _user = user;
  }

  GetLoggedInUserDataModel.fromJson(dynamic json) {
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
  User? _user;
  GetLoggedInUserDataModel copyWith({
    User? user,
  }) =>
      GetLoggedInUserDataModel(
        user: user ?? _user,
      );
  User? get user => _user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    return map;
  }
}

User userFromJson(String str) => User.fromJson(json.decode(str));
String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    num? id,
    String? name,
    String? email,
    num? isActive,
    dynamic countryId,
    String? emailVerifiedAt,
    bool? isEmailVerified,
    dynamic profileImagePath,
    dynamic passwordLastChanged,
    bool? isLawyer,
    bool? isCustomer,
    bool? isLawFirm,
    List<String>? lawyerModules,
    List<String>? lawFirmModules,
    LoginInfo? loginInfo,
    String? createdAt,
    String? updatedAt,
    dynamic deletedAt,
  }) {
    _id = id;
    _name = name;
    _email = email;
    _isActive = isActive;
    _countryId = countryId;
    _emailVerifiedAt = emailVerifiedAt;
    _isEmailVerified = isEmailVerified;
    _profileImagePath = profileImagePath;
    _passwordLastChanged = passwordLastChanged;
    _isLawyer = isLawyer;
    _isCustomer = isCustomer;
    _isLawFirm = isLawFirm;
    _lawyerModules = lawyerModules;
    _lawFirmModules = lawFirmModules;
    _loginInfo = loginInfo;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _deletedAt = deletedAt;
  }

  User.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _email = json['email'];
    _isActive = json['is_active'];
    _countryId = json['country_id'];
    _emailVerifiedAt = json['email_verified_at'];
    _isEmailVerified = json['is_email_verified'];
    _profileImagePath = json['profile_image_path'];
    _passwordLastChanged = json['password_last_changed'];
    _isLawyer = json['is_lawyer'];
    _isCustomer = json['is_customer'];
    _isLawFirm = json['is_law_firm'];
    _lawyerModules = json['lawyer_modules'] != null
        ? json['lawyer_modules'].cast<String>()
        : [];
    _lawFirmModules = json['law_firm_modules'] != null
        ? json['law_firm_modules'].cast<String>()
        : [];
    _loginInfo = json['login_info'] != null
        ? LoginInfo.fromJson(json['login_info'])
        : null;
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _deletedAt = json['deleted_at'];
  }
  num? _id;
  String? _name;
  String? _email;
  num? _isActive;
  dynamic _countryId;
  String? _emailVerifiedAt;
  bool? _isEmailVerified;
  dynamic _profileImagePath;
  dynamic _passwordLastChanged;
  bool? _isLawyer;
  bool? _isCustomer;
  bool? _isLawFirm;
  List<String>? _lawyerModules;
  List<String>? _lawFirmModules;
  LoginInfo? _loginInfo;
  String? _createdAt;
  String? _updatedAt;
  dynamic _deletedAt;
  User copyWith({
    num? id,
    String? name,
    String? email,
    num? isActive,
    dynamic countryId,
    String? emailVerifiedAt,
    bool? isEmailVerified,
    dynamic profileImagePath,
    dynamic passwordLastChanged,
    bool? isLawyer,
    bool? isCustomer,
    bool? isLawFirm,
    List<String>? lawyerModules,
    List<String>? lawFirmModules,
    LoginInfo? loginInfo,
    String? createdAt,
    String? updatedAt,
    dynamic deletedAt,
  }) =>
      User(
        id: id ?? _id,
        name: name ?? _name,
        email: email ?? _email,
        isActive: isActive ?? _isActive,
        countryId: countryId ?? _countryId,
        emailVerifiedAt: emailVerifiedAt ?? _emailVerifiedAt,
        isEmailVerified: isEmailVerified ?? _isEmailVerified,
        profileImagePath: profileImagePath ?? _profileImagePath,
        passwordLastChanged: passwordLastChanged ?? _passwordLastChanged,
        isLawyer: isLawyer ?? _isLawyer,
        isCustomer: isCustomer ?? _isCustomer,
        isLawFirm: isLawFirm ?? _isLawFirm,
        lawyerModules: lawyerModules ?? _lawyerModules,
        lawFirmModules: lawFirmModules ?? _lawFirmModules,
        loginInfo: loginInfo ?? _loginInfo,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
        deletedAt: deletedAt ?? _deletedAt,
      );
  num? get id => _id;
  String? get name => _name;
  String? get email => _email;
  num? get isActive => _isActive;
  dynamic get countryId => _countryId;
  String? get emailVerifiedAt => _emailVerifiedAt;
  bool? get isEmailVerified => _isEmailVerified;
  dynamic get profileImagePath => _profileImagePath;
  dynamic get passwordLastChanged => _passwordLastChanged;
  bool? get isLawyer => _isLawyer;
  bool? get isCustomer => _isCustomer;
  bool? get isLawFirm => _isLawFirm;
  List<String>? get lawyerModules => _lawyerModules;
  List<String>? get lawFirmModules => _lawFirmModules;
  LoginInfo? get loginInfo => _loginInfo;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  dynamic get deletedAt => _deletedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['email'] = _email;
    map['is_active'] = _isActive;
    map['country_id'] = _countryId;
    map['email_verified_at'] = _emailVerifiedAt;
    map['is_email_verified'] = _isEmailVerified;
    map['profile_image_path'] = _profileImagePath;
    map['password_last_changed'] = _passwordLastChanged;
    map['is_lawyer'] = _isLawyer;
    map['is_customer'] = _isCustomer;
    map['is_law_firm'] = _isLawFirm;
    map['lawyer_modules'] = _lawyerModules;
    map['law_firm_modules'] = _lawyerModules;
    if (_loginInfo != null) {
      map['login_info'] = _loginInfo?.toJson();
    }
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['deleted_at'] = _deletedAt;
    return map;
  }
}

LoginInfo loginInfoFromJson(String str) => LoginInfo.fromJson(json.decode(str));
String loginInfoToJson(LoginInfo data) => json.encode(data.toJson());

class LoginInfo {
  LoginInfo({
    num? id,
    num? userId,
    dynamic countryId,
    dynamic stateId,
    dynamic cityId,
    String? name,
    String? firstName,
    String? lastName,
    String? userName,
    String? description,
    String? addressLine1,
    String? addressLine2,
    String? zipCode,
    dynamic isApproved,
    dynamic approvedAt,
    num? isActive,
    num? isFeatured,
    dynamic icon,
    dynamic image,
    dynamic coverImage,
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
    _userName = userName;
    _description = description;
    _addressLine1 = addressLine1;
    _addressLine2 = addressLine2;
    _zipCode = zipCode;
    _isApproved = isApproved;
    _approvedAt = approvedAt;
    _isActive = isActive;
    _isFeatured = isFeatured;
    _icon = icon;
    _image = image;
    _coverImage = coverImage;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  LoginInfo.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _countryId = json['country_id'];
    _stateId = json['state_id'];
    _cityId = json['city_id'];
    _name = json['name'];
    _firstName = json['first_name'];
    _lastName = json['last_name'];
    _userName = json['user_name'];
    _description = json['description'];
    _addressLine1 = json['address_line_1'];
    _addressLine2 = json['address_line_2'];
    _zipCode = json['zip_code'];
    _isApproved = json['is_approved'];
    _approvedAt = json['approved_at'];
    _isActive = json['is_active'];
    _isFeatured = json['is_featured'];
    _icon = json['icon'];
    _image = json['image'];
    _coverImage = json['cover_image'];
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
  String? _userName;
  String? _description;
  String? _addressLine1;
  String? _addressLine2;
  String? _zipCode;
  dynamic _isApproved;
  dynamic _approvedAt;
  num? _isActive;
  num? _isFeatured;
  dynamic _icon;
  dynamic _image;
  dynamic _coverImage;
  String? _createdAt;
  String? _updatedAt;
  LoginInfo copyWith({
    num? id,
    num? userId,
    dynamic countryId,
    dynamic stateId,
    dynamic cityId,
    String? name,
    String? firstName,
    String? lastName,
    String? userName,
    String? description,
    String? addressLine1,
    String? addressLine2,
    String? zipCode,
    dynamic isApproved,
    dynamic approvedAt,
    num? isActive,
    num? isFeatured,
    dynamic icon,
    dynamic image,
    dynamic coverImage,
    String? createdAt,
    String? updatedAt,
  }) =>
      LoginInfo(
        id: id ?? _id,
        userId: userId ?? _userId,
        countryId: countryId ?? _countryId,
        stateId: stateId ?? _stateId,
        cityId: cityId ?? _cityId,
        name: name ?? _name,
        firstName: firstName ?? _firstName,
        lastName: lastName ?? _lastName,
        userName: userName ?? _userName,
        description: description ?? _description,
        addressLine1: addressLine1 ?? _addressLine1,
        addressLine2: addressLine2 ?? _addressLine2,
        zipCode: zipCode ?? _zipCode,
        isApproved: isApproved ?? _isApproved,
        approvedAt: approvedAt ?? _approvedAt,
        isActive: isActive ?? _isActive,
        isFeatured: isFeatured ?? _isFeatured,
        icon: icon ?? _icon,
        image: image ?? _image,
        coverImage: coverImage ?? _coverImage,
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
  String? get userName => _userName;
  String? get description => _description;
  String? get addressLine1 => _addressLine1;
  String? get addressLine2 => _addressLine2;
  String? get zipCode => _zipCode;
  dynamic get isApproved => _isApproved;
  dynamic get approvedAt => _approvedAt;
  num? get isActive => _isActive;
  num? get isFeatured => _isFeatured;
  dynamic get icon => _icon;
  dynamic get image => _image;
  dynamic get coverImage => _coverImage;
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
    map['user_name'] = _userName;
    map['description'] = _description;
    map['address_line_1'] = _addressLine1;
    map['address_line_2'] = _addressLine2;
    map['zip_code'] = _zipCode;
    map['is_approved'] = _isApproved;
    map['approved_at'] = _approvedAt;
    map['is_active'] = _isActive;
    map['is_featured'] = _isFeatured;
    map['icon'] = _icon;
    map['image'] = _image;
    map['cover_image'] = _coverImage;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }
}

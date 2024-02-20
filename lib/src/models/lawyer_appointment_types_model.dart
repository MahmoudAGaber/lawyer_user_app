import 'dart:convert';

GetLawyerAppointmentTypesModel getLawyerAppointmentTypesFromJson(String str) =>
    GetLawyerAppointmentTypesModel.fromJson(json.decode(str));
String getLawyerAppointmentTypesToJson(GetLawyerAppointmentTypesModel data) =>
    json.encode(data.toJson());

class GetLawyerAppointmentTypesModel {
  GetLawyerAppointmentTypesModel({
    List<GetLawyerAppointmentTypesDataModel>? data,
    bool? success,
    String? message,
    dynamic errors,
  }) {
    _data = data;
    _success = success;
    _message = message;
    _errors = errors;
  }

  GetLawyerAppointmentTypesModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(GetLawyerAppointmentTypesDataModel.fromJson(v));
      });
    }
    _success = json['success'];
    _message = json['message'];
    _errors = json['errors'];
  }
  List<GetLawyerAppointmentTypesDataModel>? _data;
  bool? _success;
  String? _message;
  dynamic _errors;
  GetLawyerAppointmentTypesModel copyWith({
    List<GetLawyerAppointmentTypesDataModel>? data,
    bool? success,
    String? message,
    dynamic errors,
  }) =>
      GetLawyerAppointmentTypesModel(
        data: data ?? _data,
        success: success ?? _success,
        message: message ?? _message,
        errors: errors ?? _errors,
      );
  List<GetLawyerAppointmentTypesDataModel>? get data => _data;
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

GetLawyerAppointmentTypesDataModel dataFromJson(String str) =>
    GetLawyerAppointmentTypesDataModel.fromJson(json.decode(str));
String dataToJson(GetLawyerAppointmentTypesDataModel data) =>
    json.encode(data.toJson());

class GetLawyerAppointmentTypesDataModel {
  GetLawyerAppointmentTypesDataModel({
    num? id,
    String? displayName,
    String? description,
    String? type,
    num? isScheduleRequired,
    num? isPaid,
    num? isActive,
    String? createdAt,
    String? updatedAt,
  }) {
    _id = id;
    _displayName = displayName;
    _description = description;
    _type = type;
    _isScheduleRequired = isScheduleRequired;
    _isPaid = isPaid;
    _isActive = isActive;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  GetLawyerAppointmentTypesDataModel.fromJson(dynamic json) {
    _id = json['id'];
    _displayName = json['display_name'];
    _description = json['description'];
    _type = json['type'];
    _isScheduleRequired = json['is_schedule_required'];
    _isPaid = json['is_paid'];
    _isActive = json['is_active'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  String? _displayName;
  String? _description;
  String? _type;
  num? _isScheduleRequired;
  num? _isPaid;
  num? _isActive;
  String? _createdAt;
  String? _updatedAt;
  GetLawyerAppointmentTypesDataModel copyWith({
    num? id,
    String? displayName,
    String? description,
    String? type,
    num? isScheduleRequired,
    num? isPaid,
    num? isActive,
    String? createdAt,
    String? updatedAt,
  }) =>
      GetLawyerAppointmentTypesDataModel(
        id: id ?? _id,
        displayName: displayName ?? _displayName,
        description: description ?? _description,
        type: type ?? _type,
        isScheduleRequired: isScheduleRequired ?? _isScheduleRequired,
        isPaid: isPaid ?? _isPaid,
        isActive: isActive ?? _isActive,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
      );
  num? get id => _id;
  String? get displayName => _displayName;
  String? get description => _description;
  String? get type => _type;
  num? get isScheduleRequired => _isScheduleRequired;
  num? get isPaid => _isPaid;
  num? get isActive => _isActive;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['display_name'] = _displayName;
    map['description'] = _description;
    map['type'] = _type;
    map['is_schedule_required'] = _isScheduleRequired;
    map['is_paid'] = _isPaid;
    map['is_active'] = _isActive;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }
}

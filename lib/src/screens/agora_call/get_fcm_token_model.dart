class GetFcmTokenModel {
  GetFcmTokenModel({
      bool? status, 
      int? success,
    GetFcmTokenModelData? data,
      String? msg,}){
    _status = status;
    _success = success;
    _data = data;
    _msg = msg;
}

  GetFcmTokenModel.fromJson(dynamic json) {
    _status = json['Status'];
    _success = json['success'];
    _data = json['data'] != null ? GetFcmTokenModelData.fromJson(json['data']) : null;
    _msg = json['msg'];
  }
  bool? _status;
  int? _success;
  GetFcmTokenModelData? _data;
  String? _msg;

  bool? get status => _status;
  int? get success => _success;
  GetFcmTokenModelData? get data => _data;
  String? get msg => _msg;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Status'] = _status;
    map['success'] = _success;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    map['msg'] = _msg;
    return map;
  }

}

class GetFcmTokenModelData {
  GetFcmTokenModelData({
      List<Tokens>? tokens,}){
    _tokens = tokens;
}

  GetFcmTokenModelData.fromJson(dynamic json) {
    if (json['tokens'] != null) {
      _tokens = [];
      json['tokens'].forEach((v) {
        _tokens?.add(Tokens.fromJson(v));
      });
    }
  }
  List<Tokens>? _tokens;

  List<Tokens>? get tokens => _tokens;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_tokens != null) {
      map['tokens'] = _tokens?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Tokens {
  Tokens({
      int? id, 
      int? userId, 
      String? deviceKey, 
      String? deviceId,}){
    _id = id;
    _userId = userId;
    _deviceKey = deviceKey;
    _deviceId = deviceId;
}

  Tokens.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _deviceKey = json['device_key'];
    _deviceId = json['device_id'];
  }
  int? _id;
  int? _userId;
  String? _deviceKey;
  String? _deviceId;

  int? get id => _id;
  int? get userId => _userId;
  String? get deviceKey => _deviceKey;
  String? get deviceId => _deviceId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['device_key'] = _deviceKey;
    map['device_id'] = _deviceId;
    return map;
  }

}
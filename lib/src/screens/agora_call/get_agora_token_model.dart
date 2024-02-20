class GetAgoraTokenModel {
  GetAgoraTokenModel({
      bool? status, 
      int? success,
    GetAgoraTokenModelData? data,
      String? msg,}){
    _status = status;
    _success = success;
    _data = data;
    _msg = msg;
}

  GetAgoraTokenModel.fromJson(dynamic json) {
    _status = json['Status'];
    _success = json['success'];
    _data = json['data'] != null ? GetAgoraTokenModelData.fromJson(json['data']) : null;
    _msg = json['msg'];
  }
  bool? _status;
  int? _success;
  GetAgoraTokenModelData? _data;
  String? _msg;

  bool? get status => _status;
  int? get success => _success;
  GetAgoraTokenModelData? get data => _data;
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

class GetAgoraTokenModelData {
  GetAgoraTokenModelData({
      String? token,}){
    _token = token;
}

  GetAgoraTokenModelData.fromJson(dynamic json) {
    _token = json['token'];
  }
  String? _token;

  String? get token => _token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = _token;
    return map;
  }

}
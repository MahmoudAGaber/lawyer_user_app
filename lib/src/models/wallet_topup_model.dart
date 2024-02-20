import 'dart:convert';
WalletTopupModel walletTopupModelFromJson(String str) => WalletTopupModel.fromJson(json.decode(str));
String walletTopupModelToJson(WalletTopupModel data) => json.encode(data.toJson());
class WalletTopupModel {
  WalletTopupModel({
      Data? data, 
      bool? success, 
      String? message, 
      dynamic errors,}){
    _data = data;
    _success = success;
    _message = message;
    _errors = errors;
}

  WalletTopupModel.fromJson(dynamic json) {
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _success = json['success'];
    _message = json['message'];
    _errors = json['errors'];
  }
  Data? _data;
  bool? _success;
  String? _message;
  dynamic _errors;
WalletTopupModel copyWith({  Data? data,
  bool? success,
  String? message,
  dynamic errors,
}) => WalletTopupModel(  data: data ?? _data,
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

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      String? fundTransaction,}){
    _fundTransaction = fundTransaction;
}

  Data.fromJson(dynamic json) {
    _fundTransaction = json['fund_transaction'];
  }
  String? _fundTransaction;
Data copyWith({  String? fundTransaction,
}) => Data(  fundTransaction: fundTransaction ?? _fundTransaction,
);
  String? get fundTransaction => _fundTransaction;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['fund_transaction'] = _fundTransaction;
    return map;
  }

}
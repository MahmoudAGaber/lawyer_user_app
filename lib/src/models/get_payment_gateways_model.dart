import 'dart:convert';

GetPaymentGatewaysModel getPaymentGatewaysModelFromJson(String str) =>
    GetPaymentGatewaysModel.fromJson(json.decode(str));
String getPaymentGatewaysModelToJson(GetPaymentGatewaysModel data) =>
    json.encode(data.toJson());

class GetPaymentGatewaysModel {
  GetPaymentGatewaysModel({
    List<GetPaymentGatewaysDataModel>? data,
    bool? success,
    String? message,
    dynamic errors,
  }) {
    _data = data;
    _success = success;
    _message = message;
    _errors = errors;
  }

  GetPaymentGatewaysModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(GetPaymentGatewaysDataModel.fromJson(v));
      });
    }
    _success = json['success'];
    _message = json['message'];
    _errors = json['errors'];
  }
  List<GetPaymentGatewaysDataModel>? _data;
  bool? _success;
  String? _message;
  dynamic _errors;
  GetPaymentGatewaysModel copyWith({
    List<GetPaymentGatewaysDataModel>? data,
    bool? success,
    String? message,
    dynamic errors,
  }) =>
      GetPaymentGatewaysModel(
        data: data ?? _data,
        success: success ?? _success,
        message: message ?? _message,
        errors: errors ?? _errors,
      );
  List<GetPaymentGatewaysDataModel>? get data => _data;
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

GetPaymentGatewaysDataModel dataFromJson(String str) =>
    GetPaymentGatewaysDataModel.fromJson(json.decode(str));
String dataToJson(GetPaymentGatewaysDataModel data) =>
    json.encode(data.toJson());

class GetPaymentGatewaysDataModel {
  GetPaymentGatewaysDataModel({
    num? id,
    String? name,
    String? code,
    String? currency,
    String? symbol,
    Parameters? parameters,
    dynamic extraParameters,
    String? conventionRate,
    dynamic? currencies,
    String? minAmount,
    String? maxAmount,
    String? percentageCharge,
    String? fixedCharge,
    num? status,
    String? note,
    String? image,
    num? sortBy,
    String? createdAt,
    String? updatedAt,
    dynamic deletedAt,
  }) {
    _id = id;
    _name = name;
    _code = code;
    _currency = currency;
    _symbol = symbol;
    _parameters = parameters;
    _extraParameters = extraParameters;
    _conventionRate = conventionRate;
    _currencies = currencies;
    _minAmount = minAmount;
    _maxAmount = maxAmount;
    _percentageCharge = percentageCharge;
    _fixedCharge = fixedCharge;
    _status = status;
    _note = note;
    _image = image;
    _sortBy = sortBy;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _deletedAt = deletedAt;
  }

  GetPaymentGatewaysDataModel.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _code = json['code'];
    _currency = json['currency'];
    _symbol = json['symbol'];
    _parameters = json['parameters'] != null
        ? Parameters.fromJson(json['parameters'])
        : null;
    _extraParameters = json['extra_parameters'];
    _conventionRate = json['convention_rate'];
    _currencies = json['currencies'];
    _minAmount = json['min_amount'];
    _maxAmount = json['max_amount'];
    _percentageCharge = json['percentage_charge'];
    _fixedCharge = json['fixed_charge'];
    _status = json['status'];
    _note = json['note'];
    _image = json['image'];
    _sortBy = json['sort_by'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _deletedAt = json['deleted_at'];
  }
  num? _id;
  String? _name;
  String? _code;
  String? _currency;
  String? _symbol;
  Parameters? _parameters;
  dynamic _extraParameters;
  String? _conventionRate;
  dynamic? _currencies;
  String? _minAmount;
  String? _maxAmount;
  String? _percentageCharge;
  String? _fixedCharge;
  num? _status;
  String? _note;
  String? _image;
  num? _sortBy;
  String? _createdAt;
  String? _updatedAt;
  dynamic _deletedAt;
  GetPaymentGatewaysDataModel copyWith({
    num? id,
    String? name,
    String? code,
    String? currency,
    String? symbol,
    Parameters? parameters,
    dynamic extraParameters,
    String? conventionRate,
    dynamic? currencies,
    String? minAmount,
    String? maxAmount,
    String? percentageCharge,
    String? fixedCharge,
    num? status,
    String? note,
    String? image,
    num? sortBy,
    String? createdAt,
    String? updatedAt,
    dynamic deletedAt,
  }) =>
      GetPaymentGatewaysDataModel(
        id: id ?? _id,
        name: name ?? _name,
        code: code ?? _code,
        currency: currency ?? _currency,
        symbol: symbol ?? _symbol,
        parameters: parameters ?? _parameters,
        extraParameters: extraParameters ?? _extraParameters,
        conventionRate: conventionRate ?? _conventionRate,
        currencies: currencies ?? _currencies,
        minAmount: minAmount ?? _minAmount,
        maxAmount: maxAmount ?? _maxAmount,
        percentageCharge: percentageCharge ?? _percentageCharge,
        fixedCharge: fixedCharge ?? _fixedCharge,
        status: status ?? _status,
        note: note ?? _note,
        image: image ?? _image,
        sortBy: sortBy ?? _sortBy,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
        deletedAt: deletedAt ?? _deletedAt,
      );
  num? get id => _id;
  String? get name => _name;
  String? get code => _code;
  String? get currency => _currency;
  String? get symbol => _symbol;
  Parameters? get parameters => _parameters;
  dynamic get extraParameters => _extraParameters;
  String? get conventionRate => _conventionRate;
  dynamic? get currencies => _currencies;
  String? get minAmount => _minAmount;
  String? get maxAmount => _maxAmount;
  String? get percentageCharge => _percentageCharge;
  String? get fixedCharge => _fixedCharge;
  num? get status => _status;
  String? get note => _note;
  String? get image => _image;
  num? get sortBy => _sortBy;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  dynamic get deletedAt => _deletedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['code'] = _code;
    map['currency'] = _currency;
    map['symbol'] = _symbol;
    if (_parameters != null) {
      map['parameters'] = _parameters?.toJson();
    }
    map['extra_parameters'] = _extraParameters;
    map['convention_rate'] = _conventionRate;
    if (_currencies != null) {
      map['currencies'] = _currencies?.toJson();
    }
    map['min_amount'] = _minAmount;
    map['max_amount'] = _maxAmount;
    map['percentage_charge'] = _percentageCharge;
    map['fixed_charge'] = _fixedCharge;
    map['status'] = _status;
    map['note'] = _note;
    map['image'] = _image;
    map['sort_by'] = _sortBy;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['deleted_at'] = _deletedAt;
    return map;
  }
}

Parameters parametersFromJson(String str) =>
    Parameters.fromJson(json.decode(str));
String parametersToJson(Parameters data) => json.encode(data.toJson());

class Parameters {
  Parameters({
    String? cleintId,
    String? secret,
  }) {
    _cleintId = cleintId;
    _secret = secret;
  }

  Parameters.fromJson(dynamic json) {
    _cleintId = json['cleint_id'];
    _secret = json['secret'];
  }
  String? _cleintId;
  String? _secret;
  Parameters copyWith({
    String? cleintId,
    String? secret,
  }) =>
      Parameters(
        cleintId: cleintId ?? _cleintId,
        secret: secret ?? _secret,
      );
  String? get cleintId => _cleintId;
  String? get secret => _secret;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['cleint_id'] = _cleintId;
    map['secret'] = _secret;
    return map;
  }
}

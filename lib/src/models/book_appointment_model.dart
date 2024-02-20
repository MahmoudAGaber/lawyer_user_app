import 'dart:convert';

BookAppointmentModel bookAppointmentModelFromJson(String str) =>
    BookAppointmentModel.fromJson(json.decode(str));
String bookAppointmentModelToJson(BookAppointmentModel data) =>
    json.encode(data.toJson());

class BookAppointmentModel {
  BookAppointmentModel({
    Data? data,
    bool? success,
    String? message,
    dynamic errors,
  }) {
    _data = data;
    _success = success;
    _message = message;
    _errors = errors;
  }

  BookAppointmentModel.fromJson(dynamic json) {
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _success = json['success'];
    _message = json['message'];
    _errors = json['errors'];
  }
  Data? _data;
  bool? _success;
  String? _message;
  dynamic _errors;
  BookAppointmentModel copyWith({
    Data? data,
    bool? success,
    String? message,
    dynamic errors,
  }) =>
      BookAppointmentModel(
        data: data ?? _data,
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
    String? question,
    String? date,
    dynamic appointmentTypeId,
    dynamic lawyerId,
    String? startTime,
    String? endTime,
    num? fee,
    num? customerId,
    num? appointmentStatusCode,
    num? fundId,
    num? isPaid,
    String? updatedAt,
    String? createdAt,
    num? id,
    String? fundTransaction,
  }) {
    _question = question;
    _date = date;
    _appointmentTypeId = appointmentTypeId;
    _lawyerId = lawyerId;
    _startTime = startTime;
    _endTime = endTime;
    _fee = fee;
    _customerId = customerId;
    _appointmentStatusCode = appointmentStatusCode;
    _fundId = fundId;
    _isPaid = isPaid;
    _updatedAt = updatedAt;
    _createdAt = createdAt;
    _id = id;
    _fundTransaction = fundTransaction;
  }

  Data.fromJson(dynamic json) {
    _question = json['question'];
    _date = json['date'];
    _appointmentTypeId = json['appointment_type_id'];
    _lawyerId = json['lawyer_id'];
    _startTime = json['start_time'];
    _endTime = json['end_time'];
    _fee = json['fee'];
    _customerId = json['customer_id'];
    _appointmentStatusCode = json['appointment_status_code'];
    _fundId = json['fund_id'];
    _isPaid = json['is_paid'];
    _updatedAt = json['updated_at'];
    _createdAt = json['created_at'];
    _id = json['id'];
    _fundTransaction = json['fund_transaction'];
  }
  String? _question;
  String? _date;
  dynamic _appointmentTypeId;
  dynamic _lawyerId;
  String? _startTime;
  String? _endTime;
  num? _fee;
  num? _customerId;
  num? _appointmentStatusCode;
  num? _fundId;
  num? _isPaid;
  String? _updatedAt;
  String? _createdAt;
  num? _id;
  String? _fundTransaction;
  Data copyWith({
    String? question,
    String? date,
    dynamic appointmentTypeId,
    dynamic lawyerId,
    String? startTime,
    String? endTime,
    num? fee,
    num? customerId,
    num? appointmentStatusCode,
    num? fundId,
    num? isPaid,
    String? updatedAt,
    String? createdAt,
    num? id,
    String? fundTransaction,
  }) =>
      Data(
        question: question ?? _question,
        date: date ?? _date,
        appointmentTypeId: appointmentTypeId ?? _appointmentTypeId,
        lawyerId: lawyerId ?? _lawyerId,
        startTime: startTime ?? _startTime,
        endTime: endTime ?? _endTime,
        fee: fee ?? _fee,
        customerId: customerId ?? _customerId,
        appointmentStatusCode: appointmentStatusCode ?? _appointmentStatusCode,
        fundId: fundId ?? _fundId,
        isPaid: isPaid ?? _isPaid,
        updatedAt: updatedAt ?? _updatedAt,
        createdAt: createdAt ?? _createdAt,
        id: id ?? _id,
        fundTransaction: fundTransaction ?? _fundTransaction,
      );
  String? get question => _question;
  String? get date => _date;
  dynamic get appointmentTypeId => _appointmentTypeId;
  dynamic get lawyerId => _lawyerId;
  String? get startTime => _startTime;
  String? get endTime => _endTime;
  num? get fee => _fee;
  num? get customerId => _customerId;
  num? get appointmentStatusCode => _appointmentStatusCode;
  num? get fundId => _fundId;
  num? get isPaid => _isPaid;
  String? get updatedAt => _updatedAt;
  String? get createdAt => _createdAt;
  num? get id => _id;
  String? get fundTransaction => _fundTransaction;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['question'] = _question;
    map['date'] = _date;
    map['appointment_type_id'] = _appointmentTypeId;
    map['lawyer_id'] = _lawyerId;
    map['start_time'] = _startTime;
    map['end_time'] = _endTime;
    map['fee'] = _fee;
    map['customer_id'] = _customerId;
    map['appointment_status_code'] = _appointmentStatusCode;
    map['fund_id'] = _fundId;
    map['is_paid'] = _isPaid;
    map['updated_at'] = _updatedAt;
    map['created_at'] = _createdAt;
    map['id'] = _id;
    map['fund_transaction'] = _fundTransaction;
    return map;
  }
}

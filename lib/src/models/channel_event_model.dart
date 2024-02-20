import 'dart:convert';

ChannelEventModel channelEventDataModelFromJson(String str) =>
    ChannelEventModel.fromJson(json.decode(str));
String channelEventDataModelToJson(ChannelEventModel data) =>
    json.encode(data.toJson());

class ChannelEventModel {
  ChannelEventModel({
    String? channelName,
    String? eventName,
    ChannelEventDataModel? data,
    dynamic userId,
  }) {
    _channelName = channelName;
    _eventName = eventName;
    _data = data;
    _userId = userId;
  }

  ChannelEventModel.fromJson(dynamic json) {
    _channelName = json['channelName'];
    _eventName = json['eventName'];
    _data = json['data'] != null
        ? ChannelEventDataModel.fromJson(json['data'])
        : null;
    _userId = json['userId'];
  }
  String? _channelName;
  String? _eventName;
  ChannelEventDataModel? _data;
  dynamic _userId;
  ChannelEventModel copyWith({
    String? channelName,
    String? eventName,
    ChannelEventDataModel? data,
    dynamic userId,
  }) =>
      ChannelEventModel(
        channelName: channelName ?? _channelName,
        eventName: eventName ?? _eventName,
        data: data ?? _data,
        userId: userId ?? _userId,
      );
  String? get channelName => _channelName;
  String? get eventName => _eventName;
  ChannelEventDataModel? get data => _data;
  dynamic get userId => _userId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['channelName'] = _channelName;
    map['eventName'] = _eventName;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    map['userId'] = _userId;
    return map;
  }
}

ChannelEventDataModel dataFromJson(String str) =>
    ChannelEventDataModel.fromJson(json.decode(str));
String dataToJson(ChannelEventDataModel data) => json.encode(data.toJson());

class ChannelEventDataModel {
  ChannelEventDataModel({
    num? appointmentId,
    num? customerId,
    String? channel,
    String? token,
  }) {
    _appointmentId = appointmentId;
    _customerId = customerId;
    _channel = channel;
    _token = token;
  }

  ChannelEventDataModel.fromJson(dynamic json) {
    _appointmentId = json['appointment_id'];
    _customerId = json['customer_id'];
    _channel = json['channel'];
    _token = json['token'];
  }
  num? _appointmentId;
  num? _customerId;
  String? _channel;
  String? _token;
  ChannelEventDataModel copyWith({
    num? appointmentId,
    num? customerId,
    String? channel,
    String? token,
  }) =>
      ChannelEventDataModel(
        appointmentId: appointmentId ?? _appointmentId,
        customerId: customerId ?? _customerId,
        channel: channel ?? _channel,
        token: token ?? _token,
      );
  num? get appointmentId => _appointmentId;
  num? get customerId => _customerId;
  String? get channel => _channel;
  String? get token => _token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['appointment_id'] = _appointmentId;
    map['customer_id'] = _customerId;
    map['channel'] = _channel;
    map['token'] = _token;
    return map;
  }
}

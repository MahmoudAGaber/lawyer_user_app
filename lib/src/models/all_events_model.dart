import 'dart:convert';

GetAllEventsModel getAllEventsModelFromJson(String str) =>
    GetAllEventsModel.fromJson(json.decode(str));
String getAllEventsModelToJson(GetAllEventsModel data) =>
    json.encode(data.toJson());

class GetAllEventsModel {
  GetAllEventsModel({
    GetAllEventsDataModel? data,
    bool? success,
    String? message,
    dynamic errors,
  }) {
    _data = data;
    _success = success;
    _message = message;
    _errors = errors;
  }

  GetAllEventsModel.fromJson(dynamic json) {
    _data = json['data'] != null
        ? GetAllEventsDataModel.fromJson(json['data'])
        : null;
    _success = json['success'];
    _message = json['message'];
    _errors = json['errors'];
  }
  GetAllEventsDataModel? _data;
  bool? _success;
  String? _message;
  dynamic _errors;
  GetAllEventsModel copyWith({
    GetAllEventsDataModel? data,
    bool? success,
    String? message,
    dynamic errors,
  }) =>
      GetAllEventsModel(
        data: data ?? _data,
        success: success ?? _success,
        message: message ?? _message,
        errors: errors ?? _errors,
      );
  GetAllEventsDataModel? get data => _data;
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

GetAllEventsDataModel dataFromJson(String str) =>
    GetAllEventsDataModel.fromJson(json.decode(str));
String dataToJson(GetAllEventsDataModel data) => json.encode(data.toJson());

class GetAllEventsDataModel {
  GetAllEventsDataModel({
    List<EventModel>? data,
    Links? links,
    Meta? meta,
  }) {
    _data = data;
    _links = links;
    _meta = meta;
  }

  GetAllEventsDataModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(EventModel.fromJson(v));
      });
    }
    _links = json['links'] != null ? Links.fromJson(json['links']) : null;
    _meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }
  List<EventModel>? _data;
  Links? _links;
  Meta? _meta;
  GetAllEventsDataModel copyWith({
    List<EventModel>? data,
    Links? links,
    Meta? meta,
  }) =>
      GetAllEventsDataModel(
        data: data ?? _data,
        links: links ?? _links,
        meta: meta ?? _meta,
      );
  List<EventModel>? get data => _data;
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

EventModel eventModelFromJson(String str) =>
    EventModel.fromJson(json.decode(str));
String eventModelToJson(EventModel data) => json.encode(data.toJson());

class EventModel {
  EventModel({
    num? id,
    num? lawyerId,
    String? lawyerName,
    dynamic lawFirmId,
    String? lawFirmName,
    List<num>? tagIds,
    List<Tags>? tags,
    String? name,
    String? description,
    String? slug,
    num? isActive,
    num? isFeatured,
    String? startsAt,
    String? endsAt,
    String? sponsor,
    dynamic icon,
    String? addressLine1,
    String? addressLine2,
    String? image,
    String? createdAt,
    String? updatedAt,
  }) {
    _id = id;
    _lawyerId = lawyerId;
    _lawyerName = lawyerName;
    _lawFirmId = lawFirmId;
    _lawFirmName = lawFirmName;
    _tagIds = tagIds;
    _tags = tags;
    _name = name;
    _description = description;
    _slug = slug;
    _isActive = isActive;
    _isFeatured = isFeatured;
    _startsAt = startsAt;
    _endsAt = endsAt;
    _sponsor = sponsor;
    _icon = icon;
    _addressLine1 = addressLine1;
    _addressLine2 = addressLine2;
    _image = image;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  EventModel.fromJson(dynamic json) {
    _id = json['id'];
    _lawyerId = json['lawyer_id'];
    _lawyerName = json['lawyer_name'];
    _lawFirmId = json['law_firm_id'];
    _lawFirmName = json['law_firm_name'];
    _tagIds = json['tag_ids'] != null ? json['tag_ids'].cast<num>() : [];
    if (json['tags'] != null) {
      _tags = [];
      json['tags'].forEach((v) {
        _tags?.add(Tags.fromJson(v));
      });
    }
    _name = json['name'];
    _description = json['description'];
    _slug = json['slug'];
    _isActive = json['is_active'];
    _isFeatured = json['is_featured'];
    _startsAt = json['starts_at'];
    _endsAt = json['ends_at'];
    _sponsor = json['sponsor'];
    _icon = json['icon'];
    _addressLine1 = json['address_line_1'];
    _addressLine2 = json['address_line_2'];
    _image = json['image'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  num? _lawyerId;
  String? _lawyerName;
  dynamic _lawFirmId;
  String? _lawFirmName;
  List<num>? _tagIds;
  List<Tags>? _tags;
  String? _name;
  String? _description;
  String? _slug;
  num? _isActive;
  num? _isFeatured;
  String? _startsAt;
  String? _endsAt;
  String? _sponsor;
  dynamic _icon;
  String? _addressLine1;
  String? _addressLine2;
  String? _image;
  String? _createdAt;
  String? _updatedAt;
  EventModel copyWith({
    num? id,
    num? lawyerId,
    String? lawyerName,
    dynamic lawFirmId,
    String? lawFirmName,
    List<num>? tagIds,
    List<Tags>? tags,
    String? name,
    String? description,
    String? slug,
    num? isActive,
    num? isFeatured,
    String? startsAt,
    String? endsAt,
    String? sponsor,
    dynamic icon,
    String? addressLine1,
    String? addressLine2,
    String? image,
    String? createdAt,
    String? updatedAt,
  }) =>
      EventModel(
        id: id ?? _id,
        lawyerId: lawyerId ?? _lawyerId,
        lawyerName: lawyerName ?? _lawyerName,
        lawFirmId: lawFirmId ?? _lawFirmId,
        lawFirmName: lawFirmName ?? _lawFirmName,
        tagIds: tagIds ?? _tagIds,
        tags: tags ?? _tags,
        name: name ?? _name,
        description: description ?? _description,
        slug: slug ?? _slug,
        isActive: isActive ?? _isActive,
        isFeatured: isFeatured ?? _isFeatured,
        startsAt: startsAt ?? _startsAt,
        endsAt: endsAt ?? _endsAt,
        sponsor: sponsor ?? _sponsor,
        icon: icon ?? _icon,
        addressLine1: addressLine1 ?? _addressLine1,
        addressLine2: addressLine2 ?? _addressLine2,
        image: image ?? _image,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
      );
  num? get id => _id;
  num? get lawyerId => _lawyerId;
  String? get lawyerName => _lawyerName;
  dynamic get lawFirmId => _lawFirmId;
  String? get lawFirmName => _lawFirmName;
  List<num>? get tagIds => _tagIds;
  List<Tags>? get tags => _tags;
  String? get name => _name;
  String? get description => _description;
  String? get slug => _slug;
  num? get isActive => _isActive;
  num? get isFeatured => _isFeatured;
  String? get startsAt => _startsAt;
  String? get endsAt => _endsAt;
  String? get sponsor => _sponsor;
  dynamic get icon => _icon;
  String? get addressLine1 => _addressLine1;
  String? get addressLine2 => _addressLine2;
  String? get image => _image;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['lawyer_id'] = _lawyerId;
    map['lawyer_name'] = _lawyerName;
    map['law_firm_id'] = _lawFirmId;
    map['law_firm_name'] = _lawFirmName;
    map['tag_ids'] = _tagIds;
    if (_tags != null) {
      map['tags'] = _tags?.map((v) => v.toJson()).toList();
    }
    map['name'] = _name;
    map['description'] = _description;
    map['slug'] = _slug;
    map['is_active'] = _isActive;
    map['is_featured'] = _isFeatured;
    map['starts_at'] = _startsAt;
    map['ends_at'] = _endsAt;
    map['sponsor'] = _sponsor;
    map['icon'] = _icon;
    map['address_line_1'] = _addressLine1;
    map['address_line_2'] = _addressLine2;
    map['image'] = _image;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }
}

Tags tagsFromJson(String str) => Tags.fromJson(json.decode(str));
String tagsToJson(Tags data) => json.encode(data.toJson());

class Tags {
  Tags({
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

  Tags.fromJson(dynamic json) {
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
  Tags copyWith({
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
      Tags(
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

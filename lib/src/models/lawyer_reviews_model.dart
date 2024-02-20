import 'dart:convert';

GetLawyerReviewsModel getLawyerReviewsFromJson(String str) =>
    GetLawyerReviewsModel.fromJson(json.decode(str));
String getLawyerReviewsToJson(GetLawyerReviewsModel data) =>
    json.encode(data.toJson());

class GetLawyerReviewsModel {
  GetLawyerReviewsModel({
    GetLawyerReviewsDataModel? data,
    bool? success,
    String? message,
    dynamic errors,
  }) {
    _data = data;
    _success = success;
    _message = message;
    _errors = errors;
  }

  GetLawyerReviewsModel.fromJson(dynamic json) {
    _data = json['data'] != null
        ? GetLawyerReviewsDataModel.fromJson(json['data'])
        : null;
    _success = json['success'];
    _message = json['message'];
    _errors = json['errors'];
  }
  GetLawyerReviewsDataModel? _data;
  bool? _success;
  String? _message;
  dynamic _errors;
  GetLawyerReviewsModel copyWith({
    GetLawyerReviewsDataModel? data,
    bool? success,
    String? message,
    dynamic errors,
  }) =>
      GetLawyerReviewsModel(
        data: data ?? _data,
        success: success ?? _success,
        message: message ?? _message,
        errors: errors ?? _errors,
      );
  GetLawyerReviewsDataModel? get data => _data;
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

GetLawyerReviewsDataModel dataFromJson(String str) =>
    GetLawyerReviewsDataModel.fromJson(json.decode(str));
String dataToJson(GetLawyerReviewsDataModel data) => json.encode(data.toJson());

class GetLawyerReviewsDataModel {
  GetLawyerReviewsDataModel({
    List<ReviewModel>? data,
    Links? links,
    Meta? meta,
  }) {
    _data = data;
    _links = links;
    _meta = meta;
  }

  GetLawyerReviewsDataModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(ReviewModel.fromJson(v));
      });
    }
    _links = json['links'] != null ? Links.fromJson(json['links']) : null;
    _meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }
  List<ReviewModel>? _data;
  Links? _links;
  Meta? _meta;
  GetLawyerReviewsDataModel copyWith({
    List<ReviewModel>? data,
    Links? links,
    Meta? meta,
  }) =>
      GetLawyerReviewsDataModel(
        data: data ?? _data,
        links: links ?? _links,
        meta: meta ?? _meta,
      );
  List<ReviewModel>? get data => _data;
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
    int? currentPage,
    int? from,
    int? lastPage,
    List<Links>? links,
    String? path,
    int? perPage,
    int? to,
    int? total,
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
  int? _currentPage;
  int? _from;
  int? _lastPage;
  List<Links>? _links;
  String? _path;
  int? _perPage;
  int? _to;
  int? _total;
  Meta copyWith({
    int? currentPage,
    int? from,
    int? lastPage,
    List<Links>? links,
    String? path,
    int? perPage,
    int? to,
    int? total,
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
  int? get currentPage => _currentPage;
  int? get from => _from;
  int? get lastPage => _lastPage;
  List<Links>? get links => _links;
  String? get path => _path;
  int? get perPage => _perPage;
  int? get to => _to;
  int? get total => _total;

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

ReviewModel reviewModelFromJson(String str) =>
    ReviewModel.fromJson(json.decode(str));
String reviewModelToJson(ReviewModel data) => json.encode(data.toJson());

class ReviewModel {
  ReviewModel({
    num? id,
    num? rating,
    num? experience,
    num? communication,
    num? service,
    String? comment,
    num? isActive,
    Customer? customer,
    String? createdAt,
    String? updatedAt,
  }) {
    _id = id;
    _rating = rating;
    _experience = experience;
    _communication = communication;
    _service = service;
    _comment = comment;
    _isActive = isActive;
    _customer = customer;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  ReviewModel.fromJson(dynamic json) {
    _id = json['id'];
    _rating = json['rating'];
    _experience = json['experience'];
    _communication = json['communication'];
    _service = json['service'];
    _comment = json['comment'];
    _isActive = json['is_active'];
    _customer =
        json['customer'] != null ? Customer.fromJson(json['customer']) : null;
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  num? _rating;
  num? _experience;
  num? _communication;
  num? _service;
  String? _comment;
  num? _isActive;
  Customer? _customer;
  String? _createdAt;
  String? _updatedAt;
  ReviewModel copyWith({
    num? id,
    num? rating,
    num? experience,
    num? communication,
    num? service,
    String? comment,
    num? isActive,
    Customer? customer,
    String? createdAt,
    String? updatedAt,
  }) =>
      ReviewModel(
        id: id ?? _id,
        rating: rating ?? _rating,
        experience: experience ?? _experience,
        communication: communication ?? _communication,
        service: service ?? _service,
        comment: comment ?? _comment,
        isActive: isActive ?? _isActive,
        customer: customer ?? _customer,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
      );
  num? get id => _id;
  num? get rating => _rating;
  num? get experience => _experience;
  num? get communication => _communication;
  num? get service => _service;
  String? get comment => _comment;
  num? get isActive => _isActive;
  Customer? get customer => _customer;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['rating'] = _rating;
    map['experience'] = _experience;
    map['communication'] = _communication;
    map['service'] = _service;
    map['comment'] = _comment;
    map['is_active'] = _isActive;
    if (_customer != null) {
      map['customer'] = _customer?.toJson();
    }
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }
}

Customer customerFromJson(String str) => Customer.fromJson(json.decode(str));
String customerToJson(Customer data) => json.encode(data.toJson());

class Customer {
  Customer({
    String? name,
    String? image,
  }) {
    _name = name;
    _image = image;
  }

  Customer.fromJson(dynamic json) {
    _name = json['name'];
    _image = json['image'];
  }
  String? _name;
  String? _image;
  Customer copyWith({
    String? name,
    String? image,
  }) =>
      Customer(
        name: name ?? _name,
        image: image ?? _image,
      );
  String? get name => _name;
  String? get image => _image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['image'] = _image;
    return map;
  }
}

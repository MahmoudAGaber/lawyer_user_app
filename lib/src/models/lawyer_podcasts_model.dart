import 'dart:convert';

GetLawyerPodcastsModel getLawyerPodcastsModelFromJson(String str) =>
    GetLawyerPodcastsModel.fromJson(json.decode(str));
String getLawyerPodcastsModelToJson(GetLawyerPodcastsModel data) =>
    json.encode(data.toJson());

class GetLawyerPodcastsModel {
  GetLawyerPodcastsModel({
    GetLawyerPodcastsDataModel? data,
    bool? success,
    String? message,
    dynamic errors,
  }) {
    _data = data;
    _success = success;
    _message = message;
    _errors = errors;
  }

  GetLawyerPodcastsModel.fromJson(dynamic json) {
    _data = json['data'] != null
        ? GetLawyerPodcastsDataModel.fromJson(json['data'])
        : null;
    _success = json['success'];
    _message = json['message'];
    _errors = json['errors'];
  }
  GetLawyerPodcastsDataModel? _data;
  bool? _success;
  String? _message;
  dynamic _errors;
  GetLawyerPodcastsModel copyWith({
    GetLawyerPodcastsDataModel? data,
    bool? success,
    String? message,
    dynamic errors,
  }) =>
      GetLawyerPodcastsModel(
        data: data ?? _data,
        success: success ?? _success,
        message: message ?? _message,
        errors: errors ?? _errors,
      );
  GetLawyerPodcastsDataModel? get data => _data;
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

GetLawyerPodcastsDataModel getLawyerPodcastsDataModelFromJson(String str) =>
    GetLawyerPodcastsDataModel.fromJson(json.decode(str));
String getLawyerPodcastsDataModelToJson(GetLawyerPodcastsDataModel data) =>
    json.encode(data.toJson());

class GetLawyerPodcastsDataModel {
  GetLawyerPodcastsDataModel({
    List<PodcastModel>? data,
    Links? links,
    Meta? meta,
  }) {
    _data = data;
    _links = links;
    _meta = meta;
  }

  GetLawyerPodcastsDataModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(PodcastModel.fromJson(v));
      });
    }
    _links = json['links'] != null ? Links.fromJson(json['links']) : null;
    _meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }
  List<PodcastModel>? _data;
  Links? _links;
  Meta? _meta;
  GetLawyerPodcastsDataModel copyWith({
    List<PodcastModel>? data,
    Links? links,
    Meta? meta,
  }) =>
      GetLawyerPodcastsDataModel(
        data: data ?? _data,
        links: links ?? _links,
        meta: meta ?? _meta,
      );
  List<PodcastModel>? get data => _data;
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

PodcastModel podcastModelFromJson(String str) =>
    PodcastModel.fromJson(json.decode(str));
String podcastModelToJson(PodcastModel data) => json.encode(data.toJson());

class PodcastModel {
  PodcastModel({
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
    dynamic icon,
    String? image,
    dynamic audio,
    dynamic video,
    String? linkType,
    String? fileType,
    String? fileUrl,
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
    _icon = icon;
    _image = image;
    _audio = audio;
    _video = video;
    _linkType = linkType;
    _fileType = fileType;
    _fileUrl = fileUrl;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  PodcastModel.fromJson(dynamic json) {
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
    _icon = json['icon'];
    _image = json['image'];
    _audio = json['audio'];
    _video = json['video'];
    _linkType = json['link_type'];
    _fileType = json['file_type'];
    _fileUrl = json['file_url'];
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
  dynamic _icon;
  String? _image;
  dynamic _audio;
  dynamic _video;
  String? _linkType;
  String? _fileType;
  String? _fileUrl;
  String? _createdAt;
  String? _updatedAt;
  PodcastModel copyWith({
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
    dynamic icon,
    String? image,
    dynamic audio,
    dynamic video,
    String? linkType,
    String? fileType,
    String? fileUrl,
    String? createdAt,
    String? updatedAt,
  }) =>
      PodcastModel(
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
        icon: icon ?? _icon,
        image: image ?? _image,
        audio: audio ?? _audio,
        video: video ?? _video,
        linkType: linkType ?? _linkType,
        fileType: fileType ?? _fileType,
        fileUrl: fileUrl ?? _fileUrl,
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
  dynamic get icon => _icon;
  String? get image => _image;
  dynamic get audio => _audio;
  dynamic get video => _video;
  String? get linkType => _linkType;
  String? get fileType => _fileType;
  String? get fileUrl => _fileUrl;
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
    map['icon'] = _icon;
    map['image'] = _image;
    map['audio'] = _audio;
    map['video'] = _video;
    map['link_type'] = _linkType;
    map['file_type'] = _fileType;
    map['file_url'] = _fileUrl;
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

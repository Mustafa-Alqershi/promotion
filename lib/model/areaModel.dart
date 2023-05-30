class Area {
  Area({
    required this.data,
  });
  late final List<Data> data;

  Area.fromJson(Map<String, dynamic> json){
    data = List.from(json['data']).map((e)=>Data.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = data.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Data {
  Data({
    required this.id,
    required this.name,
    required this.parent,
    required this.typeId,
    required this.desc,
    this.image,
    required this.countPeople,
    required this.lat,
    required this.lon,
    required this.createdAt,
    required this.updatedAt,
    required this.type,
  });
  late final int id;
  late final String name;
  late final int parent;
  late final int typeId;
  late final String desc;
  late final Null image;
  late final String countPeople;
  late final String lat;
  late final String lon;
  late final String createdAt;
  late final String updatedAt;
  late final Type type;

  Data.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    parent = json['parent'];
    typeId = json['type_id'];
    desc = json['desc'];
    image = null;
    countPeople = json['count_people'];
    lat = json['lat'];
    lon = json['lon'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    type = Type.fromJson(json['type']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['parent'] = parent;
    _data['type_id'] = typeId;
    _data['desc'] = desc;
    _data['image'] = image;
    _data['count_people'] = countPeople;
    _data['lat'] = lat;
    _data['lon'] = lon;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['type'] = type.toJson();
    return _data;
  }
}

class Type {
  Type({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final String name;
  late final String createdAt;
  late final String updatedAt;

  Type.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}
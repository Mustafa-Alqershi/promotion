class FieldModel {
  FieldModel({
    required this.data,
  });
  late final List<Field> data;

  FieldModel.fromJson(Map<String, dynamic> json){
    data = List.from(json['data']).map((e)=>Field.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = data.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Field {
  Field({
    required this.id,
    required this.sectorId,
    required this.name,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final int sectorId;
  late final String name;
  late final String image;
  late final String createdAt;
  late final String updatedAt;

  Field.fromJson(Map<String, dynamic> json){
    id = json['id'];
    sectorId = json['sector_id'];
    name = json['name'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['sector_id'] = sectorId;
    _data['name'] = name;
    _data['image'] = image;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}
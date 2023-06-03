class LocalWithChild {
  LocalWithChild({
    required this.id,
    required this.areaId,
    required this.memberId,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.area,
    required this.member,
  });
  LocalWithChild.empty();
  late final int id;
  late final int areaId;
  late final int memberId;
  late final int status;
  late final String createdAt;
  late final String updatedAt;
  late final Area area;
  late final Member member;

  LocalWithChild.fromJson(Map<String, dynamic> json){
    id = json['id'];
    areaId = json['area_id'];
    memberId = json['member_id'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    area = Area.fromJson(json['area']);
    member = Member.fromJson(json['member']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['area_id'] = areaId;
    _data['member_id'] = memberId;
    _data['status'] = status;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['area'] = area.toJson();
    _data['member'] = member.toJson();
    return _data;
  }
}

class Area {
  Area({
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
    required this.local,
    required this.child2,
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
  late final List<Local> local;
  late final List<ChildArea> child2;

  Area.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    parent = json['parent'];
    typeId = json['type_id'];
    desc = json['desc'];
    image = json['image'];
    countPeople = json['count_people'];
    lat = json['lat'];
    lon = json['lon'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    type = Type.fromJson(json['type']);
    local = List.from(json['local']).map((e)=>Local.fromJson(e)).toList();
    child2 = List.from(json['child2']).map((e)=>ChildArea.fromJson(e)).toList();
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
    _data['local'] = local.map((e)=>e.toJson()).toList();
    _data['child2'] = child2.map((e)=>e.toJson()).toList();
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

class Local {
  Local({
    required this.id,
    required this.areaId,
    required this.memberId,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final int areaId;
  late final int memberId;
  late final int status;
  late final String createdAt;
  late final String updatedAt;

  Local.fromJson(Map<String, dynamic> json){
    id = json['id'];
    areaId = json['area_id'];
    memberId = json['member_id'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['area_id'] = areaId;
    _data['member_id'] = memberId;
    _data['status'] = status;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}

class ChildArea {
  ChildArea({
    required this.id,
    required this.name,
    required this.parent,
    required this.typeId,
    required this.desc,
    required this.image,
    required this.countPeople,
    required this.lat,
    required this.lon,
    required this.createdAt,
    required this.updatedAt,
    required this.local,
  });
  late final int id;
  late final String name;
  late final int parent;
  late final int typeId;
  late final String desc;
  late final String image;
  late final String countPeople;
  late final String lat;
  late final String lon;
  late final String createdAt;
  late final String updatedAt;
  late final List<Local> local;

  ChildArea.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    parent = json['parent'];
    typeId = json['type_id'];
    desc = json['desc']??"";
    image = json['image']??"";
    countPeople = json['count_people'];
    lat = json['lat']??"";
    lon = json['lon']??"";
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    local = List.from(json['local']).map((e)=>Local.fromJson(e)).toList();
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
    _data['local'] = local.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Member {
  Member({
    required this.id,
    required this.theIdNum,
    required this.name,
    required this.phone,
    required this.status,
    required this.investor,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final int theIdNum;
  late final String name;
  late final String phone;
  late final int status;
  late final String investor;
  late final int userId;
  late final String createdAt;
  late final String updatedAt;

  Member.fromJson(Map<String, dynamic> json){
    id = json['id'];
    theIdNum = json['the_id_num'];
    name = json['name'];
    phone = json['phone'];
    status = json['status'];
    investor = json['investor'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['the_id_num'] = theIdNum;
    _data['name'] = name;
    _data['phone'] = phone;
    _data['status'] = status;
    _data['investor'] = investor;
    _data['user_id'] = userId;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}
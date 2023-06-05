class ProjectModel {
  ProjectModel({
    required this.data,
  });
  late final Data data;
  ProjectModel.empty();
  ProjectModel.fromJson(Map<String, dynamic> json){
    data = Data.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = data.toJson();
    return _data;
  }
}

class Data {
  Data({
    required this.projects,
  });
  late final List<Project> projects;

  Data.fromJson(Map<String, dynamic> json){
    projects = List.from(json['projects']).map((e)=>Project.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['projects'] = projects.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Project {
  Project({
    required this.id,
    required this.name,
    required this.planId,
    required this.areaId,
    required this.sectorId,
    required this.memberId,
    required this.file,
    required this.createdAt,
    required this.updatedAt,
    required this.area,
    required this.plan,
    required this.sector,
  });
  late final int id;
  late final String name;
  late final int planId;
  late final int areaId;
  late final int sectorId;
  late final int memberId;
  late final String file;
  late final String email;
  late final String createdAt;
  late final String updatedAt;
  late final Area area;
  late final Plan plan;
  late final Sector sector;

  Project.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    planId = json['plan_id'];
    areaId = json['area_id'];
    sectorId = json['sector_id'];
    memberId = json['member_id']??0;
    file = json['file'];
    email = json['user_email']??"";
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    area = Area.fromJson(json['area']);
    plan = Plan.fromJson(json['plan']);
    sector = Sector.fromJson(json['sector']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['plan_id'] = planId;
    _data['area_id'] = areaId;
    _data['sector_id'] = sectorId;
    _data['member_id'] = memberId;
    _data['file'] = file;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['area'] = area.toJson();
    _data['plan'] = plan.toJson();
    _data['sector'] = sector.toJson();
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
    required this.image,
    required this.countPeople,
    required this.lat,
    required this.lon,
    required this.createdAt,
    required this.updatedAt,
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

  Area.fromJson(Map<String, dynamic> json){
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
    return _data;
  }
}

class Plan {
  Plan({
    required this.id,
    required this.areaId,
    required this.name,
    required this.publishData,
    required this.timePeriod,
    required this.theFinancialCost,
    required this.numberOfProjects,
    required this.status,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final int areaId;
  late final String name;
  late final String publishData;
  late final String timePeriod;
  late final int theFinancialCost;
  late final int numberOfProjects;
  late final int status;
  late final String image;
  late final String createdAt;
  late final String updatedAt;

  Plan.fromJson(Map<String, dynamic> json){
    id = json['id'];
    areaId = json['area_id'];
    name = json['name'];
    publishData = json['publish_data'];
    timePeriod = json['time_period']??"";
    theFinancialCost = json['the_financial_cost'];
    numberOfProjects = json['number_of_projects'];
    status = json['status'];
    image = json['image']??"";
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['area_id'] = areaId;
    _data['name'] = name;
    _data['publish_data'] = publishData;
    _data['time_period'] = timePeriod;
    _data['the_financial_cost'] = theFinancialCost;
    _data['number_of_projects'] = numberOfProjects;
    _data['status'] = status;
    _data['image'] = image;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}

class Sector {
  Sector({
    required this.id,
    required this.name,
    this.image,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final String name;
  late final String? image;
  late final String createdAt;
  late final String updatedAt;

  Sector.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['image'] = image;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}
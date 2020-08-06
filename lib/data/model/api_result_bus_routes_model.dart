class ApiResultBusRoutesModel {
  String type;
  String version;
  String generatedTimestamp;
  Bus data;

  ApiResultBusRoutesModel(
      {this.type, this.version, this.generatedTimestamp, this.data});

  ApiResultBusRoutesModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    version = json['version'];
    generatedTimestamp = json['generated_timestamp '];
    data = json['data'] != null ? new Bus.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['version'] = this.version;
    data['generated_timestamp '] = this.generatedTimestamp;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Bus {
  String co;
  String route;
  String origTc;
  String origEn;
  String destTc;
  String destEn;
  String origSc;
  String destSc;
  String dataTimestamp;

  Bus(
      {this.co,
      this.route,
      this.origTc,
      this.origEn,
      this.destTc,
      this.destEn,
      this.origSc,
      this.destSc,
      this.dataTimestamp});

  Bus.fromJson(Map<String, dynamic> json) {
    co = json['co'];
    route = json['route'];
    origTc = json['orig_tc'];
    origEn = json['orig_en'];
    destTc = json['dest_tc'];
    destEn = json['dest_en'];
    origSc = json['orig_sc'];
    destSc = json['dest_sc'];
    dataTimestamp = json['data_timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['co'] = this.co;
    data['route'] = this.route;
    data['orig_tc'] = this.origTc;
    data['orig_en'] = this.origEn;
    data['dest_tc'] = this.destTc;
    data['dest_en'] = this.destEn;
    data['orig_sc'] = this.origSc;
    data['dest_sc'] = this.destSc;
    data['data_timestamp'] = this.dataTimestamp;
    return data;
  }
}
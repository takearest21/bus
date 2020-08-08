class ApiResultBusRoutesModel {
  String type;
  String version;
  String generatedTimestamp;
  List<BusInfo> data;

  ApiResultBusRoutesModel(
      {this.type, this.version, this.generatedTimestamp, this.data});

  ApiResultBusRoutesModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    version = json['version'];
    generatedTimestamp = json['generated_timestamp '];
     if (json['data'] != null) {
      data = new List<BusInfo>();
      json['data'].forEach((v) {
        data.add(new BusInfo.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['version'] = this.version;
    data['generated_timestamp '] = this.generatedTimestamp;
    if (this.data != null) {
        data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data.keys.toList()..sort();
    return data;
  }
}

class BusInfo {
  String co;
  String route;
  String origTc;
  String origEn;
  String destTc;
  String destEn;
  String origSc;
  String destSc;
  String dataTimestamp;

  BusInfo(
      {this.co,
      this.route,
      this.origTc,
      this.origEn,
      this.destTc,
      this.destEn,
      this.origSc,
      this.destSc,
      this.dataTimestamp});

  BusInfo.fromJson(Map<String, dynamic> json) {
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

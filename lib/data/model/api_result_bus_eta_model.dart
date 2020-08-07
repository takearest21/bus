class BusETA {
  String type;
  String version;
  String generatedTimestamp;
  List<Bus> data;

  BusETA({this.type, this.version, this.generatedTimestamp, this.data});

  BusETA.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    version = json['version'];
    generatedTimestamp = json['generated_timestamp '];
    if (json['data'] != null) {
      data = new List<Bus>();
      json['data'].forEach((v) {
        data.add(new Bus.fromJson(v));
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

    return data;
  }
}

class Bus {
  String co;
  String route;
  String dir;
  int seq;
  String stop;
  String destTc;
  String destEn;
  String eta;
  String rmkTc;
  int etaSeq;
  String destSc;
  String rmkEn;
  String rmkSc;
  String dataTimestamp;

  Bus(
      {this.co,
      this.route,
      this.dir,
      this.seq,
      this.stop,
      this.destTc,
      this.destEn,
      this.eta,
      this.rmkTc,
      this.etaSeq,
      this.destSc,
      this.rmkEn,
      this.rmkSc,
      this.dataTimestamp});

  Bus.fromJson(Map<String, dynamic> json) {
    co = json['co'];
    route = json['route'];
    dir = json['dir'];
    seq = json['seq'];
    stop = json['stop'];
    destTc = json['dest_tc'];
    destEn = json['dest_en'];
    eta = json['eta'];
    rmkTc = json['rmk_tc'];
    etaSeq = json['eta_seq'];
    destSc = json['dest_sc'];
    rmkEn = json['rmk_en'];
    rmkSc = json['rmk_sc'];
    dataTimestamp = json['data_timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['co'] = this.co;
    data['route'] = this.route;
    data['dir'] = this.dir;
    data['seq'] = this.seq;
    data['stop'] = this.stop;
    data['dest_tc'] = this.destTc;
    data['dest_en'] = this.destEn;
    data['eta'] = this.eta;
    data['rmk_tc'] = this.rmkTc;
    data['eta_seq'] = this.etaSeq;
    data['dest_sc'] = this.destSc;
    data['rmk_en'] = this.rmkEn;
    data['rmk_sc'] = this.rmkSc;
    data['data_timestamp'] = this.dataTimestamp;
    return data;
  }
}

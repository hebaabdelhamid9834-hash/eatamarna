class TripResponse {
  List<TripData>? data;
  int? total;
  int? maxPages;
  int? status;

  TripResponse({this.data, this.total, this.maxPages, this.status});

  TripResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <TripData>[];
      json['data'].forEach((v) {
        data!.add(new TripData.fromJson(v));
      });
    }
    total = json['total'];
    maxPages = json['max_pages'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['total'] = this.total;
    data['max_pages'] = this.maxPages;
    data['status'] = this.status;
    return data;
  }
}

class TripData {
  String? id;
  String? day;
  String? date;
  String? duration;
  int? price;
  String? currency;
  List<Seats>? seats;
  List<Null>? room;
  List<ExtraPrices>? extraPrices;
  TripData(
      {this.id,
        this.day,
        this.date,
        this.duration,
        this.price,
        this.currency,
        this.seats,
        this.room,this.extraPrices});

  TripData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    day = json['day'];
    date = json['date'];
    duration = json['duration'];
    price = json['price'];
    currency = json['currency']?.toString();
    if (json['seats'] != null) {
      seats = <Seats>[];
      json['seats'].forEach((v) {
        seats!.add(new Seats.fromJson(v));
      });
    }
    if (json['extra_prices'] != null) {
      extraPrices = <ExtraPrices>[];
      json['extra_prices'].forEach((v) {
        extraPrices!.add(new ExtraPrices.fromJson(v));
      });
    }
    if (json['room'] != null) {
      room = <Null>[];
      // json['room'].forEach((v) {
      //   room!.add(new Null.fromJson(v));
      // });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['day'] = this.day;
    data['date'] = this.date;
    data['duration'] = this.duration;
    data['price'] = this.price;
    data['currency'] = this.currency;
    if (this.extraPrices != null) {
      data['extra_prices'] = this.extraPrices!.map((v) => v.toJson()).toList();
    }
    if (this.seats != null) {
      data['seats'] = this.seats!.map((v) => v.toJson()).toList();
    }
    // if (this.room != null) {
    //   data['room'] = this.room!.map((v) => v!.toJson()).toList();
    // }
    return data;
  }
}

class ExtraPrices {
  String? name;
  int? price;
  String? type;
  String? perPerson;

  ExtraPrices({this.name, this.price, this.type, this.perPerson});

  ExtraPrices.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    price = json['price'];
    type = json['type'];
    perPerson = json['per_person'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['price'] = this.price;
    data['type'] = this.type;
    data['per_person'] = this.perPerson;
    return data;
  }
}
class Seats {
  String? id;
  String? label;
  String? type;
  bool? taken;
  String? status;

  Seats({this.id, this.label, this.type, this.taken, this.status});

  Seats.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    label = json['label'];
    type = json['type'];
    taken = json['taken'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['label'] = this.label;
    data['type'] = this.type;
    data['taken'] = this.taken;
    data['status'] = this.status;
    return data;
  }
}

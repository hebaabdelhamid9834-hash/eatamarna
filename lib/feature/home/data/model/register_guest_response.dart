class GuestRegisterResponse {
  String? guestToken;
  String? expiresAt;
  GuestModel? guest;
  int? status;

  GuestRegisterResponse(
      {this.guestToken, this.expiresAt, this.guest, this.status});

  GuestRegisterResponse.fromJson(Map<String, dynamic> json) {
    guestToken = json['guest_token'];
    expiresAt = json['expires_at'];
    guest = json['guest'] != null ? new GuestModel.fromJson(json['guest']) : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['guest_token'] = this.guestToken;
    data['expires_at'] = this.expiresAt;
    if (this.guest != null) {
      data['guest'] = this.guest!.toJson();
    }
    data['status'] = this.status;
    return data;
  }
}

class GuestModel {
  String? firstName;
  String? lastName;
  String? email;
  String? phone;

  GuestModel({this.firstName, this.lastName, this.email, this.phone});

  GuestModel.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['phone'] = this.phone;
    return data;
  }
}
class UrlResponse {
  String? url;

  UrlResponse({this.url});

  UrlResponse.fromJson(Map<String, dynamic> json) {
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    return data;
  }
}

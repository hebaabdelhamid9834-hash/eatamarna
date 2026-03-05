class BookingResponse {
  BookingDetails? bookingDetails;
  int? status;

  BookingResponse({this.bookingDetails, this.status});

  BookingResponse.fromJson(Map<String, dynamic> json) {
    bookingDetails = json['booking_details'] != null
        ? new BookingDetails.fromJson(json['booking_details'])
        : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.bookingDetails != null) {
      data['booking_details'] = this.bookingDetails!.toJson();
    }
    data['status'] = this.status;
    return data;
  }
}

class BookingDetails {
  String? service;
  String? date;
  String? time;
  int? totalPrice;
  String? currency;

  BookingDetails(
      {this.service, this.date, this.time, this.totalPrice, this.currency});

  BookingDetails.fromJson(Map<String, dynamic> json) {
    service = json['service'];
    date = json['date'];
    time = json['time'];
    totalPrice = json['total_price'];
    currency = json['currency'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['service'] = this.service;
    data['date'] = this.date;
    data['time'] = this.time;
    data['total_price'] = this.totalPrice;
    data['currency'] = this.currency;
    return data;
  }
}

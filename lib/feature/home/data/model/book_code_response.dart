class BookingCodeResponse {
  String? bookingCode;
  String? total;
  Null? currency;
  int? status;

  BookingCodeResponse(
      {this.bookingCode, this.total, this.currency, this.status});

  BookingCodeResponse.fromJson(Map<String, dynamic> json) {
    bookingCode = json['booking_code'];
    total = json['total'];
    currency = json['currency'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['booking_code'] = this.bookingCode;
    data['total'] = this.total;
    data['currency'] = this.currency;
    data['status'] = this.status;
    return data;
  }
}

class TermsResponse {
  String? title;
  String? content;
  int? status;

  TermsResponse({this.title, this.content, this.status});

  TermsResponse.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    content = json['content'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['content'] = this.content;
    data['status'] = this.status;
    return data;
  }
}

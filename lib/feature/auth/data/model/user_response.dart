class UserResponse {
  String? accessToken;
  User? user;
  int? status;

  UserResponse({this.accessToken, this.user, this.status});

  UserResponse.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['access_token'] = this.accessToken;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['status'] = this.status;
    return data;
  }
}

class User {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? avatarUrl;
  String? displayName;
  String? needUpdatePw;

  User(
      {this.id,
        this.firstName,
        this.lastName,
        this.email,
        this.avatarUrl,
        this.displayName,
        this.needUpdatePw});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    avatarUrl = json['avatar_url'];
    displayName = json['display_name'];
    needUpdatePw = json['need_update_pw'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['avatar_url'] = this.avatarUrl;
    data['display_name'] = this.displayName;
    data['need_update_pw'] = this.needUpdatePw;
    return data;
  }
}

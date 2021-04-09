class UserModel {
  int id;
  String firstName;
  String lastName;
  String email;
  String role;
  String avatar;
  String fullName() => this.firstName + this.lastName;

  UserModel(
      {this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.avatar,
      this.role});

  UserModel.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.firstName = json['first_name'];
    this.lastName = json['last_name'];
    this.email = json['email'];
    this.avatar = json['avatar'];
    //this.role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['avatar'] = this.avatar;
    return data;
  }
}

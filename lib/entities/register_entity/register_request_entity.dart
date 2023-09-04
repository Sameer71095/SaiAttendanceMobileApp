class RegisterRequestEntity {
  String? name;
  String? email;
  String? companyName;
  String? contact;
  String? password;

  RegisterRequestEntity({this.email, this.password,this.name,this.companyName,this.contact});

  RegisterRequestEntity.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    companyName = json['companyName'];
    contact = json['contact'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['companyName'] = this.companyName;
    data['contact'] = this.contact;
    data['password'] = this.password;
    return data;
  }
}
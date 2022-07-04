class AccountModel{
  int? status;
  String? message;
  AccountData? account;
  AccountModel.fromJson(Map<String,dynamic> json){
    status=json['status'];
    message=json['message'];
    account=json['account'] != null ? AccountData.fromJson(json['account']):null;

  }
}
class AccountData{
  int? id;
  String? name;
  String? email;
  String? phone;
  String? password;
  //AccountData(this.email,this.password,this.name,this.id,this.phone);
  AccountData.fromJson(Map<String,dynamic> json){
  name=json['name'];
  id=json['id'];
  email=json['email'];
  phone=json['phone'];
  password=json['password'];

  }
}
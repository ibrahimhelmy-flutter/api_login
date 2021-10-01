class LoginModel{
String? status;
String?message;
UserData? data;

LoginModel.fromjson(Map<String,dynamic> json){
  status=json['status'];
  message=json['message'];
  data=json['data']!=null?UserData.fromJson(json['data']):null;
}
}


class UserData{
  String? user_id;
  String ? full_name;
  String ? username;
  String? storecode;
  String ?lang;
  String ? access_token;

  UserData.fromJson(Map<String,dynamic> json){
    user_id=json['user_id'];
    full_name=json['full_name'];
    username=json['username'];
    storecode=json['storecode'];
    lang=json['lang'];
    access_token=json['access_token'];


  }

}
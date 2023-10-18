

import '../services/storage_service.dart';

class CreateAccountForm {

  String? first_name;
  String? last_name;
  String? email;
  String? password;

  String? phone;
  String? address;
  String? city;
  String? state;
  String? zip;

  CreateAccountForm({
    this.first_name,
    this.last_name,
    this.email,
    this.password,
    this.phone,
    this.address,
    this.city,
    this.state,
    this.zip,
  });
  Map<String, dynamic> toMap() {
    return {
      'First_name': first_name,
      'Last_name': last_name,
      'Email': email,
      'Password': password,
      'Phone': phone,
      'Address': address,
      'City': city,
      'State': state,
      'Zip': zip,
    };
  }
  fromJsonString(Map<String,dynamic> json){
    first_name = json["First_name"];
    last_name = json["Last_name"];
    email = json["Email"];
    password = json["Password"];
    phone = json["Phone"];
    address = json["Address"];
    city = json["City"];
    state = json["State"];
    zip = json["Zip"];
  }
  toJson(){
    return {
      "First_name":first_name,
      "Last_name":last_name,
      "Email":email,
      "Password":password,
      "Phone":phone,
      "Address":address,
      "City":city,
      "State":state,
      "Zip":zip,
    };
  }

  saveToDb() async {
    await saveUser(this);
    // DatabaseRepository db = DatabaseRepository.instance;
    // Database? database = await db.database;
    // await database!.insert('user', this.toMap());
  }
  Future<bool> login(String email,String Password)async{
    return await userlogin(email, Password);
  }
}

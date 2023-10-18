class UserModel {
  int? user_id;
  String Last_name;
  String First_name;
  String Email;
  String Password;
  String Phone;
  String Address;
  String City;
  String State;
  String Zip;
  bool IsMoral;
  toJson(){
    return {
      "user_id":user_id,
      "Last_name":Last_name,
      "First_name":First_name,
      "Email":Email,
      "Password":Password,
      "Phone":Phone,
      "Address":Address,
      "City":City,
      "State":State,
      "Zip":Zip,
      "IsMoral":IsMoral
    };
  }
  UserModel(
      {
      this.user_id,
      required this.Last_name,
      required this.First_name,
      required this.Email,
      required this.Password,
      required this.Phone,
      required this.Address,
      required this.City,
      required this.State,
      required this.Zip,
      required this.IsMoral});
}

class MoralUser extends UserModel {
  String Company_name;
  String Company_phone;
  String Company_address;
  String Company_city;
  String Company_state;
  String Company_zip;
  String Company_email;

  MoralUser(
      {required this.Company_name,
      required this.Company_phone,
      required this.Company_address,
      required this.Company_city,
      required this.Company_state,
      required this.Company_zip,
      required this.Company_email,
      required Last_name,
      required First_name,
      required Email,
      required Password,
      required Phone,
      required Address,
      required City,
      required State,
      required Zip,
      required IsMoral,
      user_id})
      : super(
            user_id: user_id,
            Last_name: Last_name,
            First_name: First_name,
            Email: Email,
            Password: Password,
            Phone: Phone,
            Address: Address,
            City: City,
            State: State,
            Zip: Zip,
            IsMoral: IsMoral);
}

import '../services/storage_service.dart';

class FormModel {
  String Social_reason;
  String Rc;
  String Quality;
  String Patente;
  String If;
  String Forme_juridique;
  String Address;
  String City;
  String Phone;
  String Email;

  //information de terrain
  String Status;
  String Nemuro;
  String Indice;

  //Geomethrie de project
  double Cadastrale;
  double CertPropriet;
  double Contonance;
  double Surface;

  String current_user_email;


  FormModel(
      {required this.Social_reason,
      required this.Rc,
      required this.Quality,
      required this.Patente,
      required this.If,
      required this.Forme_juridique,
      required this.Address,
      required this.City,
      required this.Phone,
      required this.Email,
      required this.Status,
      required this.Nemuro,
      required this.Indice,
      required this.Cadastrale,
      required this.CertPropriet,
      required this.Contonance,
      required this.Surface,
      required this.current_user_email
});
  Map<String, dynamic> toJson() {
    return {
      "Social_reason": Social_reason,
      "Rc": Rc,
      "Quality": Quality,
      "Patente": Patente,
      "If": If,
      "Forme_juridique": Forme_juridique,
      "Address": Address,
      "City": City,
      "Phone": Phone,
      "Email": Email,
      "Status": Status,
      "Nemuro": Nemuro,
      "Indice": Indice,
      "Cadastrale": Cadastrale,
      "CertPropriet": CertPropriet,
      "Contonance": Contonance,
      "Surface": Surface,
      "current_user_email":current_user_email
    };
  }

  //from json
  FormModel fromJson(Map<String, dynamic> json) {
    Social_reason = json["Social_reason"] ?? "";
    Rc = json["Rc"] ?? "";
    Quality = json["Quality"] ?? "";
    Patente = json["Patente"] ?? "";
    If = json["If"] ?? "";
    Forme_juridique = json["Forme_juridique"] ?? "";
    Address = json["Address"] ?? "";
    City = json["City"] ?? "";
    Phone = json["Phone"] ?? "";
    Email = json["Email"] ?? "";
    Status = json["Status"] ?? "";
    Nemuro = json["Nemuro"] ?? "";
    Indice = json["Indice"] ?? "";
    Cadastrale = json["Cadastrale"] ?? "";
    CertPropriet = json["CertPropriet"] ?? "";
    Contonance = json["Contonance"] ?? "";
    Surface = json["Surface"] ?? "";
    current_user_email = json["current_user_email"] ?? "";

    FormModel ret = FormModel(
        Social_reason: Social_reason,
        Rc: Rc,
        Quality: Quality,
        Patente: Patente,
        If: If,
        Forme_juridique: Forme_juridique,
        Address: Address,
        City: City,
        Phone: Phone,
        Email: Email,
        Status: Status,
        Nemuro: Nemuro,
        Indice: Indice,
        Cadastrale: Cadastrale,
        CertPropriet: CertPropriet,
        Contonance: Contonance,
        Surface: Surface,
        current_user_email: current_user_email
);
    return ret;
  }

  List<FormModel> fromJsonList(List<dynamic> json) {
    List<FormModel> ret = [];
    json.forEach((element) {
      ret.add(fromJson(element));
    });
    return ret;
  }

  //save to db
  saveToDb() async {
    await saveForm(this);
  }

}

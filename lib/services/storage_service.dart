import 'dart:convert';

import 'package:form_app/models/formModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/CreateAccountForm.dart';
import '../models/userModel.dart';

Future<dynamic> printUsers() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  //check if user already exists
  String? users = prefs.getString('users');
}

Future<bool> saveForm(FormModel form) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  //check if user already exists
  String? forms = prefs.getString('forms');
  try {
    if (forms != null) {
      List<FormModel> formList = [];

      List<dynamic> formsJson = jsonDecode(forms);

      formsJson.forEach((value) {
        FormModel formnew = FormModel(
          Social_reason: "",
          Rc: "",
          Quality: "",
          Patente: "",
          If: "",
          Forme_juridique: "",
          Address: "",
          City: "",
          Phone: "",
          Email: "",
          Status: "",
          Nemuro: "",
          Indice: "",
          Cadastrale: 0,
          CertPropriet: 0,
          Contonance: 0,
          Surface: 0,
          current_user_email: "",
        );
        formnew.fromJson(value);
        formList.add(formnew);
      });
      formList.add(form);

      String formString = jsonEncode(formList);

      await prefs.setString('forms', formString);
    } else {
      String formString = jsonEncode([form]);

      await prefs.setString('forms', formString);
    }
    return true;
  } catch (e) {
    return false;
  }
}

printForms() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  //check if user already exists
  String? forms = prefs.getString('forms');
  print("====================================");
  print(forms);
  print("====================================");
}

GetForms() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  //check if user already exists

  String forms = prefs.getString('forms') ?? "";
  List<FormModel> formList = [];
  print("here1 ${forms}");

  List<dynamic> formsss = jsonDecode(forms);

  print("here10 ${formsss}");

  formsss.forEach((element) {
    formList.add(FormModel(
      Social_reason: "",
      Rc: "",
      Quality: "",
      Patente: "",
      If: "",
      Forme_juridique: "",
      Address: "",
      City: "",
      Phone: "",
      Email: "",
      Status: "",
      Nemuro: "",
      Indice: "",
      Cadastrale: 0,
      CertPropriet: 0,
      Contonance: 0,
      Surface: 0,
      current_user_email: "",
    ).fromJson(element));
  });
  print("here2");
  return formList;
}

Future<List<FormModel>> getCurrentUserForms() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  List<FormModel> forms = await GetForms();
  print("here");
  CreateAccountForm user = await getCurrentUser();
  List<FormModel> userForms = [];
  forms.forEach((element) {
    if (element.current_user_email == user.email) {
      userForms.add(element);
    }
  });
  print("here3");
  return userForms;
}

Future<bool> saveUser(CreateAccountForm user) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  //check if user already exists

  String? users = prefs.getString('users');

  try {
    if (users != null) {
      List<CreateAccountForm> userList = [];

      List<dynamic> usersJson = jsonDecode(users);

      usersJson.forEach((value) {
        CreateAccountForm usernew = CreateAccountForm();
        usernew.fromJsonString(value);
        userList.add(usernew);
      });
      userList.add(user);

      String userString = jsonEncode(userList);

      await prefs.setString('users', userString);
    } else {
      String userString = jsonEncode([user]);

      await prefs.setString('users', userString);
    }
    return true;
  } catch (e) {
    return false;
  }
}

Future<bool> userlogin(String email, String password) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  String? users = prefs.getString('users');
  if (users == null) {
    return false;
  }
  List<CreateAccountForm> userList = [];
  List<dynamic> usersJson = jsonDecode(users);
  usersJson.forEach((value) {
    CreateAccountForm usernew = CreateAccountForm();
    usernew.fromJsonString(value);
    userList.add(usernew);
  });
  for (int i = 0; i < userList.length; i++) {
    if (userList[i].email == email && userList[i].password == password) {
      prefs.setString("currentUser", jsonEncode(userList[i]));
      return true;
    }
  }
  return false;
}

Future<CreateAccountForm> getCurrentUser() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? user = prefs.getString('currentUser');
  if (user == null) {
    return CreateAccountForm();
  }
  CreateAccountForm usernew = CreateAccountForm();
  usernew.fromJsonString(jsonDecode(user));
  return usernew;
}

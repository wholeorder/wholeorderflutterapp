import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wholeorderclient/configs/config.dart';
import 'package:wholeorderclient/methods/common_methods.dart';
import 'package:wholeorderclient/models/requests/info_entreprise.dart';
import 'package:wholeorderclient/models/requests/login_request.dart';
import 'package:wholeorderclient/models/requests/register_request.dart';
import 'package:wholeorderclient/models/requests/verifyotp_request.dart';
import 'package:wholeorderclient/models/response/categories_entreprise.dart';
import 'package:wholeorderclient/models/response/info_entreprise-response.dart';
import 'package:wholeorderclient/models/response/login_response.dart';
import 'package:wholeorderclient/models/response/register_response.dart';
import 'package:wholeorderclient/models/response/verifyotp_response.dart';
import 'package:wholeorderclient/screens/entreprise/home_entreprise.dart';
import 'package:wholeorderclient/screens/register/otp.dart';
import 'package:wholeorderclient/screens/register/upload_photo.dart';

class AuthService {
  static var client = http.Client();

  static Future<LoginResponse?> loginService(

    /* -------- Login */
      LoginRequest model, BuildContext context) async {
    try {
      Map<String, String> requestHeaders = {
        "Access-Control-Allow-Origin": "*",
        'Content-Type': 'application/json',
        'Accept': '*/*'
      };
      var url = Uri.parse(Config.apiUrl + Config.authLoginApi);
      var response = await client.post(url,
          headers: requestHeaders, body: jsonEncode(model));
      print('response de sign in ${response.body.toString()}');
      Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      LoginResponse loginResponse = LoginResponse.fromJson(jsonResponse);
      if (response.statusCode == 200) {
        return loginResponse;
      } else {
        CommonMethods commonMethods = CommonMethods();
        commonMethods.alertDialog(
          context,
          Colors.red,
          Text('Sample Text'),
          Text('Sample Text 2'),
          AssetImage('logo/png.png'),
        );
        throw Exception('fail to log user');
      }
    } catch (e) {
      throw Exception('failure api :$e');
    }
  }

  /* ------------- REGISTER */
  static Future<RegisterResponse?> registerService(
      RegisterRequest model, BuildContext context) async {
    try {
      Map<String, String> requestHeaders = {
        "Access-Control-Allow-Origin": "*",
        'Content-Type': 'application/json',
        'Accept': '*/*'
      };
      var url = Uri.parse(Config.apiUrl + Config.registerApi);
      var response = await client.post(url,
          headers: requestHeaders, body: jsonEncode(model));
      print('response de register in ${response.body.toString()}');
      Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      RegisterResponse registerResponse =
          RegisterResponse.fromJson(jsonResponse);
      if (response.statusCode == 201) {
        Navigator.push(context, MaterialPageRoute(builder: (context) => Otp()));
        return registerResponse;
      } else {
        CommonMethods commonMethods = CommonMethods();
        commonMethods.alertDialog(
          context,
          Colors.red,
          Text('Sample Text'),
          Text('Sample Text 2'),
          AssetImage('images/logo.png'),
        );
        throw Exception('fail to log user');
      }
    } catch (e) {
      throw Exception('failure api :$e');
    }
  }
   /* ------------- entrepriseinfo */
  static Future<EntrepriseInfoResponse?> entrepriseinfoService(
      EntrepriseInfoRequest model, BuildContext context) async {
    try {
      Map<String, String> requestHeaders = {
        "Access-Control-Allow-Origin": "*",
        'Content-Type': 'application/json',
        'Accept': '*/*'
      };
      var url = Uri.parse(Config.apiUrl + Config.infosentrepriseApi);
      var response = await client.post(url,
          headers: requestHeaders, body: jsonEncode(model));
      print('response de information entreprise ${response.body.toString()}');
      Map<String, dynamic> jsonResponse = jsonDecode(response.body);
       EntrepriseInfoResponse entrepriseInfoResponse =
          EntrepriseInfoResponse.fromJson(jsonResponse);
      if (response.statusCode == 201) {
        Navigator.push(context, MaterialPageRoute(builder: (context) => UploadPhoto()));
        return entrepriseInfoResponse;
      } else {
        CommonMethods commonMethods = CommonMethods();
        commonMethods.alertDialog(
          context,
          Colors.red,
          Text('Erreur'),
          Text('Veillez essaye plustard'),
          AssetImage('images/logo.png'),
        );
        throw Exception('fail to log user');
      }
    } catch (e) {
      throw Exception('failure api :$e');
    }
  }

  /* ------------ OTP */
  static Future<VerifyOtpResponse?> validationCodeService(  BuildContext context,
      VerifyOtpRequest model) async {
    try {
      Map<String, String> requestHeaders = {
        "Access-Control-Allow-Origin": "*",
        'Content-Type': 'application/json',
      };
      var url = Uri.parse(Config.apiUrl + Config.authCodeApi);
      var response = await client.post(url,
          headers: requestHeaders, body: jsonEncode(model));
      print('response verify otp ${response.body.toString()}');
      Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      VerifyOtpResponse verifyOtpResponse =
          VerifyOtpResponse.fromJson(jsonResponse);
      if (response.statusCode == 200) {
       // Navigator.push(context, MaterialPageRoute(builder: (context) => HomeEntreprise()));
        return verifyOtpResponse;
      }
     // throw Exception('erorrrr');
      
    } catch (e) {
      throw Exception('fail the otp code:$e');
    }
  }



  /* ---------------- Categories */
  static Future<CategoriesEntreprise?> categoriesEntrepriseService(
     ) async {
    try {
      Map<String, String> requestHeaders = {
        "Access-Control-Allow-Origin": "*",
        'Content-Type': 'application/json',
      };
      var url = Uri.parse(Config.apiUrl + Config.categoriesentrepriseApi);
      var response = await client.get(url,
          headers: requestHeaders, );
     // print('categories service ${response.body.toString()}');
      Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      CategoriesEntreprise categoriesEntreprise =
          CategoriesEntreprise.fromJson(jsonResponse);
      if (response.statusCode == 200) {
        // Navigator.push(context, MaterialPageRoute(builder: (context) => HomeEntreprise()));
        return categoriesEntreprise;
      }else{
         throw Exception('erorrrr');

      }
     
    } catch (e) {
      throw Exception('fail the otp code:$e');
    }
  }

}

import 'dart:convert';
import 'package:http/http.dart' as http;

Future registerAgency(
  String nom,
  String matricule,
  String numcnss,
  String statutlegale,
  String secteuractivite,
  String email,
    String password

) async {
  String url = 'http://10.0.2.2:3000/agency/register';

  Uri url2 = Uri.parse(url);
  try {
    final response = await http.post(url2,
        headers: {"Content-Type": "application/json; charset=UTF-8"},
        body: json.encode({
          'nameagency': nom,
          'matricule': matricule,
          'num_cnss': numcnss,
          'business_sector': secteuractivite,
          'legal_status': statutlegale,
          'email': email,
          "password" : password
        }));
    //var convertedJson = json.decode(response.body);
    return response;
  } catch (e) {
    print(e);
  }
}

Future loginAgency(
  String password,
  String email,
) async {
  String url = 'http://10.0.2.2:3000/agency/login';

  Uri url2 = Uri.parse(url);
  try {
    final response = await http.post(url2,
        headers: {"Content-Type": "application/json; charset=UTF-8"},
        body: json.encode({
          'credentels': email,
          'password': password,
        }));
     //var convertedJson = json.decode(response.body);
    return response;
  } catch (e) {
    // print(e);
  }
}

Future forgetPassword(String email) async {
  String url = 'http://10.0.2.2:3000/agency//password/forgetpassword';

  Uri url2 = Uri.parse(url);
  try {
    final response = await http.post(url2,
        headers: {"Content-Type": "application/json; charset=UTF-8"},
        body: json.encode({'email': email}));
    //var convertedJson = json.decode(response.body);
    return response;
  } catch (e) {
     print(e);
  }
}

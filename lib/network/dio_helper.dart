import 'dart:convert';

import 'package:http/http.dart' as http;

class Services {
  Services() {
    deta();
  }
  deta() async {
    await getgolddata();
    await getsilverdata();
  }

  List<dynamic> goldlist = [];
  List<dynamic> silverlist = [];
  Future<List> getgolddata() async {
    var url = Uri.parse('https://www.goldapi.io/api/XAU/EGP/');
    var response = await http
        .get(url, headers: {'x-access-token': 'goldapi-12t49mtl5b4igf5-io'});
    var responseBody = json.decode(response.body);
    goldlist.add(responseBody);
    return goldlist;
  }

  Future<List> getsilverdata() async {
    var url = Uri.parse('https://www.goldapi.io/api/XAG/EGP/');
    var response = await http
        .get(url, headers: {'x-access-token': 'goldapi-12t49mtl5b4igf5-io'});
    var responseBody = json.decode(response.body);
    silverlist.add(responseBody);
    return silverlist;
  }
}

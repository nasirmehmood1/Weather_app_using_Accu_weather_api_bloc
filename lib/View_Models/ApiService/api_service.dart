import "dart:convert";
import 'dart:developer' as developer;
import "package:http/http.dart" as http;

abstract class ApiService {
  String get baseUrl;
  String get ApiUrl;
  String get url => baseUrl + ApiUrl;

  dynamic fetch({String endPoints = ""}) async {
    // developer.log("..  ${url + endPoints}");

    var response = await http.get(Uri.parse(url + endPoints));
    // developer.log("Response is ... ${response.body}");

    if (response.statusCode == 200) {
      // developer.log("Decoded response ......... ${jsonDecode(response.body)}");
      return jsonDecode(response.body);
    } else {
      return null;
    }
  }
}

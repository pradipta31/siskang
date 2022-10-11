import 'package:get/get.dart';

const String domain = "siska-ng.site";
const String staticPath = "/Siska_api";

Uri getUriEndpoint(String authority, String unencodedPath, [Map<String, dynamic>? queryParam]) {
  return Uri.https(authority, unencodedPath, queryParam);
}

bool responseChecker(Response<dynamic> value) {
  if (value.isOk && value.body != null && value.body != "null") {
    return true;
  }
  return false;
}

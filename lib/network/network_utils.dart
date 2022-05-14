import 'dart:convert';
import 'dart:io';
import 'package:social/constants/shared_preference_constant.dart';
import 'package:social/views/styles/b_style.dart';
import 'package:http/http.dart';
import 'package:http_parser/http_parser.dart';
import 'package:nb_utils/nb_utils.dart';

import 'api.dart';

class Network {
  static String noInternetMessage = "Check your connection!";

  static getRequest(String endPoint, {bool requireToken = true, bool noBaseUrl = false}) async {
    if (await isNetworkAvailable()) {
      Response response;

      var accessToken = getStringAsync(TOKEN);

      var headers = {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      };

      if (requireToken) {
        var header = {"Authorization": "Bearer $accessToken"};
        headers.addAll(header);
      }

      print('\nURL: ${API.BASE}$endPoint');
      print("Headers: $headers\n");
      if (requireToken) {
        response = await get(Uri.parse('${API.BASE}$endPoint'), headers: headers);
      } else if (noBaseUrl) {
        response = await get(Uri.parse('$endPoint'));
      } else {
        response = await get(Uri.parse('${API.BASE}$endPoint'));
      }

      return response;
    } else {
      throw noInternetMessage;
    }
  }

  static postRequest(String endPoint, body, {bool requireToken = true}) async {
    if (await isNetworkAvailable()) {
      var accessToken = getStringAsync(TOKEN);

      var headers = {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      };

      if (requireToken) {
        var header = {"Authorization": "Bearer $accessToken"};
        headers.addAll(header);
      }

      print('\nURL: ${API.BASE}$endPoint');
      print("Headers: $headers");
      print('Request Body: ${jsonEncode(body)}\n');

      Response response = await post(Uri.parse('${API.BASE}' + '$endPoint'), body: jsonEncode(body), headers: headers);

      //print('Response: $response');

      return response;
    } else {
      throw noInternetMessage;
    }
  }

  static multiPartRequest(
    String endPoint,
    String methodName, {
    body,
    File file,
    String filename,
    String fileFieldName,
    String type,
    String subType,
  }) async {
    if (await isNetworkAvailable()) {
      /// MultiPart request ///
      var request = MultipartRequest(
        methodName.toUpperCase(),
        Uri.parse('${API.BASE}' + '$endPoint'),
      );
      print('URL: ${API.BASE}$endPoint');

      var accessToken = getStringAsync(TOKEN);

      Map<String, String> headers = {
        "Authorization": "Bearer $accessToken",
      };

      if (file != null && filename != null) {
        request.files.add(
          MultipartFile(
            'file',
            file.readAsBytes().asStream(),
            file.lengthSync(),
            filename: filename,
            contentType: MediaType(type, subType),
          ),
        );
      }

      request.headers.addAll(headers);
      if (body != null) request.fields.addAll((body));

      print('Headers: ${request.headers}');
      print('Request: $request');
      StreamedResponse streamedResponse = await request.send();
      Response response = await Response.fromStream(streamedResponse);
      print('Response: ${response.statusCode} ${response.body}');
      return response;
    } else {
      throw noInternetMessage;
    }
  }

  static handleResponse(Response response) async {
    if (!await isNetworkAvailable()) {
      toast('No network available');
    } else if (response.statusCode >= 200 && response.statusCode <= 210) {
      print('\nSuccessCode: ${response.statusCode}');
      print('SuccessResponse: ${response.body}\n');
      if (response.body.isNotEmpty)
        return json.decode(response.body);
      else
        return response.body;
    } else {
      print('\nErrorCode: ${response.statusCode}');
      print("ErrorResponse: ${response.body}\n");

      if (response.statusCode == 403) {
        /// Session expired
        toast('Session expired! Login to continue...', bgColor: KColor.primary);

        setValue(LOGGED_IN, false);
        // NavigationService.navigateToReplacement(CupertinoPageRoute(builder: (_) => LoginScreen()));
      } else if (response.statusCode == 422) {
        /// Custom validation message
        toast(
          '${jsonDecode(response.body)['errors'][0]['message']}',
          bgColor: KColor.primary,
        );
      } else if (response.statusCode == 401) {
        /// Custom message
        toast(
          '${jsonDecode(response.body)['message']}',
          bgColor: KColor.primary,
        );
      } else {
        toast('Something went wrong!', bgColor: KColor.primary);
      }
    }
  }
}

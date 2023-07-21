import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:http/http.dart' as http;

import '../utility/json_utility.dart';

class MarvelRest {
  /// marvel key
  static const marvelPublicKey = '7cc3e7f68d4f06a11a667f422300405c';
  static const marvelPrivateKey = '894cc7baf391cd4b435c2e9ab4fd51e2c9c00b2b';

  /// rest api url
  static const urlMarvelApi = 'gateway.marvel.com';

  /// limit for fetching data
  static const limit = 20;

  /// params
  static const paramApiKey = 'apikey';
  static const paramHash = 'hash';
  static const paramTimeStamp = 'ts';
  static const paramLimit = 'limit';

  /// codes
  static const int codeSuccess = 200;
  static const int codeParamFailed = 409;

  /// response key
  static const keyData = 'data';
  static const keyResults = 'results';

  /// generate the hash for calling marvel api
  /// input string : timeStamp+ private key + public key
  ///
  /// return md5 hash string
  static String generateHash({
    required String ts,
  }) {
    if (ts.isEmpty) {
      return '';
    }

    final String strKey = ts + marvelPrivateKey +marvelPublicKey;
    return md5.convert(utf8.encode(strKey)).toString();
  }

  /// send http get request.
  ///
  /// return response
  static Future<RestResponse> httpGetRequest({
    required Uri uri,
  }) {

    return http.get(uri,).then((response) {
      if (response.statusCode == codeSuccess) {
        return RestResponse.fromJson(json.decode(response.body));
      } else {
        return RestResponse(status: false, msg: 'error');
      }
    }).catchError((exception, stackTrace) {
      return RestResponse(status: false, msg: 'Network error');
    });
  }

  /// get the default header
  static Map<String, String> _getDefaultHeader() {
    int timeStamp = DateTime.now().millisecondsSinceEpoch;

    return {
      paramApiKey: marvelPublicKey,
      paramTimeStamp: '$timeStamp',
      paramHash: generateHash(ts: '$timeStamp'),
    };
  }

  /// get param header
  static Map<String, String> getHeader({
    int? limit,
  }) {
    final header = _getDefaultHeader();

    limit = limit ?? MarvelRest.limit;
    header[paramLimit] = '$limit';

    return header;
  }
}

/// response model
class RestResponse {
  static const keyStatus = 'status';
  static const keyMsg = 'message';
  static const keyBody = 'data';

  /// response status
  bool status;

  /// response message
  String msg;

  /// map body
  Map<String, dynamic> body;

  /// response model
  RestResponse({
    this.status=false,
    this.msg='',
    this.body = const {},
  });

  factory RestResponse.fromJson(Map<String, dynamic> map){

    int code = JsonUtility.getIntValueFromMap(map, 'code', 0);
    bool status = false;
    if (code == 200) {
      status = true;
    }
    String msg = JsonUtility.getStringValueFromMap(map, keyMsg, '');
    Map<String, dynamic> body = JsonUtility.getMapValueFromMap(map, keyBody, {});

    return RestResponse(
      status: status,
      msg: msg,
      body: body,
    );
  }

}
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:first_app/util/constant.dart';
import 'package:first_app/util/device_utils.dart';
import 'package:sp_util/sp_util.dart';

class AuthInterceptor extends Interceptor {

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final String accessToken = SpUtil.getString(Constant.accessToken)!;
    if (accessToken.isNotEmpty) {
      options.headers['Authorization'] = 'token $accessToken';
    }

    if (!Device.isWeb) {
      options.headers['User-Agent'] = 'Mozilla/5.0';
    }

    super.onRequest(options, handler);
  }
}

class TokenInterceptor extends Interceptor {
  Dio? _tokenDio;

  Future<String ?> getToken() async {

    final Map<String, String> params = <String, String>{};
    params['refresh_token'] = SpUtil.getString(Constant.refreshToken)!;
    try {
      // 下面语句等价：_tokenDio = _tokenDio ?? Dio();
      _tokenDio ??= Dio();
      // _tokenDio!.options =
    } catch(e) {

    }
  }

}

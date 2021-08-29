import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';
import 'package:first_app/util/constant.dart';

/// 默认 Dio 的配置
int _connectTimeout = 20000;
int _receiveTimeout = 20000;
int _sendTimeout = 10000;
String _baseUrl = '';
List<Interceptor> _interceptors = [];

/// 初始 Dio 的配置
void configDio({
  int? connectTimeout,
  int? receiveTimeout,
  int? sendTimeout,
  String? baseUrl,
  List<Interceptor>? interceptors,
}) {
  _connectTimeout = connectTimeout ?? _connectTimeout;
  _receiveTimeout = receiveTimeout ?? _receiveTimeout;
  _sendTimeout = sendTimeout ?? _sendTimeout;
  _baseUrl = baseUrl ?? _baseUrl;
  _interceptors = interceptors ?? _interceptors;
}

typedef NetSuccessCallback<T> = Function(T data);
typedef NetSuccessListCallback<T> = Function(List<T> data);
typedef NetErrorCallback = Function(int code, String msg);

class DioUtils {

  // static final DioUtils _singleton =
  // factory DioUtils() => _singleton;

  static late Dio _dio;
  Dio get dio => _dio;

  /// 单例对象
  static DioUtils? _instance;

  /// 内部构造方法，可避免外部暴露构造函数，进行实例化
  DioUtils._internal();

  /// 工厂构造方法，这里使用命名构造函数方式进行声明
  factory DioUtils.getInstance() => _getInstance();

  /// 获取单例内部方法
  static _getInstance() {
    // 只能有一个实例
    if (_instance == null) {
      _instance = DioUtils._internal();

      final BaseOptions _options = BaseOptions(
        connectTimeout: _connectTimeout,
        receiveTimeout: _receiveTimeout,
        sendTimeout: _sendTimeout,
        responseType: ResponseType.plain,
        validateStatus: (_) {
          // 不使用http状态码判断状态，使用AdapterInterceptor来处理（适用于标准REST风格）
          return true;
        },
        baseUrl: _baseUrl,
      );
      _dio = Dio(_options);
      /// 添加拦截器
      void addInterceptor(Interceptor interceptor) {
        _dio.interceptors.add(interceptor);
      }
      _interceptors.forEach(addInterceptor);
    }

    return _instance;
  }

}
import 'package:first_app/util/constant.dart';

class BaseEntity<T> {

  BaseEntity(this.code, this.message, this.data);

  int? code;
  late String message;
  T? data;

}

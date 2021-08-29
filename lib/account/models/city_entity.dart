import 'package:first_app/generated/json/base/json_convert_content.dart';

class CityEntity with JsonConvert<CityEntity> {
	String name;
	String cityCode;
	String firstCharacter;
}

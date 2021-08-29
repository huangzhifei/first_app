import 'package:first_app/generated/json/base/json_convert_content.dart';

class TestBankEntity with JsonConvert<TestBankEntity> {
	late double id;
	late String bankName;
	late String firstLetter;
}

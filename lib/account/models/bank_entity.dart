import 'package:first_app/generated/json/base/json_convert_content.dart';

class BankEntity with JsonConvert<BankEntity> {

	BankEntity({this.id, this.bankName, this.firstLetter});

	int? id;
	String? bankName;
	String? firstLetter;

}

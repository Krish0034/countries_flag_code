import 'package:json_annotation/json_annotation.dart';

part 'country.g.dart';

@JsonSerializable()
class Country {
  String? name;
  String? code;
  String? emoji;
  String? unicode;
  String? image;
  @JsonKey(name: 'dial_code')
  String? dialCode;

  Country({
    this.name,
    this.code,
    this.emoji,
    this.unicode,
    this.image,
    this.dialCode,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    return _$CountryFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CountryToJson(this);
}

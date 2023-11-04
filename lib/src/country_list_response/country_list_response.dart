import 'package:json_annotation/json_annotation.dart';

import 'country.dart';

part 'country_list_response.g.dart';

@JsonSerializable()
class CountryListResponse {
  List<Country>? country;

  CountryListResponse({this.country});

  factory CountryListResponse.fromJson(Map<String, dynamic> json) {
    return _$CountryListResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CountryListResponseToJson(this);
}

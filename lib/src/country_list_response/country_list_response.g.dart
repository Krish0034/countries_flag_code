// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CountryListResponse _$CountryListResponseFromJson(Map<String, dynamic> json) =>
    CountryListResponse(
      country: (json['country'] as List<dynamic>?)
          ?.map((e) => Country.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CountryListResponseToJson(
        CountryListResponse instance) =>
    <String, dynamic>{
      'country': instance.country,
    };

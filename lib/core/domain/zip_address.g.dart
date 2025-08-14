// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'zip_address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ZipAddress _$ZipAddressFromJson(Map<String, dynamic> json) => ZipAddress(
  zipcode: json['zipcode'] as String,
  address1: json['address1'] as String,
  address2: json['address2'] as String,
  address3: json['address3'] as String,
);

Map<String, dynamic> _$ZipAddressToJson(ZipAddress instance) =>
    <String, dynamic>{
      'zipcode': instance.zipcode,
      'address1': instance.address1,
      'address2': instance.address2,
      'address3': instance.address3,
    };

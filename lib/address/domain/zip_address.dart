import 'package:json_annotation/json_annotation.dart';

part 'zip_address.g.dart';

@JsonSerializable()
class ZipAddress {
  const ZipAddress({
    required this.zipcode,
    required this.address1,
    required this.address2,
    required this.address3,
  });

  factory ZipAddress.fromJson(Map<String, dynamic> json) =>
      _$ZipAddressFromJson(json);
  final String zipcode;
  final String address1; // address1
  final String address2; // address2
  final String address3;
  Map<String, dynamic> toJson() => _$ZipAddressToJson(this);
}

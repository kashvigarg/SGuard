// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'locations.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LatLng _$LatLngFromJson(Map<String, dynamic> json) => LatLng(
      (json['lat'] as num).toDouble(),
      (json['lng'] as num).toDouble(),
    );

Map<String, dynamic> _$LatLngToJson(LatLng instance) => <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
    };

Region _$RegionFromJson(Map<String, dynamic> json) => Region(
      LatLng.fromJson(json['coords'] as Map<String, dynamic>),
      json['id'] as String,
      json['name'] as String,
      (json['zoom'] as num).toDouble(),
    );

Map<String, dynamic> _$RegionToJson(Region instance) => <String, dynamic>{
      'coords': instance.coords,
      'id': instance.id,
      'name': instance.name,
      'zoom': instance.zoom,
    };

Office _$OfficeFromJson(Map<String, dynamic> json) => Office(
      json['address'] as String,
      json['id'] as String,
      json['image'] as String,
      (json['lat'] as num).toDouble(),
      (json['lng'] as num).toDouble(),
      json['name'] as String,
      json['phone'] as String,
      json['region'] as String,
    );

Map<String, dynamic> _$OfficeToJson(Office instance) => <String, dynamic>{
      'address': instance.address,
      'id': instance.id,
      'image': instance.image,
      'lat': instance.lat,
      'lng': instance.lng,
      'name': instance.name,
      'phone': instance.phone,
      'region': instance.region,
    };

Locations _$LocationsFromJson(Map<String, dynamic> json) => Locations(
      offices: (json['offices'] as List<dynamic>)
          .map((e) => Office.fromJson(e as Map<String, dynamic>))
          .toList(),
      regions: (json['regions'] as List<dynamic>)
          .map((e) => Region.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LocationsToJson(Locations instance) => <String, dynamic>{
      'offices': instance.offices,
      'regions': instance.regions,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Product _$$_ProductFromJson(Map<String, dynamic> json) => _$_Product(
      idx: json['idx'] as int,
      itemId: json['item_id'] as int,
      itemName: json['item_name'] as String,
      price: json['price'] as int,
      seller: json['seller'] as String,
      imageUrl: json['imageUrl'] as String? ??
          "./assets/images/products/no_image.jpg",
      type: json['type'] as String,
    );

Map<String, dynamic> _$$_ProductToJson(_$_Product instance) =>
    <String, dynamic>{
      'idx': instance.idx,
      'item_id': instance.itemId,
      'item_name': instance.itemName,
      'price': instance.price,
      'seller': instance.seller,
      'imageUrl': instance.imageUrl,
      'type': instance.type,
    };

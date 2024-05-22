// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flutter/src/material/dropdown.dart';

import 'address_model.dart';

class BranchResult {
  String? status;
  String? message;
  List<Branch>? branchList;
  Branch? branch;

  BranchResult({this.status, this.message, this.branchList});

  BranchResult.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    branch = json['data'] != null ? Branch.fromJson(json['data']) : Branch();
  }
  BranchResult.listFromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      branchList = <Branch>[];
      json['data'].forEach((v) {
        branchList?.add(Branch.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    data['data'] = branchList?.map((v) => v.toJson()).toList();
    return data;
  }
}

class Branch {
  late String id,
      name,
      telPhoneNo,
      mobNo,
      postOfficeNo,
      location,
      taxRegistrationNo,
      landmark,
      addressType,
      image;
  late double latitude, longitude, distance, rating;
  List<String>? serviceList;

  Branch({
    this.id = '',
    this.name = '',
    this.telPhoneNo = '',
    this.mobNo = '',
    this.postOfficeNo = '',
    this.location = '',
    this.landmark = '',
    this.addressType = '',
    this.latitude = 0.0,
    this.longitude = 0.0,
    this.image = '',
    this.rating = 0,
    this.distance = 0.0,
    this.taxRegistrationNo = '',
    this.serviceList = const [],
  });

  Branch.fromJson(Map<String, dynamic> json) {
    id = json['_id'] ?? '';
    name = json['name'] ?? "";
    location = json['location'] ?? "";
    landmark = json['landMark'] ?? "";
    addressType = json['addressType'] ?? "";
    latitude = json['latitude'] ?? 0.0;
    longitude = json['longitude'] ?? 0.0;
    telPhoneNo = json['tel'] ?? '';
    mobNo = json['mob'] ?? '';
    postOfficeNo = json['po'] ?? '';
    taxRegistrationNo = json['trn'] ?? '';
    image = json['image'] ?? "";
    rating =
        json['rating'] != null ? double.parse(json['rating'].toString()) : 0;
    if (json['serviceId'] != null) {
      serviceList = json['serviceId'].cast<String>();
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['location'] = location;
    data['landMark'] = landmark;
    data['longitude'] = longitude;
    data['latitude'] = latitude;
    data['image'] = image;
    data['serviceId'] = serviceList;
    data['tel'] = telPhoneNo;
    data['mob'] = mobNo;
    data['po'] = postOfficeNo;
    data['trn'] = taxRegistrationNo;
    return data;
  }

  Map<String, dynamic> toPost() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['addressType'] = addressType;
    data['location'] = location;
    data['landMark'] = landmark;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['image'] = image;
    data['tel'] = telPhoneNo;
    data['mob'] = mobNo;
    data['po'] = postOfficeNo;
    data['trn'] = taxRegistrationNo;
    log('tel post');
    log(data['tel'].toString());
    return data;
  }

  Branch copyWith({
    String? id,
    name,
    location,
    landmark,
    addressType,
    image,
    telPhoneNo,
    mobNo,
    postOfficeNo,
    taxRegistrationNo,
    double? latitude,
    longitude,
    distance,
    rating,
    List<String>? serviceList,
  }) {
    return Branch(
      id: id ?? this.id,
      name: name ?? this.name,
      location: location ?? this.location,
      landmark: landmark ?? this.landmark,
      addressType: addressType ?? this.addressType,
      image: image ?? this.image,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      distance: distance ?? this.distance,
      rating: rating ?? this.rating,
      serviceList: serviceList ?? this.serviceList,
      telPhoneNo: telPhoneNo ?? this.telPhoneNo,
      mobNo: mobNo ?? this.mobNo,
      postOfficeNo: postOfficeNo ?? this.postOfficeNo,
      taxRegistrationNo: taxRegistrationNo ?? this.taxRegistrationNo,
    );
  }

  map(DropdownMenuItem<String> Function(dynamic branch) param0) {}
}

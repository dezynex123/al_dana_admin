import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:developer';
import '../../../data/constants/api_routes.dart';
import '../../../data/constants/common.dart';
import '../../../data/constants/keys.dart';
import '../../../data/models/invoice.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

class InvoiceProvider extends ChangeNotifier {
  Invoice? _inovoice;
  bool _isLoading = true;
  bool _hasError = false;

  Invoice? get invoice => _inovoice;
  bool get isLoading => _isLoading;
  bool get hasError => _hasError;

  Future<void> fetchInvoice(String bookingId) async {
    try {
      _isLoading = true;
      final response = await http.get(
        Uri.parse("$apiGetInvoice/$bookingId"),
        headers: <String, String>{
          'Authorization': 'Bearer ${storage.read(auth)}',
        },
      );
      log(response.statusCode.toString());
      log(response.body.toString());
      if (response.statusCode == 200) {
        _inovoice = Invoice.fromJson(jsonDecode(response.body));
        _hasError = false;
      } else {
        _inovoice = null;
        _hasError = true;
      }
    } catch (error) {
      log(error.toString());
      _inovoice = null;
      _hasError = true;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

import '../../routes/app_pages.dart';
import '../data.dart';

final storage = GetStorage();

pickDate({
  DateTime? initDate,
  DateTime? firstDate,
  DateTime? lastDate,
}) async {
  var selectedDate = DateTime.now();
  DateTime? pickedDate = await showDatePicker(
    context: Get.context!,
    initialDate: initDate ?? DateTime.now(),
    firstDate: firstDate ?? DateTime(1900),
    lastDate: lastDate ?? DateTime(2050),

    initialEntryMode: DatePickerEntryMode.calendarOnly,
    // initialDatePickerMode: DatePickerMode.year,
    helpText: 'Select Date',
    cancelText: 'Close',
    confirmText: 'Confirm',
    errorFormatText: 'Enter valid date',
    errorInvalidText: 'Enter valid date range',
    fieldLabelText: 'Date',
    fieldHintText: 'Month/Date/Year',
    // selectableDayPredicate: disableDate
  );
  if (pickedDate != null && pickedDate != selectedDate) {
    selectedDate = pickedDate;
  }

  return selectedDate;
}

final DateFormat outputDateFormat = DateFormat('dd-MM-yyyy');
final DateFormat outputDateFormat2 = DateFormat('EEE, dd MMM yyyy');
final DateFormat outputDateFormat3 = DateFormat('dd MMM yyyy, HH:mm:ss');

class Common {
  User currentUser = User.fromJson(storage.read(user_details) ?? {});
  Branch selectedBranch = Branch.fromJson(storage.read(selected_branch) ?? {});
  Vehicle selectedVehicle =
      Vehicle.fromJson(storage.read(selected_vehicle) ?? {});
  ServiceMode selectedMode =
      ServiceMode.fromJson(storage.read(selected_mode) ?? {});
  List<dynamic> selectedServiceList = storage.read(selected_service) ?? [];
}

class Auth {
  Map<String, String> requestHeaders = {
    'Connection': 'keep-alive',
    'Accept': '*/*',
    'Accept-Encoding': 'gzip, deflate, br',
    'Authorization': 'Bearer ${storage.read(auth)}',
  };

  authFailed(message) {
    Get.dialog(
      WillPopScope(
        onWillPop: () async => false,
        child: AlertDialog(
          title: Text(
            "Failure",
            style: tsPoppins(color: primary, weight: FontWeight.w600, size: 18),
          ),
          content: Text(
            "$message ",
            style:
                tsPoppins(color: textDark40, weight: FontWeight.w400, size: 12),
          ),
          actions: <Widget>[
            TextButton(
              child: Text("Ok",
                  style: tsPoppins(
                      color: textDark80, weight: FontWeight.w600, size: 14)),
              onPressed: () {
                storage.erase();
                Get.offAllNamed(Routes.AUTH);
                Get.back();
              },
            ),
          ],
        ),
      ),
      barrierDismissible: false,
    );
  }
}

double calculateDistance(lat1, lon1, lat2, lon2) {
  var p = 0.017453292519943295;
  var c = cos;
  var a = 0.5 -
      c((lat2 - lat1) * p) / 2 +
      c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
  return 12742 * asin(sqrt(a));
}

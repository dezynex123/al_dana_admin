import 'dart:developer';

import 'package:al_dana_admin/app/data/constants/api_routes.dart';
import 'package:get/get.dart';

import '../constants/common.dart';
import '../models/booking_model.dart';

class BookingProvider extends GetConnect {
  Future<BookingResult> getBookingHistory({
    String date = "",
    String branchId = "",
    String serviceManagerId = "",
    String technicianId = "",
  }) async {
    BookingResult result;
    log('With date');
    log(date.toString());

    if (serviceManagerId != "") {
      if ((date == "" || date.isEmpty || date == "null") &&
          (branchId == "" || branchId.isEmpty || branchId == "null")) {
        log('without date called');
        final response = await get(
          "$apiGetListBooking?filter[serviceManagerId]=$serviceManagerId",
          headers: Auth().requestHeaders,
        );
        log("$apiGetListBooking?filter[serviceManagerId]=$serviceManagerId");
        if (response.statusCode == 200) {
          result = BookingResult.fromJson(response.body);
          log(response.statusCode.toString());
        } else {
          result = BookingResult.fromJson(
              {"status": "error", "message": "Server error !", "data": []});
        }
      } else if (branchId != "" && date == "") {
        final response = await get(
          "$apiGetListBooking?filter[branchId]=$branchId&filter[serviceManagerId]=$serviceManagerId",
          headers: Auth().requestHeaders,
        );
        if (response.statusCode == 200) {
          result = BookingResult.fromJson(response.body);
          log(response.statusCode.toString());
        } else {
          result = BookingResult.fromJson(
              {"status": "error", "message": "Server error !", "data": []});
        }
      } else if (branchId != "" && date != "") {
        final response = await get(
          "$apiGetListBooking?filter[date]=$date&filter[branchId]=$branchId&filter[serviceManagerId]=$serviceManagerId",
          headers: Auth().requestHeaders,
        );
        if (response.statusCode == 200) {
          result = BookingResult.fromJson(response.body);
          log(response.statusCode.toString());
        } else {
          result = BookingResult.fromJson(
              {"status": "error", "message": "Server error !", "data": []});
        }
      } else {
        log('with date called');
        final response = await get(
          "$apiGetListBooking?filter[date]=$date&filter[serviceManagerId]=$serviceManagerId",
          headers: Auth().requestHeaders,
        );
        log("$apiGetListBooking?filter[date]=$date&filter[serviceManagerId]=$serviceManagerId");
        if (response.statusCode == 200) {
          result = BookingResult.fromJson(response.body);
          log(response.statusCode.toString());
        } else {
          result = BookingResult.fromJson(
              {"status": "error", "message": "Server error !", "data": []});
        }
      }
    }
    // else if
    else if (technicianId != "") {
      if ((date == "" || date.isEmpty || date == "null") &&
          (branchId == "" || branchId.isEmpty || branchId == "null")) {
        log('without date called');
        final response = await get(
          "$apiGetListBooking?filter[technicianId]=$technicianId",
          headers: Auth().requestHeaders,
        );
        if (response.statusCode == 200) {
          result = BookingResult.fromJson(response.body);
          log(response.statusCode.toString());
        } else {
          result = BookingResult.fromJson(
              {"status": "error", "message": "Server error !", "data": []});
        }
      } else if (branchId != "" && date == "") {
        final response = await get(
          "$apiGetListBooking?filter[branchId]=$branchId&filter[technicianId]=$technicianId",
          headers: Auth().requestHeaders,
        );
        if (response.statusCode == 200) {
          result = BookingResult.fromJson(response.body);
          log(response.statusCode.toString());
        } else {
          result = BookingResult.fromJson(
              {"status": "error", "message": "Server error !", "data": []});
        }
      } else if (branchId != "" && date != "") {
        final response = await get(
          "$apiGetListBooking?filter[date]=$date&filter[branchId]=$branchId&filter[technicianId]=$technicianId",
          headers: Auth().requestHeaders,
        );
        if (response.statusCode == 200) {
          result = BookingResult.fromJson(response.body);
          log(response.statusCode.toString());
        } else {
          result = BookingResult.fromJson(
              {"status": "error", "message": "Server error !", "data": []});
        }
      } else {
        log('with date called');
        final response = await get(
          "$apiGetListBooking?filter[date]=$date&filter[technicianId]=$technicianId",
          headers: Auth().requestHeaders,
        );
        if (response.statusCode == 200) {
          result = BookingResult.fromJson(response.body);
          log(response.statusCode.toString());
        } else {
          result = BookingResult.fromJson(
              {"status": "error", "message": "Server error !", "data": []});
        }
      }
    }
    //else
    else {
      if ((date == "" || date.isEmpty || date == "null") &&
          (branchId == "" || branchId.isEmpty || branchId == "null")) {
        log('without date called');
        final response = await get(
          apiGetListBooking,
          headers: Auth().requestHeaders,
        );
        if (response.statusCode == 200) {
          result = BookingResult.fromJson(response.body);
          log(response.statusCode.toString());
        } else {
          result = BookingResult.fromJson(
              {"status": "error", "message": "Server error !", "data": []});
        }
      } else if (branchId != "" && date == "") {
        final response = await get(
          "$apiGetListBooking?filter[branchId]=$branchId",
          headers: Auth().requestHeaders,
        );
        if (response.statusCode == 200) {
          result = BookingResult.fromJson(response.body);
          log(response.statusCode.toString());
        } else {
          result = BookingResult.fromJson(
              {"status": "error", "message": "Server error !", "data": []});
        }
      } else if (branchId != "" && date != "") {
        final response = await get(
          "$apiGetListBooking?filter[date]=$date&filter[branchId]=$branchId",
          headers: Auth().requestHeaders,
        );
        if (response.statusCode == 200) {
          result = BookingResult.fromJson(response.body);
          log(response.statusCode.toString());
        } else {
          result = BookingResult.fromJson(
              {"status": "error", "message": "Server error !", "data": []});
        }
      } else {
        log('with date called');
        final response = await get(
          "$apiGetListBooking?filter[date]=$date",
          headers: Auth().requestHeaders,
        );
        if (response.statusCode == 200) {
          result = BookingResult.fromJson(response.body);
          log(response.statusCode.toString());
        } else {
          result = BookingResult.fromJson(
              {"status": "error", "message": "Server error !", "data": []});
        }
      }
    }

    // else
    return result;
  }

  Future<void> appoveBookingStatus(String status, String bookingId) async {
    final body = <String, dynamic>{
      "approvalStatus": status,
    };
    final response = await put(
      "$apiEditBooking/$bookingId",
      body,
      headers: Auth().requestHeaders,
    );
    if (response.statusCode == 200) {
      Get.snackbar('Sucess', 'Booking Status Changed to "$status"');
    } else {
      Get.snackbar('Failed', 'Failed to update booking status');
    }
  }

  Future<void> assignServiceManager(
    String bookingId,
    String serviceManagerId,
  ) async {
    final body = <String, dynamic>{
      "approvalStatus": "Assigned",
      "serviceManagerId": serviceManagerId,
    };
    final response = await put(
      "$apiEditBooking/$bookingId",
      body,
      headers: Auth().requestHeaders,
    );
    log(response.body.toString());
    if (response.statusCode == 200) {
      Get.snackbar('Sucess', 'Sucessfully assigned to respective manager');
    } else {
      Get.snackbar('Failed', 'Failed to assign');
    }
  }

  Future<void> assignTechnician(
    String bookingId,
    String technicianId,
  ) async {
    final body = <String, dynamic>{
      "approvalStatus": "Assigned",
      "technicianId": technicianId,
    };
    final response = await put(
      "$apiEditBooking/$bookingId",
      body,
      headers: Auth().requestHeaders,
    );
    if (response.statusCode == 200) {
      Get.snackbar('Sucess', 'Sucessfully assigned to respective manager');
    } else {
      Get.snackbar('Failed', 'Failed to assign');
    }
  }
}

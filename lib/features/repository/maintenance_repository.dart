import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rrconstruction/features/models/maintenance_model.dart';

class MaintenanceRepo extends GetxController {
  static MaintenanceRepo get instance => Get.find();

  final _fcdb = FirebaseFirestore.instance;

  addMaintenance(MaintenanceModel maintenanceModel) async {
   await _fcdb
        .collection("Maintenances")
        .add(maintenanceModel.toJson())
        .whenComplete(
          () => Get.snackbar(
            "Success",
            "New Maintenance information added",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green.withOpacity(0.3),
            colorText: Colors.green,
          ),
        )
        .catchError( (error, stackTrace)
      {
        Get.snackbar("Error" , "Something went wrong, Try again",
        snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red.withOpacity(0.5),
          colorText: Colors.red,
        );
        print(error.toString());
      }
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rrconstruction/constants.dart';
import 'package:rrconstruction/features/models/maintenance_model.dart';

import '../features/repository/maintenance_repository.dart';

class Maintenance extends StatefulWidget {
  static const String mid = "maintenance_screen";

  TextEditingController _addInformationTitle = TextEditingController();
  TextEditingController _addInformationDesc = TextEditingController();
  List<String> MI = ['3/01/12', '8/05/12', '1/07/22'];
  List<String> MID = [
    'Maintenance 1 long description',
    'Maintenance 2 long description',
    'Maintenance 3 long description'
  ];

  final maintenanceRepo = Get.put(MaintenanceRepo());

  void addMaintenance(String Maintenance) {
    // maintenanceRepo.
  }

  @override
  State<Maintenance> createState() => _MaintenanceState();
}

class _MaintenanceState extends State<Maintenance> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        centerTitle: true,
        title: Text(
          "Maintenance Information",
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 12),
              itemCount: widget.MI.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  color: kOutlineColor,
                  margin: EdgeInsets.all(8),
                  child: Card(
                    elevation: 10,
                    color: kButtonColor,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 8.0, horizontal: 5),
                      child: ListTile(
                        title: Text(
                          widget.MI[index],
                          style: kButtonTextStyle,
                        ),
                        subtitle: Text(
                          widget.MID[index],
                          style: kButtonTextStyle.copyWith(fontSize: 15),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 15),
            child: FloatingActionButton(
              onPressed: () {
                _display(context);
              },
              backgroundColor: Colors.white70,
              child: Icon(
                Icons.add,
                size: 35,
                color: Colors.black87,
              ),
            ),
          )
        ],
      ),
    );
  }

  // todo text field clear and dialogue for error or not true information

  Future<dynamic> _display(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: kButtonColor,
            title: Text(
              "Add New Maintenance Information",
              style: TextStyle(color: Colors.white, fontSize: 20),
              textAlign: TextAlign.center,
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  textAlign: TextAlign.center,
                  controller: widget._addInformationTitle,
                  decoration: InputDecoration(
                      hintText: "Date",
                      // labelText: "Date",
                      suffixIcon: GestureDetector(
                        onTap: () async {
                          DateTime? date = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2010),
                            lastDate: DateTime(2100),
                          );
                          if (date != null) {
                            widget._addInformationTitle.text =
                                DateFormat.yMd().format(date);
                          }
                        },
                        child: Icon(Icons.calendar_today),
                      ),
                      hintStyle: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 15),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black))),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: widget._addInformationDesc,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: "Add long Description",
                    hintStyle: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 15),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            actions: <Widget>[
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(kBackgroundColor),
                ),
                child: Text('ADD'),
                onPressed: () {
                  Navigator.of(context).pop();
                  String newInformation = widget._addInformationTitle.text;
                  String description = widget._addInformationDesc.text;
                  setState(() {
                    widget.MI.add(newInformation);
                    widget.MID.add(description);
                  });

                  final Maintenances = MaintenanceModel(
                      date: widget.MI.last,
                      longDesc: widget.MID.last);

                  widget._addInformationTitle.clear();
                },
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(kBackgroundColor),
                ),
                child: Text('CANCEL'),
                onPressed: () {
                  widget._addInformationTitle.clear();
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }
}

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Average extends StatefulWidget {

  static const String aid = "average_screen";

  TextEditingController _startKmController = TextEditingController();
  TextEditingController _finalKmController = TextEditingController();
  TextEditingController _fuelAtStart = TextEditingController();
  TextEditingController _fuelAtEnd = TextEditingController();

  RegExp digitValidator = RegExp("[0-9]+");
  bool isANumber = true;

  List<String> AI = ['Average during the drive was 40.9', 'Average during the drive was 43.2', 'Average during the drive was 45'];
  List<String> AID = [
    '500 kms driven on 01/03/2023',
    '150 kms driven on 03/13/2022',
    '650 kms driven on 06/27/2022'
  ];

  @override
  State<Average> createState() => _AverageState();
}

class _AverageState extends State<Average> {
  @override

   int? startKm;
  int? finalKm;
  int? kmsDriven;
  double? fuelAmountAtStart;
  double? fuelAmountAtEnd;
  double? finalFuelAmount;
  double? average;
  DateTime now = DateTime.now();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Average Information",
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: widget.AI.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(widget.AI[index]),
                  subtitle: Text(widget.AID[index]),
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
              backgroundColor: Color(0xff999999),
              child: Icon(Icons.add),
            ),
          )
        ],
      ),
    );
  }

  Future<dynamic> _display(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return SingleChildScrollView(
            child: AlertDialog(
              backgroundColor: Color(0xFF999999),
              title: Text(
                "Add New Average Information",
                style: TextStyle(color: Colors.black),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    textAlign: TextAlign.center,
                    controller: widget._fuelAtStart,
                    onChanged: (input) {
                      if (input.isEmpty ||
                          widget.digitValidator.hasMatch(input)) {
                        widget.isANumber = false;
                      } else {
                        widget.isANumber = true;
                      }
                    },
                    decoration: InputDecoration(
                        hintText: "Amount of fuel in the tank before filling ",
                        hintStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 15),
                        errorText:
                        widget.isANumber ? "In Litre" : "Please enter a number",
                        errorStyle: TextStyle(color: Colors.red),
                        focusedErrorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.red)),
                        errorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.red)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black))),
                    style: TextStyle(
                      color: Color(0xff222222),
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * (0.013),
                  ),
                  TextField(
                    textAlign: TextAlign.center,
                    controller: widget._fuelAtEnd,
                    onChanged: (input) {
                      if (input.isEmpty ||
                          widget.digitValidator.hasMatch(input)) {
                        widget.isANumber = false;
                      } else {
                        widget.isANumber = true;
                      }
                    },
                    decoration: InputDecoration(
                        hintText: "Amount of fuel in tank after filling in Litre",
                        hintStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 15),
                        errorText:
                        widget.isANumber ? "In Litre" : "Please enter a valid number",
                        errorStyle: TextStyle(color: Colors.red),
                        focusedErrorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.red)),
                        errorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.red)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black))),
                    style: TextStyle(
                      color: Color(0xff222222),
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * (0.013),
                  ),
                  TextField(
                    textAlign: TextAlign.center,
                    controller: widget._startKmController,
                    onChanged: (input) {
                      if (input.isEmpty ||
                          widget.digitValidator.hasMatch(input)) {
                        widget.isANumber = false;
                      } else {
                        widget.isANumber = true;
                      }
                    },
                    decoration: InputDecoration(
                        hintText: "Kilometer driven before start",
                        hintStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 15),
                        errorText:
                            widget.isANumber ? null : "Please enter a number",
                        errorStyle: TextStyle(color: Colors.red),
                        focusedErrorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.red)),
                        errorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.red)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black))),
                    style: TextStyle(
                      color: Color(0xff222222),
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * (0.013),
                  ),
                  TextField(
                    textAlign: TextAlign.center,
                    controller: widget._finalKmController,
                    onChanged: (input) {
                      if (input.isEmpty ||
                          widget.digitValidator.hasMatch(input)) {
                        widget.isANumber = false;
                      } else {
                        widget.isANumber = true;
                      }
                      setState(() {
                      });
                    },
                    decoration: InputDecoration(
                      hintText: "Kilometer driven after end",
                      hintStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 15),
                      errorText: widget.isANumber ? null : "Please enter a valid number",

                      errorStyle: TextStyle(color: Colors.red),
                      focusedErrorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red)),
                      errorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                    ),
                    style: TextStyle(
                      color: Color(0xff222222),
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              actions: <Widget>[
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Color(0xff222222)),
                  ),
                  child: Text('ADD'),
                  onPressed: () {
                    Navigator.of(context).pop();

                     startKm = int.tryParse(widget._startKmController.text) ?? 0;
                     finalKm = int.tryParse(widget._finalKmController.text) ?? 0;
                     fuelAmountAtStart = double.tryParse(widget._fuelAtStart.text) ?? 0;
                    fuelAmountAtEnd = double.tryParse(widget._fuelAtEnd.text) ?? 0;
                    finalFuelAmount = (fuelAmountAtEnd! - fuelAmountAtStart!);

                     kmsDriven = (finalKm! - startKm!) ;
                     average = (kmsDriven! / finalFuelAmount!);
                    String formattedDate = DateFormat('dd/MM/yyyy').format(now);

                    setState(() {
                      widget.AI.add("Average during the drive was ${average?.toStringAsFixed(2)}"); // add the average to the list
                      widget.AID.add("$kmsDriven kms driven on ${formattedDate}"); // add the kms driven to the subtitle list
                    });

                  },
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Color(0xff222222)),
                  ),
                  child: Text('CANCEL'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            ),
          );
        });
  }

  // Future<dynamic> _display(BuildContext context) async {
  //   return showDialog(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return AlertDialog(
  //           backgroundColor: Color(0xFF999999),
  //           title: Text(
  //             "Add New Average Information",
  //             style: TextStyle(color: Colors.black),
  //           ),
  //           content: Column(
  //             mainAxisSize: MainAxisSize.min,
  //             children: [
  //               TextField(
  //                 textAlign: TextAlign.center,
  //                 controller: widget._startKmController,
  //                 onChanged: (input) {
  //                   if(input.isEmpty || widget.digitValidator.hasMatch(input)) {
  //                     widget.isANumber=false;
  //                   }
  //                   else {widget.isANumber=true;}
  //                 },
  //                 decoration: InputDecoration(
  //                     hintText: "Kilometer before staring of journey",
  //                     hintStyle: TextStyle(
  //                         color: Colors.black,
  //                         fontWeight: FontWeight.w400,
  //                         fontSize: 15),
  //                     errorText:  widget.isANumber? null : "Please enter a number" ,
  //                     errorStyle: TextStyle(color: Colors.red),
  //                     focusedErrorBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)),
  //                     errorBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)),
  //                     enabledBorder: OutlineInputBorder(
  //                         borderSide: BorderSide(color: Colors.black)),
  //                     focusedBorder: OutlineInputBorder(
  //                         borderSide: BorderSide(color: Colors.black))),
  //                 style: TextStyle(
  //                   color: Color(0xff222222),
  //                   fontSize: 20,
  //                   fontWeight: FontWeight.w500,
  //                 ),
  //               ),
  //               SizedBox(
  //                 height: MediaQuery.of(context).size.height*(0.013),
  //               ),
  //               TextField(
  //                 textAlign: TextAlign.center,
  //                 controller: widget._finalKmController,
  //                 onChanged: (input) {
  //                   if(input.isEmpty || widget.digitValidator.hasMatch(input)) {
  //                     widget.isANumber=false;
  //                   }
  //                   else {widget.isANumber=true;}
  //                 },
  //                 decoration: InputDecoration(
  //                     hintText: "Kilometer after finishing of journey",
  //                     hintStyle: TextStyle(
  //                         color: Colors.black,
  //                         fontWeight: FontWeight.w400,
  //                         fontSize: 15),
  //                     errorText:  widget.isANumber? null : "Please enter a number" ,
  //                     errorStyle: TextStyle(color: Colors.red),
  //                     focusedErrorBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)),
  //                     errorBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)),
  //                     enabledBorder: OutlineInputBorder(
  //                         borderSide: BorderSide(color: Colors.black)),
  //                     focusedBorder: OutlineInputBorder(
  //                         borderSide: BorderSide(color: Colors.black))),
  //                 style: TextStyle(
  //                   color: Color(0xff222222),
  //                   fontSize: 20,
  //                   fontWeight: FontWeight.w500,
  //                 ),
  //               ),
  //               // SizedBox(
  //               //   height: MediaQuery.of(context).size.height*(0.0017),
  //               // ),
  //               // TextField(
  //               //   controller: widget._addInformationDesc,
  //               //   textAlign: TextAlign.center,
  //               //   decoration: InputDecoration(
  //               //     hintText: "Add long Description",
  //               //     hintStyle: TextStyle(
  //               //         color: Colors.black,
  //               //         fontWeight: FontWeight.w400,
  //               //         fontSize: 15),
  //               //     enabledBorder: OutlineInputBorder(
  //               //       borderSide: BorderSide(color: Colors.black),
  //               //     ),
  //               //     focusedBorder: OutlineInputBorder(
  //               //       borderSide: BorderSide(color: Colors.black),
  //               //     ),
  //               //   ),
  //               //   style: TextStyle(
  //               //     color: Color(0xff222222),
  //               //     fontSize: 20,
  //               //     fontWeight: FontWeight.w500,
  //               //   ),
  //               // ),
  //             ],
  //           ),
  //           actions: <Widget>[
  //             ElevatedButton(
  //               style: ButtonStyle(
  //                 backgroundColor: MaterialStateProperty.all(Color(0xff222222)),
  //               ),
  //               child: Text('ADD'),
  //               onPressed: () {
  //                 Navigator.of(context).pop();
  //                 int ans = widget._finalKmController - widget._startKmController;
  //                 String newInformation = widget._finalKmController.text;
  //                 String description = widget._addInformationDesc.text;
  //                 setState(() {
  //                   widget.AI.add(newInformation);
  //                   widget.AID.add(description);
  //                 });
  //               },
  //             ),
  //             ElevatedButton(
  //               style: ButtonStyle(
  //                 backgroundColor: MaterialStateProperty.all(Color(0xff222222)),
  //               ),
  //               child: Text('CANCEL'),
  //               onPressed: () {
  //                 Navigator.of(context).pop();
  //               },
  //             )
  //           ],
  //         );
  //       });
  // }
}

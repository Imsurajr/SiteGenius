import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Average extends StatefulWidget {
  TextEditingController _addInformationDesc = TextEditingController();
  TextEditingController _startKmController = TextEditingController();
  TextEditingController _finalKmController = TextEditingController();
  RegExp digitValidator = RegExp("[0-9]+");
  bool isANumber = true;

  List<String> AI = ['7/06/12', '8/21/12', '1/07/22'];
  List<String> AID = [
    'Average 1 long description',
    'Average 2 long description',
    'Average 3 long description'
  ];

  @override
  State<Average> createState() => _AverageState();
}

class _AverageState extends State<Average> {
  @override
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
          return AlertDialog(
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
                      hintText: "Kilometer before staring of journey",
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
                    hintText: "Kilometer after finishing of journey",
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

                  int startKm = int.tryParse(widget._startKmController.text) ?? 0;
                  int finalKm = int.tryParse(widget._finalKmController.text) ?? 0;
                  double fuelAmount = double.tryParse(widget._addInformationDesc.text) ?? 0;

                  int kmsDriven = finalKm - startKm;
                  double average = kmsDriven / fuelAmount;

                  setState(() {
                    widget.AI.add("Average during the drive ${average.toStringAsFixed(2)}"); // add the average to the list
                    widget.AID.add("$kmsDriven km driven"); // add the kms driven to the subtitle list
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

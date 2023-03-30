import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class tyre extends StatefulWidget {
  TextEditingController _addInformationTitle = TextEditingController();
  TextEditingController _addInformationDesc = TextEditingController();
  List<String> TI = ['1/01/12', '1/31/12', '12/11/22'];
  List<String> TID = [
    'Tyre changed 1 long description',
    'Tyre changed 2 long description',
    'Tyre changed 3 long description'
  ];

  @override
  State<tyre> createState() => _tyreState();
}

class _tyreState extends State<tyre> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Tyre Information",
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: widget.TI.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(widget.TI[index]),
                  subtitle: Text(widget.TID[index]),
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
              "Add New Tyre Information",
              style: TextStyle(color: Colors.black),
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
                            // widget._addInformationTitle;
                            widget._addInformationTitle.text = DateFormat.yMd().format(date);
                          }
                        },
                        child: Icon(Icons.calendar_today),
                      ),
                      hintStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 15),
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
                  height: 10,
                ),
                TextField(
                  controller: widget._addInformationDesc,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: "Add long Description",
                    hintStyle: TextStyle(
                        color: Colors.black,
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
                  String newInformation = widget._addInformationTitle.text;
                  String description = widget._addInformationDesc.text;
                  setState(() {
                    widget.TI.add(newInformation);
                    widget.TID.add(description);
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

}

import 'package:flutter/material.dart';

class selectedVehicle extends StatefulWidget {
  selectedVehicle({required this.appBarTitle, required this.optionNumber});
  final String appBarTitle;
  final int optionNumber;
  TextEditingController _addInformationTitle = TextEditingController();
  TextEditingController _addInformationDesc = TextEditingController();
  List<String> MI = ['Maintenance 1', 'Maintenance 2', 'Maintenance 3'];
  List<String> TI = ['Tyre changed 1', 'Tyre changed 2', 'Tyre changed 3'];
  List<String> AI = ['Average 1', 'Average 2', 'Average 3'];
  List<String> details = [
    "Demo long information",
    "Demo long information",
    "pepepepooo",
    "pepeopop"
  ];
  @override
  State<selectedVehicle> createState() => _selectedVehicleState();
}

class _selectedVehicleState extends State<selectedVehicle> {
  @override
  Widget build(BuildContext context) {
    List<String> selectedList = getSelectedList(widget.optionNumber);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.appBarTitle,
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: selectedList.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(selectedList[index]),
                  subtitle: Text("Demo long information"),
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
              "Add New ${widget.appBarTitle}",
              style: TextStyle(color: Colors.black),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: widget._addInformationTitle,
                  decoration: InputDecoration(
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
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black))),
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
                  String newInformation = (widget._addInformationTitle.text);
                  String description = widget._addInformationDesc.text;
                  setState(() {
                    // getSelectedList(widget.optionNumber).add(newInformation);
                    // getSelectedList(widget.optionNumber).sublist(start)
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

  List<String> getSelectedList(int optionNumber) {
    switch (optionNumber) {
      case 1:
        return widget.MI;
      case 2:
        return widget.TI;
      case 3:
        return widget.AI;
      default:
        return [];
    }
  }
}

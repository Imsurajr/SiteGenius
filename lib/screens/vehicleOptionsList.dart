import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

List<String> vehicleOptions = [
  "Maintenance Information",
  "Tyre Information",
  "Average Information",
];
class OptionsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Options'),
      ),
      body: ListView.builder(
        itemCount: vehicleOptions.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(vehicleOptions[index]),
            onTap: () {
              // Navigate to the selected option screen
            },
          );
        },
      ),
    );
  }
}
// class options extends StatefulWidget {
//
//   @override
//   State<options> createState() => _optionsState();
// }
//
// class _optionsState extends State<options> {
//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       padding: const EdgeInsets.all(8),
//       children: <Widget>[
//         ListTile(
//
//         ),
//         Container(
//           height: 50,
//           color: Colors.amber[500],
//           child: const Center(child: Text('Entry B')),
//         ),
//         Container(
//           height: 50,
//           color: Colors.amber[100],
//           child: const Center(child: Text('Entry C')),
//         ),
//       ],
//     );
//   }
// }

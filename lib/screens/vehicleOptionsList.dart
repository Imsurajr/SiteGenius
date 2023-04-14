import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rrconstruction/screens/average.dart';
import 'package:rrconstruction/screens/maintenance.dart';
import 'package:rrconstruction/screens/tyre.dart';

List<String> vehicleOptions = [
  "Maintenance Information",
  "Tyre Information",
  "Average Information",
];

class OptionsScreen extends StatelessWidget {


  static const String vid = "vehicleOption_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Options'),
      ),
      body: ListView.builder(
        itemCount: vehicleOptions.length,
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 12),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.all(8),
            child: Card(
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  title: Text(vehicleOptions[index] , textAlign: TextAlign.center, style: GoogleFonts.openSans(fontSize: 18, fontWeight: FontWeight.w600),),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context)  {
                          return index==0 ? Maintenance( ): index==1
                               ? Tyre() : Average();
                        }
                        // => selectedVehicle(
                        //   appBarTitle: '${vehicleOptions[index]}',
                        //   optionNumber: (index + 1),
                        // ),
                      ),
                    );
                  },
                ),
              ),
            ),
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

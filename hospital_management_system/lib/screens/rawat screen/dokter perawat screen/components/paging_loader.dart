// import 'package:flutter/material.dart';

// import 'package:hospital_management_system/view%20model/dokter%20perawat%20provider/dokterPerawat_provider.dart';

// import 'package:provider/provider.dart';


// class DokterPerawatTable {
//   Widget buildStack(BoxConstraints constraints, BuildContext context) {
//     final _provider = Provider.of<DokterPerawatProvider>(context);
//     List<Widget> _getChildren() {
//       final List<Widget> stackChildren = [];
//       stackChildren.add(_buildDataGrid(constraints, context));

//       if (_provider.showLoadingIndicator) {
//         stackChildren.add(Container(
//             color: Colors.black12,
//             width: constraints.maxWidth,
//             height: constraints.maxHeight,
//             child: const Align(
//                 alignment: Alignment.center,
//                 child: CircularProgressIndicator(
//                   strokeWidth: 3,
//                 ))));
//       }

//       return stackChildren;
//     }

//     return Stack(
//       children: _getChildren(),
//     );
//   }
// }

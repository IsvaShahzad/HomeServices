//
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:home_services_flutter/allServices/service_item.dart';
// import '../provider/service_providerr.dart';
//
//
// class ServiceGrid extends StatelessWidget {
//
//
//
//
//   @override
//   Widget build(BuildContext context) {
//
//     final service_data= Provider.of<Service>(context);
//     final services = service_data.items;
//     return GridView.builder(
//       padding: const EdgeInsets.all(10.0),
//       itemCount: services.length,
//
//       itemBuilder: (context, index) =>  ChangeNotifierProvider.value(
//         // create: (context) => services[index] ,
//         value: services[index],
//         child: ServiceItem(
//         // services[index].id,
//         // services[index].title,
//         // services[index].imageUrl,
//       ),
//       ),
//       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 2,
//         childAspectRatio: 3 / 2,
//         crossAxisSpacing: 10,
//         mainAxisSpacing: 10,
//       ),
//     );
//   }
// }

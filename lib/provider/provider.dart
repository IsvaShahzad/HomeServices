// import 'package:flutter/material.dart';
// import 'package:home_services_flutter/Consumer_Screens/add_requirements_consumer.dart';
// import 'package:provider/provider.dart';
//
// class DeleteButtonScreen extends StatelessWidget {
//   final String id;
//   final String productname;
//   final String productprice;
//   final String ImageURl;
//   final String productdescription;
//   final String productquantity;
//   final String email;
//   final String mobile;
//   final String deliverydate;
//
//   DeleteButtonScreen(this.id,this.productname,
//       this.productprice,
//       this.productquantity,
//       this.email,
//       this.mobile,
//       this.deliverydate,
//       this.productdescription,
//       this.ImageURl
//       );
//
//   @override
//   Widget build(BuildContext context) {
//     return Dismissible(
//       key: ValueKey(id),
//       background: Container(
//         color: Theme.of(context).errorColor,
//         child: Icon(
//           Icons.delete,
//           color: Colors.white,
//           size: 30,
//         ),
//         alignment: Alignment.centerRight,
//         padding: EdgeInsets.only(right: 20),
//         margin: EdgeInsets.symmetric(
//           horizontal: 15,
//           vertical: 4,
//         ),
//       ),
//       direction: DismissDirection.endToStart,
//       confirmDismiss: (direction){
//         return showDialog(
//           context: context,
//           builder: (context) => AlertDialog(
//             title: Text(' Are you sure?'),
//             content: Text('Do you want to remove the item from the cart?'),
//             actions: <Widget>[
//               TextButton(
//
//                 child: Text('No'),
//                 onPressed: (){
//                   Navigator.of(context).pop(false);
//                 },
//               ),
//               TextButton(
//                 child: Text('Yes'),
//                 onPressed: (){
//                   Navigator.of(context).pop(true);
//                 },
//               )
//
//             ],
//           ),
//         );
//       },
//       onDismissed: (direction)
//       {
//
//         Provider.of<RequirementModel>(context, listen: false).removeRequirement(id);
//
//       }  ,
//       child: Card(
//         margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
//         child: Padding(
//           padding: EdgeInsets.all(8),
//           child: ListTile(
//             leading: CircleAvatar(
//               child: Padding(
//                 padding: EdgeInsets.all(5),
//                 child: FittedBox(
//                   child: Text('\$$productprice'),
//                 ),
//               ),
//             ),
//             title: Text(productname),
//             // subtitle: Text('Total: \$${productprice * productquantity}'),
//             trailing: Text('$productquantity x'),
//           ),
//         ),
//       ),
//     );
//   }
// }

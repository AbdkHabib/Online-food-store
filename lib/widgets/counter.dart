// import 'package:flutter/material.dart';
// import 'package:food_store/get/cart_get_controller.dart';
// import 'package:food_store/widgets/item_counter.dart';
//
// class Counter extends StatelessWidget {
//   const Counter({
//     Key? key,
//     required int count,
//   })  : _count = count,
//         super(key: key);
//
//   final int _count;
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         ItemCounter(title1: '-', onPressed: (){
//           CartGetXController.to.addd();
//         }),
//         Text('${CartGetXController.to.values}'),
//         ItemCounter(title1: '+', onPressed: (){
//           CartGetXController.to.Shortage();
//         }),
//       ],
//     );
//   }
//
// }
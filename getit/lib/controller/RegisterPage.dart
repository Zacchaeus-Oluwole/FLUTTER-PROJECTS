// Container(
// padding: const EdgeInsets.all(20.0),
//   width: 382,
//   height: 90,
//   child: ElevatedButton(
//     onPressed: () {
//       //  Dialog Box 
//       showDialog<String>(
//         barrierColor: Color.fromRGBO(49, 49, 49, 0.8),
//         context: context,
//         builder: (BuildContext context) => Dialog(
//           backgroundColor: Color.fromRGBO(255, 219, 88, 1),
//           shape: RoundedRectangleBorder(
//             borderRadius:BorderRadius.circular(30.0)
//           ),
//           child: Container(
//             width: 500,
//             height: 380,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 SizedBoxH(30),
//                 Image(
//                   height: 120,
//                   width: 120,
//                   image: AssetImage("assets/checkmark.png")
//                 ),
//                 Text("Successful",style:TextStyle(fontSize: 20),),
//                 SizedBoxH(30),
//                 Container(
//                   width: 300,
//                   height: 48,
//                   child: ElevatedButton(
//                     onPressed: () {
//                       Navigator.pop(context);
//                     },
//                     style: ElevatedButton.styleFrom(
//                       padding: EdgeInsets.all(12),
//                       primary: Color.fromRGBO(40,40,159,1),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                       side: BorderSide(width: 1, color: Colors.black),
//                       shadowColor: Colors.black,
//                       elevation: 6,
//                     ),
//                     child: Text(
//                       "Close",
//                       style: TextStyle(
//                         fontFamily: 'Poppins',
//                         fontSize: 16,
//                         fontWeight: FontWeight.w500,
//                         letterSpacing: 0,
//                         color: Colors.white,
//                         height: 1.5,
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBoxH(30),
//               ],
//             ),
//           ),
//         )
//       );
//     },
//     style: ElevatedButton.styleFrom(
//       padding: EdgeInsets.all(12),
//       primary: Color.fromRGBO(40,40,159,1),
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(8),
//       ),
//       side: BorderSide(width: 1, color: Colors.black),
//       shadowColor: Colors.black,
//       elevation: 6,
//     ),
//     child: Text(
//       "Done",
//       style: TextStyle(
//         fontFamily: 'Poppins',
//         fontSize: 16,
//         fontWeight: FontWeight.w500,
//         letterSpacing: 0,
//         color: Colors.white,
//         height: 1.5,
//       ),
//     ),
//   ),
// ),
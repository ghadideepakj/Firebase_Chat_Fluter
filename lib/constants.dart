import 'package:flutter/material.dart';

const kSendButtonTextTitle = TextStyle(
  color: Colors.lightBlueAccent,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

const kMessageTextFiledDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
  hintText: 'Type your message here',
  border: InputBorder.none,
);

const kMessageContainerDecoration = BoxDecoration(
    border: Border(top: BorderSide(color: Colors.lightBlueAccent, width: 2.0)));

var kTextFieldDecoration = InputDecoration(
  hintText: 'text',
  hintStyle: const TextStyle(
    color: Colors.white,
  ),
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
    borderRadius: BorderRadius.circular(32.0),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
    borderRadius: BorderRadius.circular(32.0),
  ),
);

// class TextFields extends StatelessWidget {
//   TextFields({required this.text});
//   final String text;
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: TextField(
//         onChanged: (value) {},
//         decoration: InputDecoration(
//           hintText: text,
//           hintStyle: TextStyle(
//             color: Colors.grey.shade500,
//           ),
//           contentPadding:
//               EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
//           enabledBorder: OutlineInputBorder(
//             borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
//             borderRadius: BorderRadius.circular(32.0),
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
//             borderRadius: BorderRadius.circular(32.0),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class Buttons extends StatelessWidget {
//   Buttons(
//       {required this.colorString,
//       required this.textString,
//       required this.onPressed});
//   final Color colorString;
//   final String textString;
//   final VoidCallback onPressed;
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 16.0),
//       child: Material(
//         elevation: 5.0,
//         color: colorString,
//         borderRadius: BorderRadius.circular(30.0),
//         child: MaterialButton(
//           onPressed: onPressed,
//           minWidth: 200.0,
//           height: 42.0,
//           child: Text('$textString'),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import '../../../../constants/image_strings.dart';
// import '../../../../constants/sizes.dart';
// import '../../../../constants/text_strings.dart';
// import 'login_form_widget.dart';
// import 'login_header_widget.dart';

// class LoginScreen extends StatelessWidget {
//   const LoginScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     return SafeArea(
//       child: Scaffold(
//         body: SingleChildScrollView(
//           child: Container(
//             padding: const EdgeInsets.all(tDefaultSize),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               // children: [
//               //   LoginHeaderWidget(),
//               // LoginForm(),
//               // LoginFooterWidget(),
//               // ],
//               children: [
//                 LoginHeaderWidget(size: size),
//                 const LoginForm(),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     const Text("OR"),
//                     SizedBox(
//                       width: double.infinity,
//                       child: OutlinedButton.icon(
//                         icon: const Image(
//                           image: AssetImage(tGoogleLogoImage),
//                           width: 20.0,
//                         ),
//                         onPressed: () {},
//                         label: Text(tSignInWithGoogle.toUpperCase()),
//                       ),
//                     ),
//                     TextButton(
//                         onPressed: () {},
//                         child: const Text.rich(TextSpan(children: [
//                           TextSpan(
//                             text: tDontHaveAnAccount,
//                           ),
//                           TextSpan(
//                             text: tSignup,
//                           ),
//                         ])))
//                   ],
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }


// import 'package:flutter/material.dart';
// import 'package:shopi/controller/routes/route_name.dart';
// import 'package:shopi/view/splash/splash.dart';


// class AppRoutes {
//   static Route<dynamic> generateRoute(RouteSettings settings) {
//     switch (settings.name) {
//       case RouteNames.splashScreen:
//         return MaterialPageRoute(
//           builder: (context) => const SplashScreen1(),
//         );
//       case RouteNames.welcomeScreen:
//         return MaterialPageRoute(
//           builder: (context) => const WelcomeScreen(),
//         );
//       case RouteNames.onBoardScreen:
//         return MaterialPageRoute(
//           builder: (context) => const OnBoardScreen(),
//         );
//       case RouteNames.signUpScreen:
//         return MaterialPageRoute(
//           builder: (context) => SignUpScreen(),
//         );
//       case RouteNames.signInScreen:
//         return MaterialPageRoute(
//           builder: (context) => SignInScreen(),
//         );
//       case RouteNames.bottomNav:
//         return MaterialPageRoute(
//           builder: (context) => const BottomNavBar(),
//         );
//       case RouteNames.findMyAccount:
//         return MaterialPageRoute(
//           builder: (context) => ForgotPassword(),
//         );
//       case RouteNames.otpScreen:
//         final args = settings.arguments as OtpArguementModel;
//         return MaterialPageRoute(
//             builder: (context) => OtpScreen(
//                   model: args.model,
//                   screenCheck: args.checkScreen,
//                 ));
//       case RouteNames.newPasswordScreen:
//         final args = settings.arguments as NewPasswordScreenArguementsModel;
//         return MaterialPageRoute(
//           builder: (context) => NewPasswordScreen(
//             model: args.model,
//           ),
//         );
//       case RouteNames.homeScreen:
//         return MaterialPageRoute(
//           builder: (context) => const HomeScreen(),
//         );
//       case RouteNames.cartScreen:
//         return MaterialPageRoute(
//           builder: (context) => const CartScreen(),
//         );
//       case RouteNames.productCollections:
//         final args = settings.arguments as ProductCollectionScreenModel;
//         return MaterialPageRoute(
//           builder: (context) => ProductCollectionScreen(
//             category: args.category,
//             categoryId: args.categoryId,
//           ),
//         );
//       case RouteNames.productScreen:
//         final args = settings.arguments as ProductIdModel;
//         return MaterialPageRoute(
//           builder: (context) => ProductViewScreen(
//             productId: args.productId,
//           ),
//         );
//       case RouteNames.paymentScreen:
//         return MaterialPageRoute(
//           builder: (context) => const PaymentScreen(),
//         );
//       case RouteNames.addressScreen:
//         return MaterialPageRoute(
//           builder: (context) => const AddressScreen(),
//         );
//       case RouteNames.confirmOrderScreen:
//         return MaterialPageRoute(
//           builder: (context) => ConfirmOrderScreen(),
//         );
//       case RouteNames.addNewAddressScreen:
//         final args = settings.arguments as AddNewAddressArguemnetModel;
//         return MaterialPageRoute(
//           builder: (context) => AddNewAddressScreen(
//             addressScreenCheck: args.addressScreenCheck,
//             addressId: args.addressId,
//           ),
//         );
//       case RouteNames.orderScreen:
//         return MaterialPageRoute(
//           builder: (context) => const OrdersScreen(),
//         );

//       case RouteNames.orderSummaryScreen:
//         final args = settings.arguments as OrderSummaryArguementModel;
//         return MaterialPageRoute(
//           builder: (context) => OrderSummeryScreen(
//             addressId: args.addressId,
//           ),
//         );
//       default:
//         return MaterialPageRoute(
//           builder: (context) => const SplashScreen(),
//         );
//     }
//   }
// }
import 'dart:html';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(context) {
    // Instantiate your class using Get.put() to make it available for all "child" routes there.
    final Controller c = Get.put(Controller());

    return Scaffold(
      // Use Obx(()=> to update Text() whenever count is changed.
      appBar: AppBar(title: Obx(() => Text("Clicks: ${c.count}"))),
      // Replace the 8 lines Navigator.push by a simple Get.to(). You don't need context
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: ElevatedButton(
              child: const Text("Go to Other"),
              onPressed: () => Get.to(OutraPagina()),
            ),
          ),
          ElevatedButton(
            child: const Text("Go to one more"),
            onPressed: () => Get.to(
              OutraPagina(),
            ),
          ),
          FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: c.increment,
          )
        ],
      ),
      //floatingActionButton: FloatingActionButton(
      //    child: const Icon(Icons.add), onPressed: c.increment),
    );
  }
}

class OutraPagina extends StatelessWidget {
  // You can ask Get to find a Controller that is being used by another page and redirect you to it.
  final Controller c = Get.find();

  @override
  Widget build(context) {
    // Access the updated count variable
    return Scaffold(body: Center(child: Text("${c.count}")));
  }
}

class Controller extends GetxController {
  var count = 0.obs;
  increment() => count++;
}

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   var counter = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text('$counter'),
//           Center(
//             child: ElevatedButton(
//               child: const Text('Enviar'),
//               onPressed: () {
//                 counter++;
//                 setState(() {});
//               },
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }


// class _HomePageState extends State<HomePage> {
//   var counter = 0;

//   @override
//   Widget build(BuildContext context) {
//     //print('foi');
//     return Scaffold(
//       body: Center(
//         child: Column(
//           children: [
//             Container(
//               width: 80,
//               height: 80,
//               color: Colors.blueAccent,
//             ),
//             Text('$counter'),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//           child: const Icon(Icons.add),
//           onPressed: () {
//             setState(() {
//               counter++;
//             });
//           }),
//     );
//   }
// }

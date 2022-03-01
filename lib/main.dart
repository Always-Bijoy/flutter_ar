import 'package:ar_kit_flutter/plane_detection_page.dart';
import 'package:arkit_plugin/arkit_plugin.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late ARKitController arkitController;

  @override
  void dispose() {
    arkitController.dispose();
    super.dispose();
  }

  final material = ARKitMaterial(
    lightingModelName: ARKitLightingModel.lambert,
    diffuse: ARKitMaterialProperty.image('assets/earth.jpeg'),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ARKit in Flutter')),
      // body: ARKitSceneView(onARKitViewCreated: onARKitViewCreated)
      body: PlaneDetectionPage()
    );
  }
  void onARKitViewCreated(ARKitController arkitController) {
    this.arkitController = arkitController;
    final sphere = ARKitSphere(
      materials: [material],
      radius: 0.1,
    );
    final node = ARKitNode(

        geometry: sphere, position: Vector3(0, 0, -0.5));
    this.arkitController.add(node);
  }
}

// This must be run from inside an existing app,
// e.g. the default Flutter app created by `flutter create APP_NAME`

// Step 1: Import the viam_sdk
import 'package:flutter/material.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:viam_sdk/viam_sdk.dart';
import 'package:viam_sdk/widgets/camera_stream.dart';

// Step 2: Call this function from within your widget

class ViamSetup {
  Future<void> connectToViam() async {
    const host = 'rezbot-main.eylzl8kx6m.viam.cloud';

    const secret = '59jl8hyf7pdddfgywk67spq8nn1hz9bl6x8nxlvhn2683m8p';

    final robot = await RobotClient.atAddress(
      host,
      RobotClientOptions.withLocationSecret(secret),
    );
    print(robot.resourceNames);

    final cam = Camera.fromRobot(robot, "cam");

    print(cam.name);
  }

  Future<Camera> camName() async {
    const host = 'rezbot-main.eylzl8kx6m.viam.cloud';

    const secret = '59jl8hyf7pdddfgywk67spq8nn1hz9bl6x8nxlvhn2683m8p';

    final robot = await RobotClient.atAddress(
      host,
      RobotClientOptions.withLocationSecret(secret),
    );
    print(robot.resourceNames);

    final cam = Camera.fromRobot(robot, "cam");

    return cam;
  }

  streamFinal() async {
    const host = 'rezbot-main.eylzl8kx6m.viam.cloud';

    const secret = '59jl8hyf7pdddfgywk67spq8nn1hz9bl6x8nxlvhn2683m8p';
    final robot = await RobotClient.atAddress(
      host,
      RobotClientOptions.withLocationSecret(secret),
    );
    //  final streamc = Stream<MediaStream> getStream()(ResourceName name);
    // return robot.getStream(robot.name);

    return robot.getStream(MediaStream as String);
  }
}

class CameraViewViam extends StatefulWidget {
  const CameraViewViam({super.key});

  @override
  State<CameraViewViam> createState() => _CameraViewViamState();
}

class _CameraViewViamState extends State<CameraViewViam> {
  camFinal() async {
    final finalCam = await ViamSetup().camName();
    return finalCam;
  }

  @override
  void initState() {
    super.initState();
    camFinal();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ViamCameraStreamView(
          camera: camFinal(), streamClient: ViamSetup().streamFinal()),
    );
  }
}

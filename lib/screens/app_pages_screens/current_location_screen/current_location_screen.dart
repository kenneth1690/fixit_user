import 'dart:developer';

import 'package:flutter/foundation.dart';

import '../../../config.dart';

class CurrentLocationScreen extends StatelessWidget {
  const CurrentLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LocationProvider>(builder: (context1, value, child) {
      return StatefulWrapper(
        onInit: () => Future.delayed(DurationClass.ms50)
            .then((value1) => value.onLocationInit(context)),
        child: Scaffold(
            body: Stack(children: [
           GoogleMap(
                  zoomGesturesEnabled: true,
                  myLocationButtonEnabled: true,
                  fortyFiveDegreeImageryEnabled: false,
                  compassEnabled: false,
               mapToolbarEnabled: false,
                  initialCameraPosition: CameraPosition(
                      target: value.position1 == null ? LatLng(0.0, 0.0): LatLng(value.position1!.latitude, value.position1!.longitude),
                      zoom: 15),
                  markers: value.markers,
                  mapType: MapType.normal,
                  onMapCreated: (controller) => value.onController(controller)),
          const BottomLocationLayout()
        ])),
      );
    });
  }
}

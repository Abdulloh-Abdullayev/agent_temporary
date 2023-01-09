import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:agent/core/constants/app_const.dart';
import 'package:agent/core/extensions/num_extensions.dart';
import 'package:agent/core/localization/locale_keys.g.dart';
import 'package:agent/core/utils/assets.gen.dart';
import 'package:agent/core/utils/colors.gen.dart';
import 'package:agent/ui/pages/map_page/widgets/custom_map_widget.dart';
import 'package:agent/ui/widgets/app_widgets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class CustomMapPageModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          CustomMap.routeName,
          child: (context, args) => const CustomMap(),
        ),
      ];

  @override
  List<Bind<Object>> get binds => [
        // Bind<AppNavigationBloc>(
        //   (i) => AppNavigationBloc(),
        //   onDispose: (value) => value.close(),
        // ),
      ];
}

class CustomMap extends StatefulWidget {
  static const String routeName = "/custom_map";
  const CustomMap({super.key});

  @override
  State<CustomMap> createState() => _CustomMapState();
}

class _CustomMapState extends State<CustomMap> {
  final Completer<GoogleMapController> _mapController = Completer();
  LatLng sourseLoc = LatLng(41.0059, 71.6435);
  LatLng direction = LatLng(41.0291, 71.8452);

  BitmapDescriptor sourseIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor destinationIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor currentIcon = BitmapDescriptor.defaultMarker;

  LocationData? currentLocation;

  var zoom = 14.0;
  var bearing = 0.0;

  PolylinePoints polylinePoints = PolylinePoints();
  List<LatLng> cordinates = [];
  GoogleMapController? _googleController;
  static List<Widget> buttonsIcons = [
    Assets.images.icons.send.svg(),
    Assets.images.icons.minus.svg(),
    Assets.images.icons.plus.svg(),
    Assets.images.icons.refresh.svg(),
    // Assets.images.icons.
  ];

  addDirection() async {
    try {
      PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        AppConst.MAP_KEY,
        PointLatLng(sourseLoc.latitude, sourseLoc.longitude),
        PointLatLng(direction.latitude, direction.longitude),
      );
      cordinates = [];
      setState(() {});
      result.points.forEach((e) {
        cordinates.add(LatLng(e.latitude, e.longitude));
        setState(() {});
      });
    } catch (e) {}
  }

  getCurrentLocation() async {
    Location location = new Location();
    currentLocation = await location.getLocation();
    setState(() {});

    location.onLocationChanged.listen((loc) {
      setState(() {
        currentLocation = loc;
        sourseLoc = LatLng(loc.latitude!, loc.longitude!);
      });
      if (_googleController != null)
        _googleController!.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: LatLng(
                currentLocation!.latitude!,
                currentLocation!.longitude!,
              ),
              bearing: bearing,
              zoom: zoom,
            ),
          ),
        );
      addDirection();
    });
  }

  setCustomMarkIcon() async {
    sourseIcon = BitmapDescriptor.fromBytes(
      await getImages(Assets.images.direction.path),
    );
    destinationIcon = BitmapDescriptor.fromBytes(
      await getImages(Assets.images.location.path),
    );
    currentIcon = sourseIcon;
    setState(() {});
  }

  Future<Uint8List> getImages(String path) async {
    ByteData data = await rootBundle.load(path);
    Codec codec = await instantiateImageCodec(
      data.buffer.asUint8List(),
      targetHeight: 100,
    );
    FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  @override
  void initState() {
    getCurrentLocation();
    setCustomMarkIcon();
    super.initState();
    init();
    addDirection();
  }

  init() async {
    _googleController = await _mapController.future;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: currentLocation == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Stack(
                children: [
                  GoogleMap(
                    zoomControlsEnabled: false,
                    initialCameraPosition: CameraPosition(
                      target: LatLng(
                        currentLocation!.latitude!,
                        currentLocation!.longitude!,
                      ),
                      zoom: zoom,
                    ),
                    polylines: {
                      Polyline(
                        polylineId: PolylineId("value1"),
                        color: Color(0xff336666),
                        width: 3,
                        points: cordinates,
                      ),
                    },
                    onCameraMove: (position) {
                      setState(() {
                        bearing = position.bearing;
                      });
                    },
                    markers: {
                      Marker(
                        anchor: Offset(.55, .15),
                        markerId: MarkerId("sourse"),
                        position:
                            LatLng(sourseLoc.latitude, sourseLoc.longitude),
                        rotation: currentLocation!.heading!,
                        icon: currentIcon,
                        zIndex: 1,
                      ),
                      Marker(
                        markerId: MarkerId("destination"),
                        position: direction,
                        icon: destinationIcon,
                      ),
                    },
                    onMapCreated: (controller) =>
                        {_mapController.complete(controller)},
                  ),

                  /// show KM
                  Positioned(
                    bottom: 27.h,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 62.h,
                      width: 1.sw,
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      padding: EdgeInsets.fromLTRB(31, 0, 17.5, 0),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: SizedBox(
                                  height: 62.h,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      AppWidgets.textLocale(
                                        localeKey:
                                     LocaleKeys.route_built,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w400,
                                        maxLines: 1,
                                      ),
                                      AppWidgets.text(
                                        text: '${LocaleKeys.drive.tr()} ' +
                                            double.parse(
                                              calculateDistance(
                                                currentLocation!.latitude,
                                                currentLocation!.longitude,
                                                direction.latitude,
                                                direction.longitude,
                                              ).toStringAsFixed(3),
                                            ).speedFormat,
                                        fontSize: 12.sp,
                                        color: ColorName.gray2,
                                        fontWeight: FontWeight.w400,
                                        maxLines: 1,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Material(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: () {},
                                  borderRadius: BorderRadius.circular(12),
                                  splashColor: Colors.black.withOpacity(.5),
                                  child: Assets.images.icons.remove.svg(
                                    color: Colors.black,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 160,
                    left: 20,
                    right: 20,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        /// refresh
                        CustomMapWidget.floatButton(
                          child: buttonsIcons.last,
                          onTap: () {},
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            for (var i = 0; i < [0, 1, 2].length; i++)

                              /// refresh
                              Container(
                                margin: EdgeInsets.only(top: 13),
                                child: CustomMapWidget.floatButton(
                                  child: buttonsIcons[i],
                                  color: i == 0
                                      ? ColorName.green1
                                      : ColorName.blue,
                                  onTap: () {
                                    if (i == 0) {
                                    } else if (i == 1) {
                                      zoomControll(-1);
                                    } else {
                                      zoomControll(1);
                                    }
                                  },
                                ),
                              ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  void zoomControll(double zoomvalue) {
    setState(() {
      zoom += zoomvalue;
    });
    _googleController!.moveCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(
            sourseLoc.latitude,
            sourseLoc.longitude,
          ),
          zoom: zoom,
        ),
      ),
    );
  }

  double calculateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var a = 0.5 -
        cos((lat2 - lat1) * p) / 2 +
        cos(lat1 * p) * cos(lat2 * p) * (1 - cos((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }
}

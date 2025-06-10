import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  // 초기 카메라 위치 (위도, 경도, 줌 레벨)
  static const CameraPosition _initialPosition = CameraPosition(
    target: LatLng(37.5665, 126.9780), // 서울 시청 좌표 예시
    zoom: 14.0,
  );

  late GoogleMapController _mapController;

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('구글맵 띄우기 예제'),
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: _initialPosition,
        myLocationEnabled: true,      // 내 위치 버튼 활성화
        zoomControlsEnabled: false,   // 기본 줌 컨트롤 숨기기
        markers: {
          Marker(
            markerId: MarkerId('center'),
            position: LatLng(37.5665, 126.9780),
            infoWindow: InfoWindow(title: '서울 시청'),
          ),
        },
      ),
    );
  }
}

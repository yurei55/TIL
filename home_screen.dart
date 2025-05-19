import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Location _locationService = Location();
  GoogleMapController? _mapController;
  LatLng _currentPos = const LatLng(37.5665, 126.9780); // 초기 좌표 (서울 시청)

  @override
  void initState() {
    super.initState();
    _initLocation();
  }

  Future<void> _initLocation() async {
    // 권한 요청
    bool _serviceEnabled = await _locationService.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await _locationService.requestService();
      if (!_serviceEnabled) return;
    }

    PermissionStatus _permissionGranted = await _locationService.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await _locationService.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) return;
    }

    // 현재 위치 가져오기
    final locData = await _locationService.getLocation();
    setState(() {
      _currentPos = LatLng(locData.latitude!, locData.longitude!);
    });

    // 지도 카메라 이동
    _mapController?.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: _currentPos, zoom: 15),
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('K-Taste 홈'),
      ),
      body: Column(
        children: [
          // 검색창
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: '식당, 지역 검색',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onSubmitted: (query) {
                // TODO: 위치 기반 검색 로직 추가
              },
            ),
          ),

          // 지도
          Expanded(
            child: GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: _currentPos,
                zoom: 14,
              ),
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
              zoomControlsEnabled: false,
              markers: {
                // TODO: API로 받아온 식당 데이터로 Marker 집어넣기
                Marker(
                  markerId: const MarkerId('current'),
                  position: _currentPos,
                  infoWindow: const InfoWindow(title: '내 위치'),
                ),
              },
            ),
          ),
        ],
      ),
      // 나중에 BottomNavigationBar 연결
    );
  }
}

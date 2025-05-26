import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GoogleMapController? _mapController;
  LatLng _currentPos = const LatLng(37.5665, 126.9780); // 초기값 (서울 시청)

  @override
  void initState() {
    super.initState();
    _initLocation();
  }

  Future<void> _initLocation() async {
    // 위치 서비스 활성화 확인
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // 위치 서비스 꺼져 있으면 종료
      return;
    }

    // 권한 확인 및 요청
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        return;
      }
    }

    // 현재 위치 얻기
    final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      _currentPos = LatLng(position.latitude, position.longitude);
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
    );
  }
}

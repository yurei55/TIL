import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GoogleMapController? _mapController;
  LatLng _currentPos = const LatLng(37.5665, 126.9780);
  Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    _initLocation();
  }

  Future<void> _initLocation() async {
    print('🛰️ 위치 권한 확인 중...');
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      print('⚠️ 위치 서비스 꺼져 있음');
      return;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied || permission == LocationPermission.deniedForever) {
        print('❌ 위치 권한 거부됨');
        return;
      }
    }

    final position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    _currentPos = LatLng(position.latitude, position.longitude);
    print('✅ 위치 가져옴: $_currentPos');

    await _fetchNearbyRestaurants();

    setState(() {}); // 위치 및 마커 반영

    _mapController?.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: _currentPos, zoom: 15),
      ),
    );
  }

  Future<void> _fetchNearbyRestaurants() async {
    final apiKey = dotenv.env['GOOGLE_API_KEY'];
    print('🌐 Places API 요청 시작...');

    final url =
        'https://maps.googleapis.com/maps/api/place/nearbysearch/json'
        '?location=${_currentPos.latitude},${_currentPos.longitude}'
        '&radius=1000&type=restaurant&key=$apiKey';

    final response = await http.get(Uri.parse(url));
    final data = json.decode(response.body);

    print('📦 Places API 응답 상태: ${data['status']}');

    if (data['status'] == 'OK') {
      final List results = data['results'];
      print('🍽️ 검색된 식당 수: ${results.length}');
      final newMarkers = results.map((place) {
        final lat = place['geometry']['location']['lat'];
        final lng = place['geometry']['location']['lng'];
        final name = place['name'];

        return Marker(
          markerId: MarkerId(place['place_id']),
          position: LatLng(lat, lng),
          infoWindow: InfoWindow(title: name),
        );
      }).toSet();

      setState(() {
        _markers = newMarkers;
      });
    } else {
      print('❌ Places API Error: ${data['status']}');
      print('⚠️ 응답 전체 내용: $data');
    }
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
                // TODO: 나중에 검색 기능
              },
            ),
          ),
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
              markers: _markers,
            ),
          ),
        ],
      ),
    );
  }
}

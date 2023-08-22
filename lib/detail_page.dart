import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jeju_app/detail_image.dart';

class DetailPage extends StatefulWidget {
  final dynamic data;
  const DetailPage({
    super.key,
    required this.data,
  });

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final Completer<GoogleMapController> _controller = Completer();
  final List<Marker> _markers = [];
  void markerInfo() {
    _markers.add(
      Marker(
        markerId: const MarkerId('1'),
        position: LatLng(widget.data['latitude'], widget.data['longitude']),
      ),
    );
  }

  @override
  void initState() {
    print(widget.data);
    markerInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final widthSize = MediaQuery.of(context).size.width / 410;
    final heightSize = MediaQuery.of(context).size.height / 900;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: widthSize * 300,
              width: double.infinity,
              child: Hero(
                tag: 'image',
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return DetailImage(
                            image: widget.data['repPhoto']['photoid']
                                ['imgpath'],
                          );
                        },
                      ),
                    );
                  },
                  child: Image.network(
                    widget.data['repPhoto']['photoid']['imgpath'],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              '${widget.data['title'] ?? ''}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text('${widget.data['tag'] ?? ''}'),
            const SizedBox(
              height: 8,
            ),
            Text('${widget.data['roadaddress'] ?? ''}'),
            const SizedBox(
              height: 8,
            ),
            Text('${widget.data['introduction'] ?? ''}'),
            const SizedBox(
              height: 40,
            ),
            const Text(
              '위치',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            SizedBox(
              height: 400,
              child: GoogleMap(
                mapType: MapType.normal,
                markers: Set.from(_markers),
                initialCameraPosition: CameraPosition(
                  target:
                      LatLng(widget.data['latitude'], widget.data['longitude']),
                  zoom: 19,
                ), // 초기 카메라 위치
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

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
  @override
  void initState() {
    print(widget.data);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final widthSize = MediaQuery.of(context).size.width / 410;
    final heightSize = MediaQuery.of(context).size.height / 900;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: widthSize * 300,
            width: double.infinity,
            child: Hero(
              tag: 'image',
              child: Image.network(
                widget.data['repPhoto']['photoid']['imgpath'],
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text('${widget.data['title'] ?? ''}'),
        ],
      ),
    );
  }
}

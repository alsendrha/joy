import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailImage extends StatelessWidget {
  final String image;
  const DetailImage({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    final widthSize = MediaQuery.of(context).size.width / 410;
    final heightSize = MediaQuery.of(context).size.height / 844;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            CupertinoIcons.back,
            color: Colors.black,
          ),
        ),
      ),
      backgroundColor: Colors.grey[800],
      body: Center(
        child: InteractiveViewer(
          child: SizedBox(
            height: widthSize * 1000,
            child: Image.network(
              image,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}

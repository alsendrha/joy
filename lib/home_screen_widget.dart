import 'package:flutter/material.dart';

class MenuList extends StatefulWidget {
  const MenuList({super.key});

  @override
  State<MenuList> createState() => _MenuListState();
}

class _MenuListState extends State<MenuList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 16,
        ),
        const Padding(
          padding: EdgeInsets.only(left: 14),
          child: Text(
            '메뉴',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        const Divider(height: 1, thickness: 1),
        const SizedBox(
          height: 16,
        ),
        GestureDetector(
          onTap: () {
            print('1');
          },
          child: Container(
            width: double.infinity,
            height: 36,
            color: Colors.white.withOpacity(0),
            child: const Text(
              '관광지',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: Container(
            width: double.infinity,
            height: 36,
            color: Colors.white.withOpacity(0),
            child: const Text(
              '기념품점',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: Container(
            width: double.infinity,
            height: 36,
            color: Colors.white.withOpacity(0),
            child: const Text(
              '숙박시설',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: Container(
            width: double.infinity,
            height: 36,
            color: Colors.white.withOpacity(0),
            child: const Text(
              '먹거리',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: Container(
            width: double.infinity,
            height: 36,
            color: Colors.white.withOpacity(0),
            child: const Text(
              '행사',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            maximumSize: const Size(double.infinity, 50),
          ),
          onPressed: () {},
          child: const Text('확인'),
        ),
      ],
    );
  }
}

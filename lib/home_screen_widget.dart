import 'package:flutter/material.dart';

class MenuList extends StatefulWidget {
  final ValueChanged<int> menuNumber;
  const MenuList({
    super.key,
    required this.menuNumber,
  });

  @override
  State<MenuList> createState() => _MenuListState();
}

class _MenuListState extends State<MenuList> {
  int menuNumber = 1;

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
            setState(() {
              menuNumber = 1;
            });
            print('메뉴 : $menuNumber');
          },
          child: Container(
            width: double.infinity,
            height: 36,
            color: Colors.white.withOpacity(0),
            child: Text(
              '관광지',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: menuNumber == 1 ? Colors.blue : Colors.grey,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              menuNumber = 2;
            });
            print('메뉴 : $menuNumber');
          },
          child: Container(
            width: double.infinity,
            height: 36,
            color: Colors.white.withOpacity(0),
            child: Text(
              '기념품점',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: menuNumber == 2 ? Colors.blue : Colors.grey,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              menuNumber = 3;
            });
            print('메뉴 : $menuNumber');
          },
          child: Container(
            width: double.infinity,
            height: 36,
            color: Colors.white.withOpacity(0),
            child: Text(
              '숙박시설',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: menuNumber == 3 ? Colors.blue : Colors.grey,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              menuNumber = 4;
            });
            print('메뉴 : $menuNumber');
          },
          child: Container(
            width: double.infinity,
            height: 36,
            color: Colors.white.withOpacity(0),
            child: Text(
              '먹거리',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: menuNumber == 4 ? Colors.blue : Colors.grey,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              menuNumber = 5;
            });
            print('메뉴 : $menuNumber');
          },
          child: Container(
            width: double.infinity,
            height: 36,
            color: Colors.white.withOpacity(0),
            child: Text(
              '행사',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: menuNumber == 5 ? Colors.blue : Colors.grey,
              ),
            ),
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            maximumSize: const Size(double.infinity, 50),
          ),
          onPressed: () {
            Navigator.pop(context);
            setState(() {
              widget.menuNumber(
                menuNumber,
              );
            });
            print('메뉴 : $menuNumber');
          },
          child: const Text('확인'),
        ),
      ],
    );
  }
}

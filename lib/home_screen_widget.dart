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
    final widthSize = MediaQuery.of(context).size.width / 410;
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
        Padding(
          padding: EdgeInsets.symmetric(horizontal: widthSize * 12),
          child: Column(
            children: [
              MenuWidget(
                onTap: () {
                  setState(() {
                    menuNumber = 1;
                  });
                  print('메뉴 : $menuNumber');
                },
                icons: menuNumber == 1
                    ? Icons.check_circle_outline_rounded
                    : Icons.circle_outlined,
                iconColor: menuNumber == 1 ? Colors.blue : Colors.grey,
                text: '관광지',
                textColor: menuNumber == 1 ? Colors.blue : Colors.grey,
              ),
              MenuWidget(
                onTap: () {
                  setState(() {
                    menuNumber = 2;
                  });
                  print('메뉴 : $menuNumber');
                },
                icons: menuNumber == 2
                    ? Icons.check_circle_outline_rounded
                    : Icons.circle_outlined,
                iconColor: menuNumber == 2 ? Colors.blue : Colors.grey,
                text: '기념품점',
                textColor: menuNumber == 2 ? Colors.blue : Colors.grey,
              ),
              MenuWidget(
                onTap: () {
                  setState(() {
                    menuNumber = 3;
                  });
                  print('메뉴 : $menuNumber');
                },
                icons: menuNumber == 3
                    ? Icons.check_circle_outline_rounded
                    : Icons.circle_outlined,
                iconColor: menuNumber == 3 ? Colors.blue : Colors.grey,
                text: '숙박시설',
                textColor: menuNumber == 3 ? Colors.blue : Colors.grey,
              ),
              MenuWidget(
                onTap: () {
                  setState(() {
                    menuNumber = 4;
                  });
                  print('메뉴 : $menuNumber');
                },
                icons: menuNumber == 4
                    ? Icons.check_circle_outline_rounded
                    : Icons.circle_outlined,
                iconColor: menuNumber == 4 ? Colors.blue : Colors.grey,
                text: '먹거리',
                textColor: menuNumber == 4 ? Colors.blue : Colors.grey,
              ),
              MenuWidget(
                onTap: () {
                  setState(() {
                    menuNumber = 5;
                  });
                  print('메뉴 : $menuNumber');
                },
                icons: menuNumber == 5
                    ? Icons.check_circle_outline_rounded
                    : Icons.circle_outlined,
                iconColor: menuNumber == 5 ? Colors.blue : Colors.grey,
                text: '행사',
                textColor: menuNumber == 5 ? Colors.blue : Colors.grey,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
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
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class MenuWidget extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icons;
  final String text;
  final Color textColor, iconColor;
  const MenuWidget({
    super.key,
    required this.onTap,
    required this.icons,
    required this.text,
    required this.textColor,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    final widthSize = MediaQuery.of(context).size.width / 410;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 36,
        color: Colors.white.withOpacity(0),
        child: Row(
          children: [
            Icon(
              icons,
              color: iconColor,
            ),
            SizedBox(
              width: widthSize * 4,
            ),
            Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

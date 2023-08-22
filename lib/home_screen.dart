import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jeju_app/detail_page.dart';
import 'package:jeju_app/home_screen_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List listData = [];
  bool isLoading = false;
  int menuListData = 1;
  int currentPage = 1;
  final ScrollController _scrollController = ScrollController();

  Future<void> jejuData(page) async {
    try {
      setState(() {
        isLoading = true;
      });
      String url =
          'https://api.visitjeju.net/vsjApi/contents/searchList?apiKey=8mbfp3rur332azyf&locale=kr&category=c$menuListData&page=$page';
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        print('데이터 확인 : ${response.body}');
        var list = jsonDecode(response.body)['items'];

        setState(() {
          if (page == 1) {
            listData = list; // 첫 번째 페이지인 경우 기존 데이터를 대체합니다.
          } else {
            listData.addAll(list); // 다음 페이지인 경우 기존 데이터에 추가합니다.
          }
          isLoading = false;
        });
      }
    } catch (error) {
      print('데이터 에러 : $error');
    }
  }

  void reLoadPage(index) async {
    final reLoad = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return DetailPage(
            data: listData[index],
          );
        },
      ),
    );
  }

  void menuList() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      builder: (context) {
        return MenuList(
          menuNumber: (value) {
            setState(() {
              menuListData = value;
              currentPage = 1; // 페이지를 리셋합니다.
              jejuData(currentPage);
              _scrollController.animateTo(0,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut);
            });
          },
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();

    jejuData(currentPage);

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        if (!isLoading) {
          currentPage++;
          jejuData(currentPage);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final widthSize = MediaQuery.of(context).size.width / 410;
    final heightSize = MediaQuery.of(context).size.height / 844;

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(controller: _scrollController, slivers: [
        SliverAppBar(
          elevation: 0.5,
          backgroundColor: Colors.white,
          flexibleSpace: FlexibleSpaceBar(
            background: Padding(
              padding: EdgeInsets.only(
                top: heightSize * 30,
                left: widthSize * 24,
                right: widthSize * 24,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(
                    Icons.language_rounded,
                    size: 40,
                  ),
                  const Icon(
                    Icons.add,
                    color: Colors.transparent,
                  ),
                  GestureDetector(
                    onTap: () {
                      menuList();
                    },
                    child: const Icon(
                      Icons.menu,
                      size: 40,
                    ),
                  ),
                ],
              ),
            ),
          ),
          floating: true,
        ),
        SliverList.builder(
          itemCount: listData.length,
          itemBuilder: (context, index) {
            String imageUrl = listData[index]['repPhoto']['photoid']['imgpath'];
            return GestureDetector(
              onTap: () {
                reLoadPage(index);
              },
              child: Container(
                height: widthSize * 300,
                width: double.infinity,
                margin: EdgeInsets.symmetric(
                  horizontal: widthSize * 24,
                  vertical: heightSize * 12,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 6,
                      color: Colors.grey.withOpacity(0.5),
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    isLoading
                        ? const Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircularProgressIndicator(),
                              ],
                            ),
                          )
                        : SizedBox(
                            height: widthSize * 200,
                            width: double.infinity,
                            child: Hero(
                              tag: 'image',
                              child: ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  topRight: Radius.circular(15),
                                ),
                                child: imageUrl.isNotEmpty
                                    ? Image.network(
                                        imageUrl,
                                        fit: BoxFit.cover,
                                      )
                                    : Image.asset(
                                        'images/no_image.png',
                                        fit: BoxFit.cover,
                                      ),
                              ),
                            ),
                          ),
                    isLoading
                        ? const Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircularProgressIndicator(),
                              ],
                            ),
                          )
                        : Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.only(left: widthSize * 12),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        listData[index]['title'] ?? '',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                        ),
                                      ),
                                      SizedBox(
                                        height: heightSize * 8,
                                      ),
                                      Text(
                                        listData[index]['alltag'] ?? '',
                                        style: const TextStyle(
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      SizedBox(
                                        height: heightSize * 8,
                                      ),
                                      Text(
                                          listData[index]['roadaddress'] ?? ''),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                  ],
                ),
              ),
            );
          },
        ),
      ]),
    );
  }
}

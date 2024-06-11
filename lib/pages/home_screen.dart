import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ngajidong/component/tab_item.dart';
import 'package:ngajidong/model/dzikir_detail_model.dart';
import 'package:ngajidong/tabs/doa_tab.dart';
import 'package:ngajidong/tabs/dzikr_tab.dart';
import 'package:ngajidong/tabs/surah_tab.dart';
import 'package:ngajidong/theme.dart';
import 'package:svg_flutter/svg.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = 'home_screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: _appBar(),
      body: _body(),
    );
  }
}

AppBar _appBar() => AppBar(
  centerTitle: true,
  backgroundColor: background,
  elevation: 0,
  leading: IconButton(
    onPressed: () {}, icon: SvgPicture.asset('assets/svg/menu_icon.svg')
  ),
  actions: [
    IconButton(onPressed: () {}, icon: SvgPicture.asset('assets/svg/search_icon.svg'))
  ],
);

BottomNavigationBarItem _bottomNavigationBarItem(
        {required String icon, required String label}) =>
    BottomNavigationBarItem(
        icon: SvgPicture.asset(icon, color: Colors.black),
        activeIcon: SvgPicture.asset(icon, color: Colors.black),
        label: label);

    DefaultTabController _body() => DefaultTabController(
    length: 3,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      child: NestedScrollView(
          headerSliverBuilder:
              (BuildContext context, bool innnerBoxIsScrolled) => [
                    SliverToBoxAdapter(
                      child: _salam(),
                    ),
                    SliverAppBar(
                      pinned: true,
                      elevation: 0,
                      backgroundColor :background,
                      automaticallyImplyLeading: false,
                      shape: Border(
                          bottom: BorderSide(
                              width: 3, color: primary.withOpacity(0.0))),
                      bottom: PreferredSize(
                          preferredSize: const Size.fromHeight(0),
                          child: TabBar(
                            labelColor: primary,
                            indicatorColor: primary,
                            unselectedLabelStyle: TextStyle(color: secondary),
                            indicatorWeight: 3,
                            tabs: [
                              itemTab(label: "Surah"),
                              itemTab(label: "Dzikir"),
                              itemTab(label: "Doa")
                            ],
                          )),
                    )
                  ],
          body: const TabBarView(
            children: [TabSurah(), TabDzikir(), TabDoa()],
          )),
    ));

    Column _salam() =>
    Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text('Assalamualaikum!!!',
          style: GoogleFonts.plusJakartaSans(
              fontSize: 14, fontWeight: FontWeight.w600, color: primary)),
      Text('Maisy',
          style:
              GoogleFonts.plusJakartaSans(fontSize: 28, fontWeight: FontWeight.bold, color: secondary)),
      const SizedBox(
        height: 20,
      ),
      Stack(children: [
        Container(
          height: 131,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color.fromARGB(255, 255, 174, 0), Color.fromARGB(255, 246, 127, 0)])),
        ),
        Positioned(
            bottom: 0,
            right: 0,
            child: SvgPicture.asset('assets/svg/quran_banner.svg')),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SvgPicture.asset('assets/svg/book.svg'),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Last Read",
                    style: GoogleFonts.plusJakartaSans(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: secondary),
                  )
                ],
              ),
              const SizedBox(height: 10),
              Text(
                'Al-Fatihah',
                style: GoogleFonts.plusJakartaSans(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: secondary),
              ),
              const SizedBox(height: 10),
              Text(
                'ayat 7',
                style: GoogleFonts.plusJakartaSans(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: secondary),
              ),
            ],
          ),
        ),
      ]),
    ]);


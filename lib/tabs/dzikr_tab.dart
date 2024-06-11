import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ngajidong/model/dzikir_model.dart';
import 'package:ngajidong/pages/detail_screen.dart';
import 'package:ngajidong/pages/detail_screen_dzikir.dart';
import 'package:ngajidong/theme.dart';
import 'package:ngajidong/viewmodel/dzikir_umum_viewmodel.dart';
import 'package:svg_flutter/svg.dart';

class TabDzikir extends StatelessWidget {
  const TabDzikir({super.key});
  @override
  Widget build(BuildContext context) {
    final DzikirUmumViewModel _viewModel = DzikirUmumViewModel();
    return FutureBuilder<List<DzikirUmum>>(
        future: _viewModel.getListDzikirUmum(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: Text("Tidak Ada Data"),
            );
          }
          return ListView.separated(
              itemBuilder: (context, index) => _itemList(
                  context: context, dzikirUmum: snapshot.data!.elementAt(index)),
              separatorBuilder: (context, index) =>
                  Divider(color: background.withOpacity(0.1)),
              itemCount: snapshot.data!.length);
        });
  }

  Widget _itemList({required BuildContext context, required DzikirUmum dzikirUmum}) =>
      InkWell(
        onTap: () {
          Navigator.pushNamed(context, DetailScreenDzikir.routeName, arguments: dzikirUmum.id.toString());
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Row(children: [
            Stack(
              children : [
            SvgPicture.asset('assets/svg/nomor_surah.svg'),
            SizedBox(
              height: 36,
              width: 36,
              child: Center(
                  child: Text(dzikirUmum.id.toString(),
                      style: GoogleFonts.plusJakartaSans(
                          fontWeight: FontWeight.w500, color: Colors.white)
                          )
                          ),
            )
          ],
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(dzikirUmum.judul.toString(),
              style: GoogleFonts.plusJakartaSans(
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontSize: 16
              ),
              ),
            ],
          )),
        ]),
        ),
      );
}
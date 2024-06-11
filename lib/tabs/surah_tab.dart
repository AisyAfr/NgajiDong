
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ngajidong/model/surah_model.dart';
import 'package:ngajidong/pages/detail_screen.dart';
import 'package:ngajidong/theme.dart';
import 'package:ngajidong/viewmodel/surah_viewmodel.dart';
import 'package:svg_flutter/svg.dart';

class TabSurah extends StatelessWidget {
  const TabSurah({super.key});
  @override
  Widget build(BuildContext context) {
    final SurahViewModel _viewModel = SurahViewModel();
    return FutureBuilder<List<Surah>>(
        future: _viewModel.getListSurah(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: Text("Tidak Ada Data"),
            );
          }
          return ListView.separated(
              itemBuilder: (context, index) => _itemList(
                  context: context, surah: snapshot.data!.elementAt(index)),
              separatorBuilder: (context, index) =>
                  Divider(color: background.withOpacity(0.1)),
              itemCount: snapshot.data!.length);
        });
  }

  Widget _itemList({required BuildContext context, required Surah surah}) =>
      InkWell(
        onTap: () {
          Navigator.pushNamed(context, DetailScreen.routeName, arguments: surah.nomor.toString()); 
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
                  child: Text(surah.nomor.toString(),
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
              Text(surah.nama_latin,
              style: GoogleFonts.plusJakartaSans(
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontSize: 16
              ),
              ),
              Text("${surah.tempat_turun} - ${surah.jumlah_ayat}",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w300,
                color: primary,
                fontSize: 16
              ),
              ),
            ],
          )),
          Text(surah.nama,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
                color: primary,
                fontSize: 18
          ),
          )
        ]),
        ),
      );
}

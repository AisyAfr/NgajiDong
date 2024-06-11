import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ngajidong/model/ayat_model.dart';
import 'package:ngajidong/pages/home_screen.dart';
import 'package:ngajidong/theme.dart';
import 'package:ngajidong/viewmodel/ayat_viewmodel.dart';
import 'package:svg_flutter/svg.dart';

class DetailScreen extends StatelessWidget {
  static const routeName = 'detail_screen';
  final String id_surah;
  const DetailScreen({super.key, required this.id_surah});

  @override
  Widget build(BuildContext context) {
    final AyatViewModel _viewModel = AyatViewModel();
    final assetsAudioPlayer = AssetsAudioPlayer();
    return FutureBuilder(
          future: _viewModel.getListAyat(id_surah),
          builder: (context, AsyncSnapshot<AyatModel> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else if (snapshot.hasData) {
              return Scaffold(
                appBar: AppBar(
                  title: Text(snapshot.data!.namaLatin.toString()),
                  leading: IconButton(onPressed: (){
                    Navigator.pop(context);
                    assetsAudioPlayer.stop();
                  },
                  icon: const Icon(Icons.arrow_back),
                  ),
                  actions: [
                    IconButton(onPressed: () {
                      assetsAudioPlayer.open(Audio.network(snapshot.data!.audio.toString()));
                    }, icon: const Icon(Icons.volume_up_rounded)),
                    IconButton(onPressed: () {
                      assetsAudioPlayer.playOrPause();
                    }, icon: const Icon(Icons.stop))
                  ],
                ),
                backgroundColor: background,
                body: ListView.separated(
                    itemBuilder: (context, index) => _itemList(
                        context: context,
                        ayat: snapshot.data!.ayat!.elementAt(index)),
                    separatorBuilder: (context, index) =>
                        Divider(color: Colors.grey.withOpacity(0.1)),
                    itemCount: snapshot.data!.ayat!.length),
              );
            } else {
              return Center(child: Text('No Data Available'));
            }
          });
  }

  Widget _itemList({required BuildContext context, required Ayat ayat,}) =>
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Row(
          children: [
            Stack(
              children: [
                SvgPicture.asset('assets/svg/nomor_surah.svg'),
                SizedBox(
                  height: 36,
                  width: 36,
                  child: Center(
                      child: Text(ayat.nomor.toString(),
                          style: GoogleFonts.plusJakartaSans(
                              fontWeight: FontWeight.w500,
                              color: secondary))),
                )
              ],
            ),
            const SizedBox(
              width: 10,
              height: 40,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  ayat.ar.toString(),
                  style: GoogleFonts.amiriQuran(
                    fontWeight: FontWeight.w500,
                    color: secondary,
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  ayat.tr.toString(),
                  style: GoogleFonts.amiri(
                      fontWeight: FontWeight.w300,
                      color: primary,
                      fontSize: 12),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  ayat.idn.toString(),
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w300,
                      color: secondary,
                      fontSize: 12),
                ),
              ],
            )),
          ],
        ),
      );
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ngajidong/model/dzikir_detail_model.dart';
import 'package:ngajidong/model/dzikir_model.dart';
import 'package:ngajidong/theme.dart';
import 'package:ngajidong/viewmodel/dzikir_viewmodel.dart';
import 'package:svg_flutter/svg.dart';

class DetailScreenDzikir extends StatelessWidget {
  static const routeName = 'detail_screen_dzikir';
  final String id_dzikir;
  const DetailScreenDzikir({super.key, required this.id_dzikir});

  @override
  Widget build(BuildContext context) {
    final DzikirViewModel _viewModel = DzikirViewModel();
    return Scaffold(
      backgroundColor: background,
      body: FutureBuilder(
          future: _viewModel.getListDzikirDetail(id_dzikir),
          builder: (context, AsyncSnapshot<DzikirDetail> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else if (snapshot.hasData) {
              return ListView.separated(
                  itemBuilder: (context, index) => _itemList(
                      context: context,
                      dzikir: snapshot.data!.dzikir!.elementAt(index)),
                  separatorBuilder: (context, index) =>
                      Divider(color: Colors.grey.withOpacity(0.1)),
                  itemCount: snapshot.data!.dzikir!.length);
            } else {
              return Center(child: Text('No Data Available'));
            }
          }),
    );
  }

  Widget _itemList({required BuildContext context, required Dzikir dzikir}) =>
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Row(
          children: [
            const SizedBox(
              width: 10,
              height: 40,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  dzikir.title.toString(),
                  style: GoogleFonts.plusJakartaSans(
                    fontWeight: FontWeight.w500,
                    color: yellow,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  dzikir.arabic.toString(),
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
                  dzikir.latin.toString(),
                  style: GoogleFonts.amiri(
                      fontWeight: FontWeight.w300,
                      color: primary,
                      fontSize: 12),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  dzikir.translation.toString(),
                  style: GoogleFonts.plusJakartaSans(
                      fontWeight: FontWeight.w300,
                      color: secondary,
                      fontSize: 12),
                ),
                Text(
                  dzikir.fawaid.toString(),
                  style: GoogleFonts.plusJakartaSans(
                      fontWeight: FontWeight.w300,
                      color: third,
                      fontSize: 12),
                ),
                Text(
                  dzikir.source.toString(),
                  style: GoogleFonts.plusJakartaSans(
                      fontWeight: FontWeight.w300,
                      color: primary,
                      fontSize: 12),
                ),
              ],
            )),
          ],
        ),
      );
}
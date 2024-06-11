import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ngajidong/model/doa_model.dart';
import 'package:ngajidong/theme.dart';
import 'package:ngajidong/viewmodel/doa_viewmodel.dart';
import 'package:svg_flutter/svg.dart';

class TabDoa extends StatelessWidget {
  const TabDoa({super.key});
  @override
  Widget build(BuildContext context) {
    final DoaViewModel _viewModel = DoaViewModel();
    return FutureBuilder<List<Doa>>(
        future: _viewModel.getListDoa(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: Text("Tidak Ada Data"),
            );
          }
          return ListView.separated(
              itemBuilder: (context, index) => _itemList(
                  context: context, doa: snapshot.data!.elementAt(index)),
              separatorBuilder: (context, index) =>
                  Divider(color: background.withOpacity(0.1)),
              itemCount: snapshot.data!.length);
        });
  }

  Widget _itemList({required BuildContext context, required Doa doa}) =>
      Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Row(children: [
          const SizedBox(
            width: 10,
          ),
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          Text(doa.title.toString(),
          style: GoogleFonts.plusJakartaSans(
            fontWeight: FontWeight.w500,
                color: yellow,
                fontSize:16
          ),
          ),
          const SizedBox(
            height: 15,
          ),
              Text(doa.arabic.toString(),
              style: GoogleFonts.plusJakartaSans(
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontSize: 18
              ),
              ),
              Text(doa.latin.toString(),
              style: GoogleFonts.amiriQuran(
                fontWeight: FontWeight.w300,
                color: primary,
                fontSize: 14
              ),
              ),
              const SizedBox(
            height: 15,
          ),
              Text(doa.translation.toString(),
              style: GoogleFonts.amiriQuran(
                fontWeight: FontWeight.w300,
                color: secondary,
                fontSize: 14
              ),
              ),
              const SizedBox(
            height: 15,
          ),
              Text(doa.fawaid.toString(),
              style: GoogleFonts.amiriQuran(
                fontWeight: FontWeight.w300,
                color: third,
                fontSize: 14
              ),
              ),
              const SizedBox(
            height: 7,
          ),
              Text(doa.source.toString(),
              style: GoogleFonts.amiriQuran(
                fontWeight: FontWeight.w300,
                color: primary,
                fontSize: 14
              ),
              ),
            ],
          )),
        ]),
        );
}
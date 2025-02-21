import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Tab itemTab({required String label}) => Tab(
      child: Text(
        label,
        style: GoogleFonts.plusJakartaSans(fontSize: 16, fontWeight: FontWeight.w600),
      ),
    );

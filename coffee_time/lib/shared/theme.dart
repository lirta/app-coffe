part of 'shared.dart';

const double defaultMargin = 24;

Color mainColor = Color(0xFFD2F3F8);
Color accentHitam = Color(0xFF1A282A);
Color accentPutih = Color(0xFFFFFFFF);
Color accentBiru = Color(0xFF3680EF);
Color b = Color(0xff000000);

TextStyle blackTextFont =
    GoogleFonts.quicksand().copyWith(color: b, fontWeight: FontWeight.w500);
TextStyle whiteTextFont = GoogleFonts.quicksand()
    .copyWith(color: accentPutih, fontWeight: FontWeight.w500);
TextStyle biruTextFont = GoogleFonts.quicksand()
    .copyWith(color: accentBiru, fontWeight: FontWeight.w500);

TextStyle hitamNumberFont =
    GoogleFonts.openSans().copyWith(color: b, fontWeight: FontWeight.w500);
TextStyle biruNumberFont = GoogleFonts.openSans()
    .copyWith(color: accentBiru, fontWeight: FontWeight.w500);

import 'package:flutter_pdfview/flutter_pdfview.dart';
import '../../../../config.dart';

class PdfViewerScreen extends StatelessWidget {
  final String filePath;
  final String fileName;

  const PdfViewerScreen(
      {super.key, required this.fileName, required this.filePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: SvgPicture.asset(eSvgAssets.arrowLeft,
                    colorFilter: ColorFilter.mode(
                        appColor(context).whiteBg, BlendMode.srcIn))
                .marginSymmetric(vertical: 15)
                .inkWell(onTap: () => Navigator.pop(context)),
            title: Text(fileName, style: appCss.dmDenseMedium16),
            backgroundColor: appColor(context).primary),
        body: PDFView(filePath: filePath));
  }
}

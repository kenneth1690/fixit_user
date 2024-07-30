

import 'package:fixit_user/models/pages_model.dart';
import 'package:flutter_html/flutter_html.dart';

import '../../../../config.dart';

class PageDetail extends StatelessWidget {
  final PagesModel? page;
  const PageDetail({super.key,this.page});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leadingWidth: 80,
            title: Text(page!.title!,
                style: appCss.dmDenseBold18
                    .textColor(appColor(context).darkText)),
            centerTitle: true,
            leading: CommonArrow(arrow: eSvgAssets.arrowLeft,onTap: ()=> route.pop(context))
                .padding(vertical: Insets.i8)),
        body: ListView(children: [
          Html(data: page!.content)
        ]).paddingAll(Insets.i20));
  }
}

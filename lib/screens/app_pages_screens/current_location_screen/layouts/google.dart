import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

import '../../../../config.dart';

class SearchLocation extends StatefulWidget {
  const SearchLocation({super.key});

  @override
  State<SearchLocation> createState() => _SearchLocationState();
}

class _SearchLocationState extends State<SearchLocation> {
  List placePredictions = [];
  FocusNode focusNode = FocusNode();
  TextEditingController search = TextEditingController();
  String apiKey = "AIzaSyDNuJFHTBoAJeSsDdJhyuQrpkDo5_bl6As";

  placeAutoComplete(query) async {
    String api = "https://maps.googleapis.com/maps/api/place/autocomplete/json";
    String request = "$api?input=${search.text}&key=${appSettingModel!.firebase!.googleMapApiKey??api}";

    var res = await http.get(Uri.parse(request));

    var result = res.body.toString();
    log("result :$result");
    if (res.statusCode == 200) {
      setState(() {
        placePredictions = jsonDecode(res.body.toString())['predictions'];
      });
    } else {
      log("EEERE :${res.body}");
    }
    print("HGDFjsgf:$res");
    setState(() {});
  }

  findCord(context,placeID) async {
    var d = await http.get(Uri.parse(
        "https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeID&key=$apiKey"));
    var result = d.body.toString();
    dynamic a = jsonDecode(d.body);
    log("result :${a['result']['geometry']['location']}");

    route.pop(context,arg:LatLng(a['result']['geometry']['location']['lat'], a['result']['geometry']['location']['lng']) );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:  AppBarCommon(title: language(context, appFonts.location)),
        body: ListView(
          children: [
            TextFieldCommon(
              border: OutlineInputBorder(
                borderSide: BorderSide(color: appColor(context).stroke)
              ),
                    focusNode: focusNode,
                    onChanged: (v) => placeAutoComplete(v),
                    controller: search,
                    hintText:  language(context, appFonts.searchHere),
                    prefixIcon: eSvgAssets.location)
                .paddingSymmetric(horizontal: Insets.i20),
            const VSpace(Sizes.s20),

            Divider(color: appColor(context).stroke, height: 0),
            if (placePredictions.isNotEmpty) const VSpace(Sizes.s20),
            ButtonCommon(
                margin: 20,
                onTap: ()=> route.pop(context),
                title: language(context, appFonts.useCurrentLocation),
                icon: SvgPicture.asset(eSvgAssets.zipcode,colorFilter: ColorFilter.mode(appColor(context).whiteBg, BlendMode.srcIn),)),
            const VSpace(Sizes.s20),
            ...placePredictions.asMap().entries.map((e) => LocationListTile(
                  loc: e.value['description'],
                  onTap: () {
                    log("dvghh:${e.value}");
                    findCord(context,e.value['place_id']);
                  },
                )),
          ],
        ));
  }
}

class LocationListTile extends StatelessWidget {
  final String? loc;
  final GestureTapCallback? onTap;

  const LocationListTile({super.key, this.loc, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SvgPicture.asset(eSvgAssets.location),
            const HSpace(Sizes.s10),
            Expanded(child: Text(loc ?? "")),
          ],
        ).inkWell(onTap: onTap),
        Divider(color: appColor(context).stroke,height: 0,).paddingSymmetric(vertical: Sizes.s15)
      ],
    ).paddingSymmetric(horizontal: Sizes.s20);
  }
}

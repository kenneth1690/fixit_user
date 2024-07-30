import 'dart:developer';

import 'package:country_list_pick/country_selection_theme.dart';
import 'package:fixit_user/widgets/country_picker_custom/selection_item_list.dart';

import '../../config.dart';

List<Map> jsonList = countriesEnglish;

List<CountryCodeCustom> element = jsonList
    .map((s) => CountryCodeCustom(
          name: s['name'],
          code: s['code'],
          dialCode: s['dial_code'],
          flagUri: 'flags/${s['code'].toLowerCase()}.png',
        ))
    .toList();

class CountryListPickCustom extends StatefulWidget {
  const CountryListPickCustom(
      {super.key,
      this.onChanged,
      this.initialSelection,
      this.appBar,
      this.pickerBuilder,
      this.countryBuilder,
      this.theme,
      this.useUiOverlay = true,
      this.useSafeArea = false});

  final String? initialSelection;
  final ValueChanged<CountryCodeCustom?>? onChanged;
  final PreferredSizeWidget? appBar;
  final Widget Function(BuildContext context, CountryCodeCustom? countryCode)?
      pickerBuilder;
  final CountryTheme? theme;
  final Widget Function(BuildContext context, CountryCodeCustom countryCode)?
      countryBuilder;
  final bool useUiOverlay;
  final bool useSafeArea;

  @override
  CountryListPickCustomState createState() {
    return CountryListPickCustomState();
  }
}

class CountryListPickCustomState extends State<CountryListPickCustom> {
  CountryCodeCustom? selectedItem;
  List<CountryCodeCustom> elements = [];

  CountryListPickCustomState();

  @override
  void initState() {
    elements = element;
    setState(() {});

    if (widget.initialSelection != null) {
      selectedItem = elements.firstWhere(
              (e) =>
          (e.code?.toUpperCase() ==
              widget.initialSelection!.toUpperCase()) ||
              (e.dialCode == widget.initialSelection),
          orElse: () => elements[0] as CountryCodeCustom);
    } else {
      selectedItem = elements[0];

      getDial();
    }

    setState(() {});
    print("selectedItem :${widget.initialSelection}");
    super.initState();
  }

  void _awaitFromSelectScreen(BuildContext context, PreferredSizeWidget? appBar,
      CountryTheme? theme) async {
    final result = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SelectionList(
            elements,
            selectedItem,
            appBar: widget.appBar ??
                AppBar(
                  backgroundColor:
                      Theme.of(context).appBarTheme.backgroundColor,
                  title: Text(language(context, appFonts.selectCountry)),
                ),
            theme: theme,
            countryBuilder: widget.countryBuilder,
            useUiOverlay: widget.useUiOverlay,
            useSafeArea: widget.useSafeArea,
          ),
        ));

    setState(() {
      selectedItem = result ?? selectedItem;
      widget.onChanged!(result ?? selectedItem);
    });
  }

  getDial() async {
    log("profile.dialCode :${userModel!.code}");
    selectedItem = elements.firstWhere((e) {
      log("EEEE:${e} //${e.dialCode}");
      return (e.dialCode.toString() == "+${userModel!.code!.toUpperCase()}");
    }, orElse: () => elements[0] as CountryCodeCustom);

    setState(() {});
    log("selectedItemselectedItem:$selectedItem");
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        _awaitFromSelectScreen(context, widget.appBar, widget.theme);
      },
      child: widget.pickerBuilder != null
          ? widget.pickerBuilder!(context, selectedItem)
          : Flex(
              direction: Axis.horizontal,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                if (widget.theme?.isShowFlag ?? true == true)
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Image.asset(
                        selectedItem!.flagUri!,
                        package: 'country_list_pick',
                        width: 32.0,
                      ),
                    ),
                  ),
                if (widget.theme?.isShowCode ?? true == true)
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Text(selectedItem.toString()),
                    ),
                  ),
                if (widget.theme?.isShowTitle ?? true == true)
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Text(selectedItem!.toCountryStringOnly()),
                    ),
                  ),
                if (widget.theme?.isDownIcon ?? true == true)
                  const Flexible(
                    child: Icon(Icons.keyboard_arrow_down),
                  )
              ],
            ),
    );
  }
}

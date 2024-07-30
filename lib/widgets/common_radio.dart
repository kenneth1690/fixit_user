import 'dart:developer';

import '../config.dart';

class CommonRadioBool extends StatelessWidget {
  final int? index;
  final GestureTapCallback? onTap;
  final bool? selectedIndex;
  const CommonRadioBool({super.key,this.onTap,this.index,this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return  Container(
        width: Sizes.s22,
        height: Sizes.s22,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: selectedIndex! ? appColor(context).trans : appColor(context).stroke),
            color: selectedIndex! ? appColor(context).primary.withOpacity(0.18) :  appColor(context).trans ),
        child:  selectedIndex! ? Icon(Icons.circle,
            color: appColor(context).primary, size: 13) : null).inkWell(onTap: onTap);
  }
}


class CommonRadio extends StatelessWidget {
  final int? index,selectedIndex;
  final GestureTapCallback? onTap;
  const CommonRadio({super.key,this.onTap,this.index,this.selectedIndex});

  @override
  Widget build(BuildContext context) {

    return  Container(
        width: Sizes.s22,
        height: Sizes.s22,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: index == selectedIndex ? appColor(context).trans : appColor(context).stroke),
            color: selectedIndex == null?  appColor(context).trans :index == selectedIndex ? appColor(context).primary.withOpacity(0.18) :  appColor(context).trans ),
        child: selectedIndex != null && index == selectedIndex ? Icon(Icons.circle,
            color: appColor(context).primary, size: 13) : null).inkWell(onTap: onTap);
  }
}
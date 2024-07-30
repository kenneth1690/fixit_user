
import '../../../../config.dart';

class HomeBlog extends StatelessWidget {
  final List<BlogModel> firstTwoBlogList,blogList;
  const HomeBlog({super.key, required this.firstTwoBlogList, required this.blogList});

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: firstTwoBlogList.isNotEmpty
            ? Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: firstTwoBlogList
                .asMap()
                .entries
                .map((e) =>
                LatestBlogLayout(data: e.value))
                .toList())
            .paddingOnly(left: Insets.i20)
            : Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: blogList
                .asMap()
                .entries
                .map((e) =>
                LatestBlogLayout(data: e.value))
                .toList())
            .paddingOnly(left: Insets.i20));
  }
}

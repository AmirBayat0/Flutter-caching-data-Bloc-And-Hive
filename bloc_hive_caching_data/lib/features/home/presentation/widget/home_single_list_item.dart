import 'package:bloc_hive_caching_data/core/utils/custom_image_viewer.dart';
import 'package:bloc_hive_caching_data/features/home/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeSingeListItem extends StatelessWidget {
  const HomeSingeListItem({
    super.key,
    required this.current,
  });

  final Product current;

  @override
  Widget build(BuildContext context) {
    String createdAt = formatDateString(current.updatedAt.toString());
    String updatedAt = formatDateString(current.updatedAt.toString());

    Size size;
    double height, width;
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    final ThemeData theme = Theme.of(context);
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: height * .007,
        horizontal: height * .01,
      ),
      height: height * .2,
      decoration: BoxDecoration(
        color: theme.dialogBackgroundColor,
        borderRadius: BorderRadius.circular(height * .02),
      ),
      child: Material(
        color: theme.scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(height * .02),
        elevation: 1,
        child: Row(
          children: [
            Container(
              width: width * 0.42,
              color: theme.dialogBackgroundColor,
              child: CustomImageViewer.show(
                context: context,
                url: current.photoUrl,
              ),
            ),
            SizedBox(
              width: width * .02,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        current.name,
                        style: theme.textTheme.titleLarge,
                      ),
                      SizedBox(
                        height: 1,
                      ),
                      Text(
                        current.description,
                        style: theme.textTheme.labelLarge
                            ?.copyWith(color: theme.unselectedWidgetColor),
                        maxLines: 3,
                      ),
                      SizedBox(
                        height: 9,
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: width * .03),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Created ',
                              style: theme.textTheme.labelMedium,
                            ),
                            Text(
                              createdAt,
                              style: theme.textTheme.labelLarge,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: width * .03),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Last Update ',
                              style: theme.textTheme.labelMedium,
                            ),
                            Text(
                              updatedAt,
                              style: theme.textTheme.labelLarge,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: width * .03),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: theme.primaryColor,
                              borderRadius: BorderRadius.circular(3)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 2),
                            child: Text(
                              current.category.toUpperCase(),
                              style: theme.textTheme.labelLarge!.copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          "\$" + current.price.toString(),
                          style: theme.textTheme.labelLarge,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

String formatDateString(String dateString) {
  // Parse the string into a DateTime object
  DateTime dateTime = DateTime.parse(dateString);

  // Format the DateTime object as desired
  String formattedDateTime = DateFormat('MMMM d, y').format(dateTime);

  return formattedDateTime;
}

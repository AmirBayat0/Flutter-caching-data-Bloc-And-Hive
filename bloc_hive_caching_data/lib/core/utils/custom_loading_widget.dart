import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Custom App Loading styles
class CustomLoading {
  CustomLoading._();

  static Widget showWithStyle(
    BuildContext context,
  ) =>
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CupertinoActivityIndicator(),
          const SizedBox(
            height: 4,
          ),
          Text(
            'LOADING...',
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: Theme.of(context).brightness == Brightness.light
                      ? Colors.grey[600]
                      : Colors.grey[800],
                ),
          ),
        ],
      );
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';

class CommonErrorPage extends StatefulWidget {
  const CommonErrorPage(
      {super.key,
      required this.isForNetwork,
      required this.description,
      required this.onRetry});

  final bool isForNetwork;
  final String description;
  final VoidCallback onRetry;

  @override
  State<CommonErrorPage> createState() => _CommonErrorPageState();
}

class _CommonErrorPageState extends State<CommonErrorPage> {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            widget.isForNetwork
                ? const Icon(
                    Remix.wifi_off_line,
                    size: 120,
                    color: Colors.grey,
                  )
                : const Icon(
                    Remix.error_warning_line,
                    size: 120,
                    color: Colors.grey,
                  ),
            const SizedBox(
              height: 12,
            ),
            Text(
              'Something went wrong!',
              style: theme.textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                widget.description,
                textAlign: TextAlign.center,
                maxLines: 6,
                style: theme.textTheme.labelLarge,
              ),
            ),
          ],
        ),
        TextButton.icon(
          onPressed: widget.onRetry,
          icon: const Icon(CupertinoIcons.refresh),
          label: const Text('Try Again'),
        )
      ],
    );
  }
}

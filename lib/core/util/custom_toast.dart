import 'package:flutter/material.dart';

class CustomToast {
  static void showToast(
    BuildContext context, {
    required String msg,
    Duration duration = const Duration(seconds: 3),
    Color backgroundColor = Colors.grey,
    Color textColor = Colors.white,
    double fontSize = 16,
  }) {
    WidgetsBinding.instance!.addPostFrameCallback(
      (_) => _pushOverlay(
        context,
        msg,
        duration,
        backgroundColor,
        textColor,
        fontSize,
      ),
    );
  }

  static void _pushOverlay(
    BuildContext context,
    String msg,
    Duration duration,
    Color backgroundColor,
    Color textColor,
    double fontSize,
  ) {
    final overlay = Overlay.of(context)!;
    final entry = OverlayEntry(
      builder: (context) => Positioned(
        bottom: 120,
        width: MediaQuery.of(context).size.width,
        child: Material(
          color: Colors.transparent,
          child: Center(
            child: TotastBadge(
              msg: msg,
              backgroundColor: backgroundColor,
              textColor: textColor,
              fontSize: fontSize,
              duration: duration,
            ),
          ),
        ),
      ),
    );
    overlay.insert(entry);
    Future.delayed(
      Duration(seconds: (duration.inSeconds + 1)),
      entry.remove,
    );
  }
}

class TotastBadge extends StatefulWidget {
  final String msg;
  final Color backgroundColor;
  final Color textColor;
  final double fontSize;
  final Duration duration;

  const TotastBadge({
    Key? key,
    required this.msg,
    required this.backgroundColor,
    required this.textColor,
    required this.fontSize,
    required this.duration,
  }) : super(key: key);

  @override
  State<TotastBadge> createState() => _TotastBadgeState();
}

class _TotastBadgeState extends State<TotastBadge> {
  bool _visible = true;

  @override
  void initState() {
    Future.delayed(widget.duration, () {
      setState(() {
        _visible = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: _visible ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 500),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: widget.backgroundColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          widget.msg,
          style: TextStyle(
            fontSize: widget.fontSize,
            color: widget.textColor,
          ),
        ),
      ),
    );
  }
}

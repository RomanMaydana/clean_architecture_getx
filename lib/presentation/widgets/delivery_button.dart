import 'package:flutter/material.dart';

import '../theme.dart';

class DeliveryButton extends StatelessWidget {
  const DeliveryButton(
      {Key key,
      this.onTap,
      this.text,
      this.padding = const EdgeInsets.all(14.0)})
      : super(key: key);

  final VoidCallback onTap;
  final String text;
  final EdgeInsets padding;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
                begin: Alignment.centerRight,
                end: Alignment.centerLeft,
                colors: deliveryGradients)),
        child: Padding(
          padding: padding,
          child: Text(
            text,
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

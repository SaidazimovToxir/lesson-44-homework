import 'package:flutter/material.dart';

class RatingBar extends StatefulWidget {
  const RatingBar({Key? key}) : super(key: key);

  @override
  State<RatingBar> createState() => _RatingBarState();
}

class _RatingBarState extends State<RatingBar> {
  int _rating = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rating bar"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StarDisplayWidget(
              value: _rating,
              onValueChanged: (value) {
                setState(() {
                  _rating = value;
                });
              },
              filledStar: Icon(Icons.favorite, color: Colors.yellow),
              unfilledStar: Icon(Icons.favorite_border, color: Colors.grey),
            ),
            SizedBox(height: 20),
            Text("Current Rating: $_rating"),
          ],
        ),
      ),
    );
  }
}

class StarDisplayWidget extends StatefulWidget {
  final int value;
  final ValueChanged<int>? onValueChanged;
  final Widget filledStar;
  final Widget unfilledStar;
  final List<Color>? starColors;

  const StarDisplayWidget({
    Key? key,
    required this.value,
    this.onValueChanged,
    required this.filledStar,
    required this.unfilledStar,
    this.starColors,
  }) : super(key: key);

  @override
  _StarDisplayWidgetState createState() => _StarDisplayWidgetState();
}

class _StarDisplayWidgetState extends State<StarDisplayWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        5,
        (index) {
          return GestureDetector(
            onTap: () {
              widget.onValueChanged?.call(index + 1);
            },
            child: widget.starColors != null
                ? Icon(
                    index < widget.value ? Icons.star : Icons.star_border,
                    color: widget.starColors![index],
                  )
                : index < widget.value
                    ? widget.filledStar
                    : widget.unfilledStar,
          );
        },
      ),
    );
  }
}

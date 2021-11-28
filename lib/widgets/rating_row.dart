import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingRow extends StatefulWidget {
  const RatingRow(
      {Key? key, this.size = 30, this.rating = 4, this.color = Colors.amber})
      : _isViewOnly = true,
        onPressed = null,
        super(key: key);
  const RatingRow.interact(
      {required this.onPressed,
      this.size = 30,
      this.rating = 4,
      this.color = Colors.amber})
      : _isViewOnly = false; //For interacting with tap
  final void Function(double)? onPressed;
  final bool _isViewOnly;
  final double size;
  final double rating;
  final Color color;
  @override
  State<RatingRow> createState() => RatingRowState();
}

class RatingRowState extends State<RatingRow> {
  late double _rating;
  @override
  void initState() {
    _rating = widget.rating;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget._isViewOnly)
      return RatingBarIndicator(
          itemCount: 5,
          rating: widget.rating,
          itemSize: widget.size,
          unratedColor: Theme.of(context).primaryColor,
          itemBuilder: _buildStars);
    return RatingBar.builder(
      maxRating: 5,
      minRating: 1,
      initialRating: widget.rating,
      itemSize: widget.size,
      allowHalfRating: true,
      updateOnDrag: true,
      unratedColor: Theme.of(context).primaryColor,
      itemBuilder: _buildStars,
      onRatingUpdate: (x) {
        _rating = x;
        setState(() {});
        widget.onPressed!(x);
      },
    );
  }

  Widget _buildStars(context, index) {
    if (index >= _rating) {
      return Icon(
        Icons.star_border,
      );
    }
    if (_rating.toInt() < _rating && _rating.toInt() == index)
      return Icon(
        Icons.star_half,
        color: widget.color,
      );
    return Icon(
      Icons.star,
      color: widget.color,
    );
  }
}

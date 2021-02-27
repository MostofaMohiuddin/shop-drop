import 'package:flutter/material.dart';

class Category {
  final String title;
  final int id;

  Category({
    this.id,
    this.title,
  });
}

List<Category> categories = [
  Category(
    id: 1,
    title: "Men",
  ),
  Category(
    id: 2,
    title: "Women",
  ),
  Category(
    id: 3,
    title: "Kid",
  ),
  Category(
    id: 4,
    title: "Old",
  ),
];

String dummyText =
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.";

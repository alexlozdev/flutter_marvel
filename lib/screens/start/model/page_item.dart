import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../model/category.dart';

final class PageItem extends Equatable {

  /// pages
  static const pages = [
    PageItem(name: Category.news,),
    PageItem(name: Category.comics, ),
    PageItem(name: Category.characters, ),
    PageItem(name: Category.movies,),
    PageItem(name: Category.lifestyle),
    PageItem(name: Category.rolePlayingGame),
    PageItem(name: Category.books),
    PageItem(name: Category.podcasts),
    PageItem(name: Category.shop),
  ];

  /// page name
  final String name;

  /// icon data
  final IconData? icon;

  const PageItem({
    required this.name,
    this.icon,
  });

  PageItem copyWith({String? name, IconData? icon}) {
    return PageItem(
      name: name ?? this.name,
      icon: icon ?? this.icon,
    );
  }

  @override
  List<Object?> get props => [name, icon];

}
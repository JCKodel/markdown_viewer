import 'package:flutter/material.dart';
import 'package:markdown/markdown.dart' as md;

import '../extensions/extensions.dart';
import 'is_block_element.dart';

class TreeElement {
  TreeElement.root()
      : type = '',
        style = null,
        attributes = const {},
        isBlock = false;

  TreeElement.fromAstElement(md.Element element, {this.style})
      : type = element.type,
        isBlock = isBlockElement(element.type),
        attributes = element.attributes;

  bool get isRoot => type.isEmpty;
  final String type;
  final bool isBlock;
  final TextStyle? style;

  final Map<String, String> attributes;

  final List<Widget> children = <Widget>[];

  Map<String, dynamic> toMap() {
    return {
      'type': type,
      'attributes': attributes,
      'children': children.map((e) => e.toMap()).toList(),
      'style': style,
    };
  }

  @override
  String toString() {
    return toMap().toString();
  }

  String toPrettyString() {
    return toMap().toPrettyString();
  }
}

// ignore_for_file: constant_identifier_names

abstract class Widget {
  const Widget();
}

abstract class StatefulWidget extends Widget {
  const StatefulWidget();
}

abstract class ProxyWidget extends Widget {
  const ProxyWidget({
    required this.child,
  });
  final Widget child;
}

abstract class InheritedWidget extends ProxyWidget {
  const InheritedWidget({
    required Widget child,
  }) : super(child: child);
}

abstract class InheritedTheme extends InheritedWidget {
  const InheritedTheme({
    required Widget child,
  }) : super(child: child);
}

abstract class RenderObjectWidget extends Widget {
  const RenderObjectWidget();
}

abstract class MultiChildRenderObjectWidget extends RenderObjectWidget {
  const MultiChildRenderObjectWidget({
    this.children = const <Widget>[],
  });
  final List<Widget> children;
}

abstract class SingleChildRenderObjectWidget extends Widget {
  const SingleChildRenderObjectWidget({this.child});
  final Widget? child;
}

class Flex extends MultiChildRenderObjectWidget {
  const Flex({
    List<Widget> children = const <Widget>[],
  }) : super(children: children);
}

class Column extends Flex {
  Column({
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.mainAxisSize = MainAxisSize.max,
    List<Widget> children = const <Widget>[],
  }) : super(children: children);

  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisSize mainAxisSize;
}

class Row extends Flex {
  Row({
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    List<Widget> children = const <Widget>[],
  }) : super(children: children);

  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
}

class Wrap extends MultiChildRenderObjectWidget {
  const Wrap({
    List<Widget> children = const <Widget>[],
  }) : super(children: children);
}

class RichText extends MultiChildRenderObjectWidget {
  const RichText({
    required this.text,
    this.textAlign,
  });
  final InlineSpan text;
  final TextAlign? textAlign;
}

class SelectableText extends StatefulWidget {
  const SelectableText.rich(
    this.textSpan, {
    this.textAlign,
    this.onTap,
  });

  final TextSpan? textSpan;
  final TextAlign? textAlign;
  final GestureTapCallback? onTap;
}

class Text extends Widget {
  const Text(
    this.data, {
    this.textAlign,
    this.style,
  });

  final String? data;
  final TextAlign? textAlign;
  final TextStyle? style;
}

class TableRow {
  const TableRow({this.children, this.decoration});

  final Decoration? decoration;
  final List<Widget>? children;
}

class Table extends Widget {
  Table({
    this.border,
    this.children = const <TableRow>[],
    this.defaultColumnWidth = const FlexColumnWidth(),
    this.defaultVerticalAlignment = TableCellVerticalAlignment.top,
  });

  final List<TableRow> children;
  final TableBorder? border;
  final TableColumnWidth defaultColumnWidth;
  final TableCellVerticalAlignment defaultVerticalAlignment;
}

class TableBorder {
  const TableBorder({
    this.top = BorderSide.none,
    this.right = BorderSide.none,
    this.bottom = BorderSide.none,
    this.left = BorderSide.none,
    this.horizontalInside = BorderSide.none,
    this.verticalInside = BorderSide.none,
  });

  final BorderSide top;
  final BorderSide right;
  final BorderSide bottom;
  final BorderSide left;
  final BorderSide horizontalInside;
  final BorderSide verticalInside;
}

abstract class TableColumnWidth {
  const TableColumnWidth();
}

class FlexColumnWidth extends TableColumnWidth {
  const FlexColumnWidth([this.value = 1.0]);
  final double value;
}

class TableCell extends Widget {
  const TableCell({
    required this.child,
  });

  final Widget child;
}

class DefaultTextStyle extends InheritedTheme {
  const DefaultTextStyle({
    required this.style,
    this.textAlign,
    required Widget child,
  }) : super(child: child);

  final TextStyle style;
  final TextAlign? textAlign;
}

class Padding extends SingleChildRenderObjectWidget {
  const Padding({
    required this.padding,
    Widget? child,
  }) : super(child: child);

  final EdgeInsetsGeometry padding;
}

typedef GestureTapCallback = void Function();

class TapGestureRecognizer extends GestureRecognizer {
  TapGestureRecognizer();
  GestureTapCallback? onTap;
}

abstract class EdgeInsetsGeometry {
  const EdgeInsetsGeometry();
}

class EdgeInsets extends EdgeInsetsGeometry {
  const EdgeInsets.all(double value)
      : left = value,
        right = value,
        top = value,
        bottom = value;
  const EdgeInsets.only({
    this.left = 0.0,
    this.top = 0.0,
    this.right = 0.0,
    this.bottom = 0.0,
  });

  const EdgeInsets.fromLTRB(this.left, this.top, this.right, this.bottom);

  final double left;
  final double top;
  final double right;
  final double bottom;
}

abstract class Decoration {
  const Decoration();
}

class Color {
  const Color(this.value);
  final int value;

  @override
  String toString() => 'Color(0x${value.toRadixString(16).padLeft(8, '0')})';
}

class BoxDecoration extends Decoration {
  const BoxDecoration({
    this.color,
    this.border,
  });

  final Color? color;
  final BoxBorder? border;
}

abstract class BoxBorder {
  const BoxBorder();
  BorderSide get top;
  BorderSide get bottom;
}

class Border extends BoxBorder {
  const Border({
    this.top = BorderSide.none,
    this.right = BorderSide.none,
    this.bottom = BorderSide.none,
    this.left = BorderSide.none,
  });

  @override
  final BorderSide top;

  @override
  final BorderSide bottom;

  final BorderSide right;

  final BorderSide left;
}

class BorderSide {
  const BorderSide({
    this.color = const Color(0xFF000000),
    this.width = 1.0,
    this.style = BorderStyle.solid,
  });

  final Color color;
  final double width;
  final BorderStyle style;

  static const BorderSide none = BorderSide(
    width: 0.0,
    style: BorderStyle.none,
  );
}

class SizedBox extends SingleChildRenderObjectWidget {
  const SizedBox({this.width, this.height, Widget? child})
      : super(child: child);
  const SizedBox.shrink()
      : width = 0.0,
        height = 0.0;

  final double? width;

  final double? height;
}

class ConstrainedBox extends SingleChildRenderObjectWidget {
  const ConstrainedBox({
    required this.constraints,
    Widget? child,
  }) : super(child: child);

  final BoxConstraints constraints;
}

abstract class Constraints {
  const Constraints();
}

class BoxConstraints extends Constraints {
  const BoxConstraints({
    this.minWidth = 0.0,
    this.maxWidth = double.infinity,
    this.minHeight = 0.0,
    this.maxHeight = double.infinity,
  });
  final double minWidth;
  final double maxWidth;
  final double minHeight;
  final double maxHeight;
}

class Expanded extends Widget {
  const Expanded({
    required this.child,
  });

  final Widget child;
}

class Scrollbar extends Widget {
  const Scrollbar({
    required this.child,
  });

  final Widget child;
}

class SingleChildScrollView extends Widget {
  const SingleChildScrollView({
    this.scrollDirection = Axis.vertical,
    this.padding,
    this.child,
  });

  final Widget? child;
  final Axis scrollDirection;
  final EdgeInsetsGeometry? padding;
}

class BorderRadiusGeometry {
  const BorderRadiusGeometry();
}

class Icon extends Widget {
  const Icon(
    this.icon, {
    this.size,
    this.color,
  });

  // NOTE: The right type of icon should be IconData.
  final String? icon;

  final Color? color;
  final double? size;
}

class Icons {
  static const check_box = 'check_box';
  static const check_box_outline_blank = 'check_box_outline_blank';
}

class Container extends Widget {
  const Container({
    this.child,
    this.decoration,
    this.border,
  });

  final BoxDecoration? decoration;
  final Widget? child;
  final BoxBorder? border;
}

class DecoratedBox extends SingleChildRenderObjectWidget {
  DecoratedBox({
    required this.decoration,
    Widget? child,
  }) : super(child: child);
  final Decoration decoration;
}

class InlineSpan {
  InlineSpan({
    this.style,
  });

  final TextStyle? style;
}

class TextSpan extends InlineSpan {
  TextSpan({
    this.text,
    this.semanticsLabel,
    TextStyle? style,
    this.recognizer,
    this.children,
  }) : super(style: style);

  String toPlainText() {
    if (children != null) {
      return children!.map((e) => (e as TextSpan).toPlainText()).join();
    } else {
      return text!;
    }
  }

  final String? text;
  final String? semanticsLabel;
  final GestureRecognizer? recognizer;
  final List<InlineSpan>? children;
}

class GestureRecognizer {}

class TextStyle {
  const TextStyle({
    this.fontFamily,
    this.fontStyle,
    this.fontSize,
    this.fontWeight,
    this.color,
    this.backgroundColor,
  });
  TextStyle copyWith({
    String? fontFamily,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    double? fontSize,
    Color? color,
    Color? backgroundColor,
  }) {
    return TextStyle(
      fontFamily: fontFamily ?? this.fontFamily,
      fontWeight: fontWeight ?? this.fontWeight,
      fontSize: fontSize ?? this.fontSize,
      fontStyle: fontStyle ?? this.fontStyle,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      color: color ?? this.color,
    );
  }

  TextStyle merge(TextStyle? other) => copyWith(
        fontFamily: other?.fontFamily,
        fontSize: other?.fontSize,
        fontStyle: other?.fontStyle,
        fontWeight: other?.fontWeight,
        color: other?.color,
        backgroundColor: other?.backgroundColor,
      );

  final String? fontFamily;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final double? fontSize;
  final Color? color;
  final Color? backgroundColor;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    return other is TextStyle &&
        other.color == color &&
        other.backgroundColor == backgroundColor &&
        other.fontSize == fontSize &&
        other.fontWeight == fontWeight &&
        other.fontStyle == fontStyle &&
        other.fontFamily == fontFamily;
  }

  @override
  int get hashCode => Object.hash(
        color,
        backgroundColor,
        fontSize,
        fontWeight,
        fontStyle,
        fontFamily,
      );
}

class BlockWidget implements Widget {}

class TextWidget implements Widget {}

class TextTheme {
  const TextTheme({
    this.bodyText2,
    this.headline5,
    this.headline6,
    this.subtitle1,
    this.bodyText1,
  });
  final TextStyle? bodyText2;
  final TextStyle? headline5;
  final TextStyle? headline6;
  final TextStyle? subtitle1;
  final TextStyle? bodyText1;
}

class CardTheme {
  const CardTheme({
    this.color,
  });
  final Color? color;
}

class ThemeData {
  ThemeData({
    this.textTheme = const TextTheme(),
  });

  final TextTheme textTheme;
}

enum MainAxisAlignment {
  start,
  end,
  center,
  spaceBetween,
  spaceAround,
  spaceEvenly
}

enum CrossAxisAlignment { start, end, center, stretch, baseline }

enum TextAlign { left, right, center, justify, start, end }

enum FontStyle { normal, italic }

enum FontWeight { w400, w500, w600, w700 }

enum BorderStyle { none, solid }

enum MainAxisSize { min, max }

enum Axis { horizontal, vertical }

enum TableCellVerticalAlignment { top, middle, bottom, baseline, fill }

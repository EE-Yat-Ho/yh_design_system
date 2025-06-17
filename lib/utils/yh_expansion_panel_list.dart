import 'package:flutter/material.dart';

const double _kPanelHeaderCollapsedHeight = kMinInteractiveDimension;

class _SaltedKey<S, V> extends LocalKey {
  const _SaltedKey(this.salt, this.value);

  final S salt;
  final V value;

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) return false;
    return other is _SaltedKey<S, V> &&
        other.salt == salt &&
        other.value == value;
  }

  @override
  int get hashCode => Object.hash(runtimeType, salt, value);

  @override
  String toString() {
    final String saltString = S == String ? "<'$salt'>" : '<$salt>';
    final String valueString = V == String ? "<'$value'>" : '<$value>';
    return '[$saltString $valueString]';
  }
}

final class YHExpansionPanelList extends StatefulWidget {
  /// 확장 패널 리스트 위젯을 생성합니다. [onChangeExpand]은
  /// 확장 패널의 확장/축소 버튼이 눌렸을 때 호출됩니다.
  ///
  /// [children]과 [animationDuration] 인수는 null이 아니어야 합니다.
  const YHExpansionPanelList({
    super.key,
    required this.children,
    this.onChangeExpand,
    this.onHeaderLongPress,
    this.animationDuration = kThemeAnimationDuration,
    this.expandedHeaderPadding = EdgeInsets.zero,
    this.elevation = 2,
  });

  /// 확장 패널 리스트의 자식들입니다. [ListBody]와 유사한 방식으로 배치됩니다.
  final List<AppExpansionPanel> children;

  /// 확장/축소 버튼이 눌릴 때마다 호출되는 콜백입니다. 콜백에 전달되는 인자는
  /// 눌린 패널의 인덱스와 패널이 현재 확장되어 있는지 여부입니다.
  ///
  /// YHExpansionPanelList.radio가 사용되는 경우, 이전에 다른 패널이 열려있었다면
  /// 콜백이 두 번째로 호출될 수 있습니다. 두 번째 콜백에 전달되는 인자는
  /// 닫힐 패널의 인덱스와 false이며, 이는 해당 패널이 닫힐 것임을 나타냅니다.
  ///
  /// YHExpansionPanelList의 경우, 패널이 열리거나 닫힐 때 알림을 받으면
  /// 콜백에서 setState를 호출해야 합니다. 반면에 YHExpansionPanelList.radio의
  /// 콜백은 단순히 부모 위젯에 변경 사항을 알리기 위한 것입니다. 라디오 패널의
  /// 열림/닫힘 상태는 내부적으로 관리되기 때문입니다.
  ///
  /// 이 콜백은 부모 위젯에서 확장/축소된 패널을 추적하고 이러한 변경에
  /// 반응해야 할 필요가 있을 때 유용합니다.
  final void Function(int panelIndex, bool isExpanded)? onChangeExpand;

  final void Function(int index)? onHeaderLongPress;

  /// 확장 애니메이션의 지속 시간입니다.
  final Duration animationDuration;

  /// 확장되었을 때 패널 헤더를 둘러싸는 패딩입니다.
  /// 기본값으로, 확장 시 헤더에 세로로 16px의 공간이 추가됩니다 (위아래).
  final EdgeInsets expandedHeaderPadding;

  /// [AppExpansionPanel]이 확장되었을 때의 elevation을 정의합니다.
  /// 기본값으로, elevation 값은 2입니다.
  final double elevation;

  @override
  State<YHExpansionPanelList> createState() => _YHExpansionPanelListState();
}

class _YHExpansionPanelListState extends State<YHExpansionPanelList> {
  void _handlePressed(bool isExpanded, int index) {
    widget.onChangeExpand?.call(index, isExpanded);
  }

  void _handleLongPressed(int index) {
    widget.onHeaderLongPress?.call(index);
  }

  @override
  Widget build(BuildContext context) {
    final List<MergeableMaterialItem> items = <MergeableMaterialItem>[];

    for (int index = 0; index < widget.children.length; index += 1) {
      final AppExpansionPanel child = widget.children[index];
      final isExpanded = widget.children[index].isExpanded;

      // 헤더
      Widget header = AnimatedContainer(
        duration: widget.animationDuration,
        curve: Curves.fastOutSlowIn,
        margin: isExpanded ? widget.expandedHeaderPadding : EdgeInsets.zero,
        child: ConstrainedBox(
          constraints:
              const BoxConstraints(minHeight: _kPanelHeaderCollapsedHeight),
          child: child.headerBuilder(
            context,
            isExpanded,
          ),
        ),
      );

      if (child.canTapOnHeader) {
        header = MergeSemantics(
          child: InkWell(
            onTap: () => _handlePressed(isExpanded, index),
            onLongPress: () => _handleLongPressed(index),
            child: header,
          ),
        );
      }
      items.add(
        MaterialSlice(
          key: _SaltedKey<BuildContext, int>(context, index * 2),
          color: child.backgroundColor,
          child: Column(
            children: <Widget>[
              header,
              AnimatedCrossFade(
                firstChild: Container(height: 0.0),
                secondChild: child.body,
                firstCurve:
                    const Interval(0.0, 0.6, curve: Curves.fastOutSlowIn),
                secondCurve:
                    const Interval(0.4, 1.0, curve: Curves.fastOutSlowIn),
                sizeCurve: Curves.fastOutSlowIn,
                crossFadeState: isExpanded
                    ? CrossFadeState.showSecond
                    : CrossFadeState.showFirst,
                duration: widget.animationDuration,
              ),
            ],
          ),
        ),
      );

      if (isExpanded && index != widget.children.length - 1) {
        items.add(MaterialGap(
            key: _SaltedKey<BuildContext, int>(context, index * 2 + 1)));
      }
    }

    return MergeableMaterial(
      hasDividers: true,
      elevation: widget.elevation,
      children: items,
    );
  }
}

final class AppExpansionPanel {
  /// [ExpansionPanelList]의 자식으로 사용할 확장 패널을 생성합니다.
  /// 이 위젯을 사용하는 방법에 대한 예제는 [ExpansionPanelList]를 참조하세요.
  ///
  /// [headerBuilder], [body], [isExpanded] 인수는 null이 아니어야 합니다.
  AppExpansionPanel({
    required this.headerBuilder,
    required this.body,
    this.isExpanded = false,
    this.canTapOnHeader = true,
    this.backgroundColor,
  });

  /// 확장 패널의 헤더를 빌드하는 위젯 빌더입니다.
  final ExpansionPanelHeaderBuilder headerBuilder;

  /// 헤더 아래에 표시되는 확장 패널의 본문입니다.
  ///
  /// 이 위젯은 패널이 확장되었을 때만 표시됩니다.
  final Widget body;

  /// 패널이 확장되어 있는지 여부입니다.
  ///
  /// 기본값은 false입니다.
  final bool isExpanded;

  /// 패널의 헤더를 탭했을 때 확장/축소할지 여부입니다.
  ///
  /// 기본값은 false입니다.
  final bool canTapOnHeader;

  /// 패널의 배경색을 정의합니다.
  ///
  /// 기본값은 [ThemeData.cardColor]입니다.
  final Color? backgroundColor;
}

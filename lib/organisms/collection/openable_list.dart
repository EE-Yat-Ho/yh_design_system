import 'package:flutter/material.dart';
import 'package:yh_design_system/atoms/color/colors.dart';
import 'package:yh_design_system/organisms/card/openable_child_card.dart';
import 'package:yh_design_system/organisms/card/openable_card.dart';
import 'package:yh_design_system/atoms/text/text.dart';
import 'package:yh_design_system/atoms/font/fonts.dart';
import 'package:yh_design_system/utils/yh_expansion_panel_list.dart';

final class OpenableList extends StatelessWidget {
  const OpenableList({
    super.key,
    required this.objects,
    required this.emptyText,
    required this.onTapOpenable,
    required this.onTapChild,
    this.onLongPressOpenable,
    this.onLongPressChild,
    this.onTapAddButton,
    this.showSelected = true,
    this.showBookmark = true,
    this.showAddButton = true,
    this.showChild = true,
    this.showOpenableArrow = true,
    this.showChildArrow = true,
    this.openableCardCornerRadius = 20,
    this.childCardCornerRadius = 20,
  });

  final List<OpenableObject> objects;
  final String emptyText;
  // 열 수 있는 셀 클릭
  final void Function(String openableId, bool isExpand) onTapOpenable;
  final void Function(String openableId)? onLongPressOpenable;
  final void Function(String openableId)? onTapAddButton;
  // 열 수 없는 셀 클릭
  final void Function(String openableId, String childId) onTapChild;
  final void Function(String openableId, String childId)? onLongPressChild;

  final bool showSelected;
  final bool showBookmark;
  final bool showAddButton;
  final bool showChild;
  final bool showOpenableArrow;
  final bool showChildArrow;
  final double openableCardCornerRadius;
  final double childCardCornerRadius;

  @override
  Widget build(BuildContext context) {
    if (objects.isEmpty) {
      return Expanded(
          child: Center(
        child:
            YHText(text: emptyText, font: YHFont.bold18, color: YHColor.black),
      ));
    }

    return Flexible(
        child: SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(0, 8, 0, 100), // contentInset
      child: YHExpansionPanelList(
        onChangeExpand: (index, isExpanded) {
          onTapOpenable(objects[index].id, isExpanded);
        },
        onHeaderLongPress: (index) {
          onLongPressOpenable?.call(objects[index].id);
        },
        elevation: 0,
        children: objects.map<AppExpansionPanel>((OpenableObject openable) {
          return AppExpansionPanel(
            canTapOnHeader: true,
            backgroundColor: Colors.transparent,
            headerBuilder: (BuildContext context, bool isExpanded) {
              return YHOpenableCard(
                object: openable,
                onTap: (id) {},
                onTapAddButton: (id) {
                  onTapAddButton?.call(id);
                },
                isSelected: showSelected &&
                    openable.children.every((o) => o.isSelect) &&
                    openable.children.isNotEmpty,
                showAddButton: showAddButton,
                showArrow: showOpenableArrow,
                cornerRadius: openableCardCornerRadius,
              );
            },
            body: Column(
              children: openable.children
                  .map((child) => YHOpenableChildCard(
                        object: child,
                        onTap: (childId) => onTapChild(openable.id, childId),
                        onLongPress: (childId) =>
                            onLongPressChild?.call(openable.id, childId),
                        margin: const EdgeInsets.fromLTRB(12, 4, 12, 4),
                        showSelectCheck: showSelected,
                        showBookmark: showBookmark,
                        showRightArrow: showChildArrow,
                        cornerRadius: childCardCornerRadius,
                      ))
                  .toList(),
            ),
            isExpanded: showChild ? openable.isOpened : false,
          );
        }).toList(),
      ),
    ));
  }
}

import 'package:flutter/material.dart';
import 'package:yh_design_system/atoms/color/colors.dart';
import 'package:yh_design_system/components/card/openable_child_card.dart';
import 'package:yh_design_system/components/card/openable_card.dart';
import 'package:yh_design_system/atoms/text/text.dart';
import 'package:yh_design_system/atoms/font/fonts.dart';
import 'package:yh_design_system/utils/app_expansion_panel_list.dart';
import 'package:yh_design_system/atoms/image/images.dart';

abstract class OpenableObject {
  final Object object;
  final List<ChildObject> children;
  final int id;
  final YHImage leadingImage;
  final String text;
  final String? rightText;
  final bool isExpand;

  OpenableObject(
    this.object,
    this.children,
    this.id,
    this.leadingImage,
    this.text,
    this.rightText,
    this.isExpand,
  );
}

abstract class ChildObject {
  final Object object;
  final int id;
  final YHImage leadingImage;
  final String text;
  final String? rightText;
  final bool isSelect;

  ChildObject(this.object, this.id, this.leadingImage, this.text,
      this.rightText, this.isSelect);
}

class OpenableList extends StatelessWidget {
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
    this.showAddButton = true,
    this.showChild = true,
    this.showOpenableArrow = true,
    this.showChildArrow = true,
  });

  final List<OpenableObject> objects;
  final String emptyText;
  final void Function(int id, bool isExpand) onTapOpenable;
  final void Function(int id) onTapChild;

  final void Function(int id)? onLongPressOpenable;
  final void Function(int id)? onLongPressChild;
  final void Function(int id)? onTapAddButton;

  final bool showSelected;
  final bool showAddButton;
  final bool showChild;
  final bool showOpenableArrow;
  final bool showChildArrow;

  @override
  Widget build(BuildContext context) {
    if (objects.isEmpty) {
      return Expanded(
          child: Center(
        child: YHText(text: emptyText, font: YHFont.h4, color: YHColor.black),
      ));
    }

    return Flexible(
        child: SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(0, 8, 0, 100), // contentInset
      child: AppExpansionPanelList(
        expansionCallback: onTapOpenable,
        onHeaderLongPress: onLongPressOpenable,
        elevation: 0,
        dividerColor: Colors.transparent,
        children: objects.map<AppExpansionPanel>((OpenableObject object) {
          return AppExpansionPanel(
            canTapOnHeader: true,
            backgroundColor: Colors.transparent,
            headerBuilder: (BuildContext context, bool isExpanded) {
              return YHOpenableCard(
                object: object,
                onTapAddButton: onTapAddButton,
                isSelected: showSelected &&
                    object.children.every((o) => o.isSelect) &&
                    object.children.isNotEmpty,
                showAddButton: showAddButton,
                showArrow: showOpenableArrow,
              );
            },
            keyId: object.id,
            body: Column(
              children: object.children
                  .map((childObject) => YHOpenableChildCard(
                        object: childObject,
                        onTap: onTapChild,
                        onLongPress: onLongPressChild,
                        isSelected: showSelected && childObject.isSelect,
                        margin: const EdgeInsets.fromLTRB(12, 4, 12, 4),
                        showRightArrow: showChildArrow,
                      ))
                  .toList(),
            ),
            isExpanded: showChild ? object.isExpand : false,
            iconBuilder: (child, isExpanded) {
              return null;
            },
          );
        }).toList(),
      ),
    ));
  }
}

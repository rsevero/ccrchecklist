// CCR Checklist - a checklist app for rebreather users
// Copyright (C) 2024  Rodrigo Severo
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <https://www.gnu.org/licenses/>.

import 'package:ccrchecklist/data/checklist_check.dart';
import 'package:ccrchecklist/data/checklist_section.dart';
import 'package:ccrchecklist/data/template_check.dart';
import 'package:ccrchecklist/data/template_section.dart';
import 'package:mobx/mobx.dart';

class ObservableListJsonConverter {
  const ObservableListJsonConverter();

  static ObservableList<TemplateSection> obsvbLstOfTemplateSectionFromJson(
      List<TemplateSection> json) {
    return ObservableList<TemplateSection>.of(json);
  }

  static List<TemplateSection> obsvbLstOfTemplateSectionToJson(
      ObservableList<TemplateSection> object) {
    return object.toList();
  }

  static ObservableList<ObservableList<TemplateCheck>>
      obsvbLstOfObsvbLstOfTemplateCheckFromJson(
          List<List<TemplateCheck>> json) {
    final oblst = ObservableList<ObservableList<TemplateCheck>>();
    for (final lst in json) {
      oblst.add(ObservableList<TemplateCheck>.of(lst));
    }
    return oblst;
  }

  static List<List<TemplateCheck>> obsvbLstOfObsvbLstOfTemplateCheckToJson(
      ObservableList<ObservableList<TemplateCheck>> object) {
    final List<List<TemplateCheck>> lst = [];
    for (final oblst in object) {
      lst.add(oblst.toList());
    }
    return lst;
  }

  static ObservableList<ChecklistSection> obsvbLstOfChecklistSectionFromJson(
      List<ChecklistSection> json) {
    return ObservableList<ChecklistSection>.of(json);
  }

  static List<ChecklistSection> obsvbLstOfChecklistSectionToJson(
      ObservableList<ChecklistSection> object) {
    return object.toList();
  }

  static ObservableList<ObservableList<ChecklistCheck>>
      obsvbLstOfObsvbLstOfChecklistCheckFromJson(
          List<List<ChecklistCheck>> json) {
    final oblst = ObservableList<ObservableList<ChecklistCheck>>();
    for (final lst in json) {
      oblst.add(ObservableList<ChecklistCheck>.of(lst));
    }
    return oblst;
  }

  static List<List<ChecklistCheck>> obsvbLstOfObsvbLstOfChecklistCheckToJson(
      ObservableList<ObservableList<ChecklistCheck>> object) {
    final List<List<ChecklistCheck>> lst = [];
    for (final oblst in object) {
      lst.add(oblst.toList());
    }
    return lst;
  }
}

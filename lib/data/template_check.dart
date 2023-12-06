import 'package:morphy_annotation/morphy_annotation.dart';

part 'template_check.morphy.dart';
part 'template_check.g.dart';

@Morphy(generateJson: true)
abstract class $TemplateCheck {
  String get type;
}

@Morphy(generateJson: true)
abstract class $TemplateRegularCheck implements $TemplateCheck {
  String get description;

  @override
  String get type => 'regular';
}

@Morphy(generateJson: true)
abstract class $TemplateWithReferenceCheck implements $TemplateCheck {
  String get description;
  String get referenceDescription;

  @override
  String get type => 'withReference';
}

@Morphy(generateJson: true)
abstract class $TemplateLinearityCheckStep1Check implements $TemplateCheck {
  @override
  String get type => 'linearityStep1';
}

@Morphy(generateJson: true)
abstract class $TemplateLinearityCheckStep2Check implements $TemplateCheck {
  @override
  String get type => 'linearityStep2';
}

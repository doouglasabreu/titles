import 'package:lucid_validation/lucid_validation.dart';
import 'package:titles/src/domain/dtos/title_dto.dart';

class TitleValidator extends LucidValidator<TitleDTO> {
  TitleValidator() {
    ruleFor((t) => t.title, key: 'title') //
        .notEmpty()
        .maxLength(20)
        .minLength(5);
    ruleFor((t) => t.description, key: 'description') //
        .notEmpty()
        .minLength(20)
        .maxLength(200);
  }
}

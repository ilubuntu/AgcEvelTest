import {
  COLOR_FONT_PRIMARY,
  COLOR_FONT_SECONDARY,
  FONT_SIZE_BODY,
  FONT_SIZE_DISPLAY,
  FULL_SIZE,
  SPACE_SM
} from '../common/StyleConstants';

@ComponentV2
export struct ScenarioHeader {
  @Require @Param title: string;
  @Require @Param subtitle: string;

  build() {
    Column() {
      Text(this.title)
        .fontSize(FONT_SIZE_DISPLAY)
        .fontWeight(FontWeight.Bold)
        .fontColor(COLOR_FONT_PRIMARY)
        .maxLines(2)
        .textOverflow({ overflow: TextOverflow.Ellipsis })
      Text(this.subtitle)
        .fontSize(FONT_SIZE_BODY)
        .fontColor(COLOR_FONT_SECONDARY)
        .margin({ top: SPACE_SM })
        .maxLines(2)
        .textOverflow({ overflow: TextOverflow.Ellipsis })
    }
    .width(FULL_SIZE)
    .alignItems(HorizontalAlign.Start)
  }
}

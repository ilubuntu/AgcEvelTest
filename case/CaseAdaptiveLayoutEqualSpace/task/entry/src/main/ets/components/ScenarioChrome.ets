import {
  COLOR_FONT_PRIMARY,
  COLOR_FONT_SECONDARY,
  FONT_SIZE_CAPTION,
  FONT_SIZE_DISPLAY,
  FULL_SIZE,
  SPACE_MD
} from '../common/StyleConstants';

@ComponentV2
export struct ScenarioHeader {
  @Param title: string = '';
  @Param subtitle: string = '';

  build() {
    Column({ space: SPACE_MD }) {
      Text(this.title)
        .fontSize(FONT_SIZE_DISPLAY)
        .fontWeight(FontWeight.Bold)
        .fontColor(COLOR_FONT_PRIMARY)
      Text(this.subtitle)
        .fontSize(FONT_SIZE_CAPTION)
        .fontColor(COLOR_FONT_SECONDARY)
    }
    .alignItems(HorizontalAlign.Start)
    .width(FULL_SIZE)
  }
}

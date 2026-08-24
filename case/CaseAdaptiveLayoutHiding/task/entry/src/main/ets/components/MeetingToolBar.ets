import {
  CHIP_HEIGHT,
  COLOR_BRAND,
  COLOR_COMPONENT_BACKGROUND_SECONDARY,
  COLOR_COMPONENT_BACKGROUND_TERTIARY,
  COLOR_FONT_ON_PRIMARY,
  COLOR_FONT_PRIMARY,
  FONT_SIZE_CAPTION,
  FULL_SIZE,
  RADIUS_CHIP,
  SPACE_LG
} from '../common/StyleConstants';
import { MeetingControl, MeetingControlTone } from '../model/MeetingData';

function backgroundForTone(tone: MeetingControlTone): ResourceColor {
  if (tone === 'primary') {
    return COLOR_BRAND;
  }
  if (tone === 'strong') {
    return COLOR_COMPONENT_BACKGROUND_SECONDARY;
  }
  if (tone === 'muted') {
    return COLOR_COMPONENT_BACKGROUND_TERTIARY;
  }
  return COLOR_COMPONENT_BACKGROUND_SECONDARY;
}

function foregroundForTone(tone: MeetingControlTone): ResourceColor {
  if (tone === 'primary') {
    return COLOR_FONT_ON_PRIMARY;
  }
  return COLOR_FONT_PRIMARY;
}

@ComponentV2
export struct MeetingToolBar {
  @Require @Param controls: MeetingControl[];
  @Require @Param toolbarId: string;

  private controlId(item: MeetingControl): string {
    return `meeting-${item.id}`;
  }

  @Builder
  controlChip(item: MeetingControl) {
    Text(item.label)
      .id(this.controlId(item))
      .accessibilityDescription(item.description)
      .fontSize(FONT_SIZE_CAPTION)
      .fontWeight(item.tone === 'primary' ? FontWeight.Bold : FontWeight.Medium)
      .fontColor(foregroundForTone(item.tone))
      .maxLines(1)
      .textAlign(TextAlign.Center)
      .height(CHIP_HEIGHT)
      .padding({ left: SPACE_LG, right: SPACE_LG })
      .borderRadius(RADIUS_CHIP)
      .backgroundColor(backgroundForTone(item.tone))
      .flexShrink(0)
  }

  build() {
    Row({ space: SPACE_LG }) {
      ForEach(this.controls, (item: MeetingControl) => {
        this.controlChip(item)
      }, (item: MeetingControl) => item.id)
    }
    .id(this.toolbarId)
    .width(FULL_SIZE)
    .height(CHIP_HEIGHT)
    .alignItems(VerticalAlign.Center)
    .justifyContent(FlexAlign.Start)
    .clip(true)
  }
}

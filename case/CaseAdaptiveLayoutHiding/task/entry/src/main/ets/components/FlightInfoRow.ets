import {
  CHIP_HEIGHT,
  COLOR_COMPONENT_BACKGROUND_PRIMARY,
  COLOR_COMPONENT_BACKGROUND_SECONDARY,
  COLOR_COMPONENT_BACKGROUND_TERTIARY,
  COLOR_FONT_PRIMARY,
  COLOR_FONT_SECONDARY,
  FONT_SIZE_CAPTION,
  FONT_SIZE_LABEL,
  FONT_SIZE_TINY,
  FULL_SIZE,
  MINI_CHIP_HEIGHT,
  RADIUS_CARD,
  RADIUS_CHIP,
  RADIUS_GROUP,
  SPACE_LG,
  SPACE_MD,
  SPACE_SM,
  SPACE_XL
} from '../common/StyleConstants';
import { FLIGHT_SCENE, FlightExtra } from '../model/FlightData';

@ComponentV2
export struct FlightInfoRow {
  build() {
    Row({ space: SPACE_LG }) {
      Row({ space: SPACE_SM }) {
        Text(FLIGHT_SCENE.gateLabel)
          .fontSize(FONT_SIZE_TINY)
          .fontColor(COLOR_FONT_SECONDARY)
        Text(FLIGHT_SCENE.gateValue)
          .fontSize(FONT_SIZE_LABEL)
          .fontColor(COLOR_FONT_PRIMARY)
          .fontWeight(FontWeight.Bold)
      }
      .id('flight-gate-info')
      .height(CHIP_HEIGHT)
      .padding({ left: SPACE_XL, right: SPACE_XL })
      .borderRadius(RADIUS_CHIP)
      .backgroundColor(COLOR_COMPONENT_BACKGROUND_SECONDARY)
      .alignItems(VerticalAlign.Center)
      .flexShrink(0)

      Text(FLIGHT_SCENE.onTimeLabel)
        .id('flight-ontime')
        .fontSize(FONT_SIZE_CAPTION)
        .fontColor(COLOR_FONT_PRIMARY)
        .maxLines(1)
        .textAlign(TextAlign.Center)
        .height(CHIP_HEIGHT)
        .padding({ left: SPACE_LG, right: SPACE_LG })
        .borderRadius(RADIUS_CHIP)
        .backgroundColor(COLOR_COMPONENT_BACKGROUND_SECONDARY)
        .flexShrink(0)

      Text(FLIGHT_SCENE.seatLabel)
        .id('flight-seat')
        .fontSize(FONT_SIZE_CAPTION)
        .fontColor(COLOR_FONT_PRIMARY)
        .maxLines(1)
        .textAlign(TextAlign.Center)
        .height(CHIP_HEIGHT)
        .padding({ left: SPACE_LG, right: SPACE_LG })
        .borderRadius(RADIUS_CHIP)
        .backgroundColor(COLOR_COMPONENT_BACKGROUND_SECONDARY)
        .flexShrink(0)

      Row({ space: SPACE_SM }) {
        ForEach(FLIGHT_SCENE.extras, (extra: FlightExtra) => {
          Text(extra.label)
            .id(`flight-${extra.id}`)
            .fontSize(FONT_SIZE_CAPTION)
            .fontColor(COLOR_FONT_PRIMARY)
            .maxLines(1)
            .textAlign(TextAlign.Center)
            .height(MINI_CHIP_HEIGHT)
            .padding({ left: SPACE_LG, right: SPACE_LG })
            .borderRadius(RADIUS_CARD)
            .backgroundColor(COLOR_COMPONENT_BACKGROUND_PRIMARY)
            .flexShrink(0)
        }, (extra: FlightExtra) => extra.id)
      }
      .id('flight-extras')
      .height(CHIP_HEIGHT)
      .alignItems(VerticalAlign.Center)
      .padding({ left: SPACE_MD, right: SPACE_MD, top: SPACE_SM, bottom: SPACE_SM })
      .borderRadius(RADIUS_GROUP)
      .backgroundColor(COLOR_COMPONENT_BACKGROUND_TERTIARY)
      .flexShrink(0)

      Text(FLIGHT_SCENE.shareLabel)
        .id('flight-share')
        .fontSize(FONT_SIZE_CAPTION)
        .fontColor(COLOR_FONT_PRIMARY)
        .maxLines(1)
        .textAlign(TextAlign.Center)
        .height(CHIP_HEIGHT)
        .padding({ left: SPACE_LG, right: SPACE_LG })
        .borderRadius(RADIUS_CHIP)
        .backgroundColor(COLOR_COMPONENT_BACKGROUND_SECONDARY)
        .flexShrink(0)
    }
    .id(FLIGHT_SCENE.infoRowId)
    .width(FULL_SIZE)
    .height(CHIP_HEIGHT)
    .alignItems(VerticalAlign.Center)
    .justifyContent(FlexAlign.Start)
    .clip(true)
  }
}

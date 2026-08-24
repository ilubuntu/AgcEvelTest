import {
  CHIP_HEIGHT,
  COLOR_BACKGROUND_SECONDARY,
  COLOR_COMPONENT_BACKGROUND_PRIMARY,
  COLOR_COMPONENT_BACKGROUND_SECONDARY,
  COLOR_COMPONENT_BACKGROUND_TERTIARY,
  COLOR_CONFIRM,
  COLOR_FONT_ON_PRIMARY,
  COLOR_FONT_PRIMARY,
  COLOR_FONT_SECONDARY,
  COLOR_LINE_DIVIDER,
  DIVIDER_STROKE_WIDTH,
  DIVIDER_WIDTH,
  FONT_SIZE_BODY,
  FONT_SIZE_CAPTION,
  FONT_SIZE_DISPLAY,
  FONT_SIZE_LABEL,
  FONT_SIZE_TINY,
  FULL_SIZE,
  LAYOUT_WEIGHT_FILL,
  MINI_CHIP_HEIGHT,
  RADIUS_BADGE,
  RADIUS_CARD,
  RADIUS_CHIP,
  RADIUS_GROUP,
  RADIUS_MD,
  SPACE_LG,
  SPACE_MD,
  SPACE_PAGE,
  SPACE_SM,
  SPACE_XL,
  SPACE_XS,
  SPACE_XXL
} from '../common/StyleConstants';
import { ScenarioHeader } from '../components/ScenarioChrome';
import { FLIGHT_SCENE } from '../model/FlightData';
import { FlightInfoRow } from '../components/FlightInfoRow';
import { ScenarioRouter } from '../routes/ScenarioRoutes';

@Builder
export function flightScenarioPageBuilder() {
  FlightScenarioPage()
}

@ComponentV2
struct FlightScenarioPage {
  @Builder
  flightBusinessBody() {
    Column({ space: SPACE_XXL }) {
      Row() {
        Column({ space: SPACE_XS }) {
          Text('中国国际航空')
            .fontSize(FONT_SIZE_CAPTION)
            .fontColor(COLOR_FONT_SECONDARY)
          Text('CA1831 · 波音 738')
            .id('flight-flight-number')
            .fontSize(FONT_SIZE_BODY)
            .fontColor(COLOR_FONT_PRIMARY)
            .fontWeight(FontWeight.Medium)
        }
        .alignItems(HorizontalAlign.Start)
        .layoutWeight(LAYOUT_WEIGHT_FILL)

        Text('登机中')
          .id('flight-status')
          .fontSize(FONT_SIZE_CAPTION)
          .fontColor(COLOR_FONT_ON_PRIMARY)
          .fontWeight(FontWeight.Medium)
          .padding({ left: SPACE_LG, right: SPACE_LG, top: SPACE_SM, bottom: SPACE_SM })
          .borderRadius(RADIUS_BADGE)
          .backgroundColor(COLOR_CONFIRM)
      }
      .width(FULL_SIZE)

      Row() {
        Column({ space: SPACE_XS }) {
          Text('SHA')
            .fontSize(FONT_SIZE_DISPLAY)
            .fontColor(COLOR_FONT_PRIMARY)
            .fontWeight(FontWeight.Bold)
          Text('虹桥 T2')
            .fontSize(FONT_SIZE_TINY)
            .fontColor(COLOR_FONT_SECONDARY)
          Text('14:20')
            .id('flight-departure-time')
            .fontSize(FONT_SIZE_CAPTION)
            .fontColor(COLOR_FONT_PRIMARY)
        }
        .alignItems(HorizontalAlign.Center)

        Column({ space: SPACE_XS }) {
          Text('2h 25m')
            .fontSize(FONT_SIZE_TINY)
            .fontColor(COLOR_FONT_SECONDARY)
          Divider()
            .strokeWidth(DIVIDER_STROKE_WIDTH)
            .color(COLOR_LINE_DIVIDER)
            .width(DIVIDER_WIDTH)
        }
        .alignItems(HorizontalAlign.Center)
        .layoutWeight(LAYOUT_WEIGHT_FILL)

        Column({ space: SPACE_XS }) {
          Text('PEK')
            .fontSize(FONT_SIZE_DISPLAY)
            .fontColor(COLOR_FONT_PRIMARY)
            .fontWeight(FontWeight.Bold)
          Text('首都 T3')
            .fontSize(FONT_SIZE_TINY)
            .fontColor(COLOR_FONT_SECONDARY)
          Text('16:45')
            .fontSize(FONT_SIZE_CAPTION)
            .fontColor(COLOR_FONT_PRIMARY)
        }
        .alignItems(HorizontalAlign.Center)
      }
      .width(FULL_SIZE)
      .justifyContent(FlexAlign.SpaceBetween)
      .id('flight-route')
    }
    .width(FULL_SIZE)
    .alignItems(HorizontalAlign.Start)
  }

  build() {
    NavDestination() {
      Scroll() {
        Column() {
          ScenarioHeader({ title: FLIGHT_SCENE.title, subtitle: FLIGHT_SCENE.subtitle })

          Column() {
            this.flightBusinessBody()

            Column() {
              FlightInfoRow()
            }
            .width(FULL_SIZE)
            .padding(SPACE_XXL)
            .borderRadius(RADIUS_MD)
            .backgroundColor(COLOR_BACKGROUND_SECONDARY)
            .margin({ top: SPACE_XXL })
          }
          .width(FULL_SIZE)
          .padding(SPACE_PAGE)
          .borderRadius(RADIUS_CARD)
          .backgroundColor(COLOR_COMPONENT_BACKGROUND_PRIMARY)
          .margin({ top: SPACE_XXL })
        }
        .id(FLIGHT_SCENE.pageId)
        .width(FULL_SIZE)
        .padding(SPACE_PAGE)
        .backgroundColor(COLOR_BACKGROUND_SECONDARY)
      }
      .scrollBar(BarState.Off)
      .align(Alignment.TopStart)
      .width(FULL_SIZE)
      .height(FULL_SIZE)
    }
    .title('航班动态卡')
    .onBackPressed(() => {
      ScenarioRouter.pop();
      return true;
    })
  }
}

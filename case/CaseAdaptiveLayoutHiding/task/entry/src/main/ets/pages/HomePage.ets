import {
  COLOR_BACKGROUND_SECONDARY,
  COLOR_COMPONENT_BACKGROUND_PRIMARY,
  COLOR_FONT_PRIMARY,
  COLOR_FONT_SECONDARY,
  FONT_SIZE_CAPTION,
  FONT_SIZE_DISPLAY,
  FONT_SIZE_TITLE,
  FULL_SIZE,
  NAV_BUTTON_HEIGHT,
  RADIUS_CARD,
  SPACE_PAGE,
  SPACE_SM,
  SPACE_XXL
} from '../common/StyleConstants';
import { ScenarioRoute, ScenarioRouter } from '../routes/ScenarioRoutes';

@ComponentV2
export struct HomePage {
  @Builder
  navButton(id: string, title: string, description: string, route: ScenarioRoute) {
    Button() {
      Column() {
        Text(title)
          .fontSize(FONT_SIZE_TITLE)
          .fontWeight(FontWeight.Bold)
        Text(description)
          .fontSize(FONT_SIZE_CAPTION)
          .fontColor(COLOR_FONT_SECONDARY)
          .margin({ top: SPACE_SM })
      }
      .alignItems(HorizontalAlign.Start)
      .width(FULL_SIZE)
      .padding(SPACE_PAGE)
    }
    .id(id)
    .width(FULL_SIZE)
    .height(NAV_BUTTON_HEIGHT)
    .borderRadius(RADIUS_CARD)
    .backgroundColor(COLOR_COMPONENT_BACKGROUND_PRIMARY)
    .fontColor(COLOR_FONT_PRIMARY)
    .onClick(() => {
      ScenarioRouter.push(route);
    })
  }

  build() {
    Scroll() {
      Column({ space: SPACE_XXL }) {
        Text('场景列表')
          .fontSize(FONT_SIZE_DISPLAY)
          .fontWeight(FontWeight.Bold)
          .fontColor(COLOR_FONT_PRIMARY)
          .width(FULL_SIZE)

        this.navButton('home-meeting-button', '会议控制条', '会议页底部操作控制', ScenarioRoute.MEETING)
        this.navButton('home-flight-button', '航班动态卡', '航班卡信息与附加服务', ScenarioRoute.FLIGHT)
        this.navButton('home-trip-button', '出行行程进度', '出行卡横向进度节点', ScenarioRoute.TRIP)
      }
      .id('scenario-home-page')
      .width(FULL_SIZE)
      .padding(SPACE_PAGE)
    }
    .width(FULL_SIZE)
    .height(FULL_SIZE)
    .backgroundColor(COLOR_BACKGROUND_SECONDARY)
    .align(Alignment.Top)
    .scrollBar(BarState.Off)
    .edgeEffect(EdgeEffect.Spring)
  }
}

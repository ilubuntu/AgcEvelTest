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
  RADIUS_PANEL,
  SPACE_LG,
  SPACE_PAGE,
  SPACE_SECTION
} from '../common/StyleConstants';
import { ScenarioRoute, ScenarioRouter } from '../routes/ScenarioRoutes';

@ComponentV2
export struct HomePage {
  @Builder
  navButton(id: string, title: string, description: string, route: ScenarioRoute) {
    Button() {
      Column({ space: SPACE_LG }) {
        Text(title)
          .fontSize(FONT_SIZE_TITLE)
          .fontWeight(FontWeight.Bold)
        Text(description)
          .fontSize(FONT_SIZE_CAPTION)
          .fontColor(COLOR_FONT_SECONDARY)
      }
      .alignItems(HorizontalAlign.Start)
      .width(FULL_SIZE)
      .padding(SPACE_PAGE)
    }
    .id(id)
    .width(FULL_SIZE)
    .height(NAV_BUTTON_HEIGHT)
    .borderRadius(RADIUS_PANEL)
    .backgroundColor(COLOR_COMPONENT_BACKGROUND_PRIMARY)
    .fontColor(COLOR_FONT_PRIMARY)
    .onClick(() => {
      ScenarioRouter.push(route);
    })
  }

  build() {
    Scroll() {
      Column({ space: SPACE_SECTION }) {
        Text('场景列表')
          .fontSize(FONT_SIZE_DISPLAY)
          .fontWeight(FontWeight.Bold)
          .fontColor(COLOR_FONT_PRIMARY)
          .width(FULL_SIZE)

        this.navButton('home-diamond-button', '金刚区高频入口', '查看横向入口均分场景', ScenarioRoute.DIAMOND)
        this.navButton('home-sidebar-button', '侧边栏菜单', '查看纵向菜单均分场景', ScenarioRoute.SIDEBAR)
        this.navButton('home-remote-button', '遥控器控制面板', '查看控制键均分场景', ScenarioRoute.REMOTE)
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

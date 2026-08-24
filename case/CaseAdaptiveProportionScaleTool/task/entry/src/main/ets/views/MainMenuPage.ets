import { MainMenuItem, MAIN_MENU_IDS_EQUAL, MAIN_MENU_LIST } from '../common/Models';
import { routerStack } from '../common/RouterStack';

@Component
export struct MainMenuPage {
  build() {
    NavDestination() {
      Column() {
        // 标题栏
        Row() {
          Image($r('app.media.ic_arrow_right'))
            .width(16)
            .height(16)
            .fillColor($r('app.color.font_color_level2'))
            .rotate({ angle: 180 })
            .onClick(() => routerStack.pop())
          Text('优惠券 / 收藏 工具栏')
            .fontSize(18)
            .fontWeight(FontWeight.Medium)
            .fontColor($r('app.color.font_color_level1'))
            .layoutWeight(1)
            .textAlign(TextAlign.Center)
          Blank().width(16)
        }
        .width('100%')
        .height(56)
        .padding({ left: 16, right: 16 })

        Scroll() {
          Column({ space: 16 }) {
            Text('菜单栏')
              .sectionTitle()
            buildMainMenuEqualArea()
          }
          .width('100%')
        }
        .layoutWeight(1)
        .align(Alignment.Top)
        .scrollBar(BarState.Off)
        .padding({ left: 16, right: 16, top: 4, bottom: 16 })
      }
      .width('100%')
      .height('100%')
      .backgroundColor($r('app.color.background_color_grey'))
      .alignItems(HorizontalAlign.Start)
    }
    .hideTitleBar(true)
  }
}

@Extend(Text)
function sectionTitle() {
  .fontSize(14)
  .fontWeight(FontWeight.Medium)
  .fontColor($r('app.color.font_color_level2'))
  .width('100%')
  .textAlign(TextAlign.Start)
}

@Builder
function buildMainMenuEqualArea() {
  Row() {
    ForEach(MAIN_MENU_LIST, (item: MainMenuItem, index: number) => {
      Column() {
        Image(item.icon)
          .width(40)
          .height(40)
        Text(item.label)
          .fontSize(12)
          .maxLines(1)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
          .fontColor($r('app.color.font_color_level1'))
      }
      .width(75)
      .id(MAIN_MENU_IDS_EQUAL[index])
    }, (item: MainMenuItem) => item.label)
  }
  .width('100%')
  .justifyContent(FlexAlign.Center)
  .backgroundColor($r('app.color.background_color_primary'))
  .borderRadius(16)
  .padding(12)
  .id('main-menu-equal-container')
}
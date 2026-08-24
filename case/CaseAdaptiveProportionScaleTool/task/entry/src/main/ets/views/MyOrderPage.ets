import { OrderTabItem, ORDER_TAB_IDS_EQUAL, ORDER_TAB_LIST } from '../common/Models';
import { routerStack } from '../common/RouterStack';

@Component
export struct MyOrderPage {
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
          Text('我的订单 工具栏')
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
            Text('工具栏')
              .sectionTitle()
            buildOrderEqualArea()
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
function buildOrderEqualArea() {
  Column() {
    buildOrderTitleRow()
    Row() {
      ForEach(ORDER_TAB_LIST, (item: OrderTabItem, index: number) => {
        Column() {
          Image(item.icon)
            .width(24)
            .height(24)
            .margin({ bottom: 4 })
          Text(item.label)
            .fontSize(12)
            .maxLines(1)
            .fontColor($r('app.color.font_color_level1'))
        }
        .alignItems(HorizontalAlign.Center)
        .width(60)
        .id(ORDER_TAB_IDS_EQUAL[index])
      }, (item: OrderTabItem) => item.label)
    }
    .width('100%')
    .alignItems(VerticalAlign.Center)
    .justifyContent(FlexAlign.Center)
  }
  .width('100%')
  .backgroundColor($r('app.color.background_color_primary'))
  .borderRadius(16)
  .padding(12)
  .id('order-equal-container')
}

@Builder
function buildOrderTitleRow() {
  Row() {
    Text('我的订单')
      .fontSize(16)
      .fontWeight(FontWeight.Medium)
      .fontColor($r('app.color.font_color_level1'))
    Blank()
    Text('全部')
      .fontSize(12)
      .maxLines(1)
      .fontColor($r('app.color.font_color_level2'))
      .margin({ right: 4 })
    Image($r('app.media.ic_arrow_right'))
      .width(16)
      .height(16)
      .fillColor($r('app.color.font_color_level2'))
  }
  .width('100%')
  .margin({ bottom: 16 })
}

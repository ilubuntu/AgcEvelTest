import { routerStack } from '../common/RouterStack';
import { MainMenuPage } from '../views/MainMenuPage';
import { MyOrderPage } from '../views/MyOrderPage';

@Entry
@Component
struct Index {
  @Builder
  pageMap(name: string) {
    if (name === 'MainMenuPage') {
      MainMenuPage()
    } else if (name === 'MyOrderPage') {
      MyOrderPage()
    }
  }

  build() {
    Navigation(routerStack) {
      Column() {
        Text('工具栏')
          .fontSize(22)
          .fontWeight(FontWeight.Bold)
          .fontColor($r('app.color.font_color_level1'))
          .margin({ top: 60, bottom: 40 })

        Button('优惠券 / 我的收藏 工具栏')
          .type(ButtonType.Capsule)
          .width('80%')
          .height(48)
          .margin({ bottom: 20 })
          .backgroundColor($r('app.color.theme_color'))
          .fontColor(Color.White)
          .onClick(() => {
            routerStack.pushPath({ name: 'MainMenuPage' });
          })

        Button('我的订单 工具栏')
          .type(ButtonType.Capsule)
          .width('80%')
          .height(48)
          .backgroundColor($r('app.color.theme_color'))
          .fontColor(Color.White)
          .onClick(() => {
            routerStack.pushPath({ name: 'MyOrderPage' });
          })
      }
      .width('100%')
      .height('100%')
      .backgroundColor($r('app.color.background_color_grey'))
      .alignItems(HorizontalAlign.Center)
    }
    .hideTitleBar(true)
    .mode(NavigationMode.Stack)
    .navDestination(this.pageMap)
  }
}

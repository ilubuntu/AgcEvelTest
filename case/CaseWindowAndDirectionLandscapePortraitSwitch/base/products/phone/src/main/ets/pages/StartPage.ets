import { CommonConstants, RouterMap, RouterUtils } from 'lib_common';

/**
 * 非首次打开首屏页
 */
@Builder
export function StartPageBuilder() {
  StartPage()
}

@ComponentV2
struct StartPage {

  aboutToAppear(): void {
    setTimeout(() => {
      RouterUtils.replacePathByName(RouterMap.INDEX_PAGE);
    }, 500)
  }

  build() {
    NavDestination() {
      Stack() {
        Column() {
          Image($r('app.media.startIcon'))
            .width(116)
            .height(116)
            .draggable(false)
            .margin({ top: 215, bottom: 258 })
          Text('视频模板')
            .fontSize($r('sys.float.Title_M'))
            .fontWeight(FontWeight.Medium)
            .fontColor($r('app.color.app_theme'))
            .height(32)
          Text('视频也是如此精彩')
            .fontSize($r('sys.float.Body_L'))
            .fontWeight(FontWeight.Regular)
            .fontColor('rgba(92, 121, 217, 0.8)')
            .height(21)
        }
        .height(CommonConstants.FULL_PERCENT)
        .width(CommonConstants.FULL_PERCENT)
        .backgroundImage($r('app.media.ic_start_background'))
        .backgroundImageSize({ width: '100%', height: '100%' })
      }
    }
    .hideTitleBar(true)
  }
}

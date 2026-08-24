import { CommonConstants } from 'lib_common';
import { HomePageBuilder } from 'business_home';

@Builder
export function IndexPageBuilder() {
  IndexPage()
}

@ComponentV2
struct IndexPage {
  build() {
    NavDestination() {
      Column() {
        HomePageBuilder()
      }
      .height(CommonConstants.FULL_PERCENT)
      .width(CommonConstants.FULL_PERCENT)
    }
    .hideTitleBar(true)
  }
}

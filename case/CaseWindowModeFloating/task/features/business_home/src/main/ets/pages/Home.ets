import { CardAttributeUpdater, CommonConstants } from 'lib_foundation';
import { HomeVM } from '../viewmodels/HomeVM';

@ComponentV2
export struct Home {
  vm: HomeVM = HomeVM.instance;
  cardOtherModifier: CardAttributeUpdater = new CardAttributeUpdater();

  aboutToAppear(): void {
    this.vm.init();
  }

  build() {
    Column() {
      Scroll(this.vm.scrollerController) {
        Column() {
          Row(){
            Search().width(40)
          }.width(CommonConstants.FULL_PERCENT).justifyContent(FlexAlign.End)
          Blank().layoutWeight(1).width(CommonConstants.FULL_PERCENT)
        }
        .margin({ top: this.vm.windowModel.windowTopPadding })
        .backgroundColor($r('sys.color.background_primary'))
        .borderRadius({ topLeft: 16, topRight: 16 })
        .clip(true)
      }
      .scrollBar(BarState.Off)
      .edgeEffect(EdgeEffect.Fade)
      .padding({left:16,right:16})
      .width(CommonConstants.FULL_PERCENT)
      .height(CommonConstants.FULL_PERCENT)
    }
  }
}

import { AppStorageMap, LocationInfo, WindowUtil } from 'lib_foundation';
import { WidgetUtil } from '../utils/WidgetUtil';
import { AppStorageV2 } from '@kit.ArkUI';
import { WindowModel } from 'lib_common';

@ObservedV2
export class HomeVM {
  @Trace rate: number = 0;
  @Trace location: LocationInfo = { name: '北京', code: '110100' };
  private static _instance: HomeVM;
  scrollerController: Scroller = new Scroller();
  swiperController: SwiperController = new SwiperController();
  @Trace windowModel: WindowModel = AppStorageV2.connect(WindowModel, () => new WindowModel())!;

  @Monitor('location')
  private _change() {
    WidgetUtil.setLocation(this.location, getContext());
  }

  public static get instance() {
    if (!HomeVM._instance) {
      HomeVM._instance = new HomeVM();
    }
    return HomeVM._instance;
  }

  public async init() {
    // const res = await CityManager.applyLocationPermission();
    // this.location = { name: res.name, code: res.code };
  }

}
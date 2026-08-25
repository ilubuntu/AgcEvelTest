import { SettingType } from '../common/Constants';
import { SettingItem, SettingGroup } from '../common/SettingModels';
import { SettingCard } from '../components/SettingCard';

@Entry
@Component
struct Index {
  @State navPathStack: NavPathStack = new NavPathStack();

  @State group1: SettingGroup = new SettingGroup()
    .setList([
      new SettingItem().setType(SettingType.ROUTER).setLabel('个人信息'),
    ])

  @State group2: SettingGroup = new SettingGroup()
    .setList([
      new SettingItem().setType(SettingType.SELECT).setLabel('显示模式')
        .setSelectOptions([{ id: 0, label: '跟随系统' }, { id: 1, label: '深色模式' }, { id: 2, label: '浅色模式' }])
        .setSelectIndex(0),
      new SettingItem().setType(SettingType.ROUTER).setLabel('字体大小'),
    ])

  @State group3: SettingGroup = new SettingGroup()
    .setList([
      new SettingItem().setType(SettingType.SWITCH).setLabel('通知开关').setSwitchValue(true),
      new SettingItem().setType(SettingType.ROUTER).setLabel('播放与网络设置'),
      new SettingItem().setType(SettingType.TEXT).setLabel('清理缓存').setNormalText('0.38M'),
    ])

  @State group4: SettingGroup = new SettingGroup()
    .setTitle('数据和隐私')
    .setList([
      new SettingItem().setType(SettingType.SWITCH).setLabel('个性化推荐').setSwitchValue(true),
    ])

  @State group5: SettingGroup = new SettingGroup()
    .setTitle('了解我们如何使用您的数据')
    .setList([
      new SettingItem().setType(SettingType.ROUTER).setLabel('业务与隐私的声明'),
      new SettingItem().setType(SettingType.ROUTER).setLabel('第三方共享信息清单'),
      new SettingItem().setType(SettingType.ROUTER).setLabel('第三方 SDK 列表'),
      new SettingItem().setType(SettingType.ROUTER).setLabel('已收集个人信息清单'),
      new SettingItem().setType(SettingType.ROUTER).setLabel('隐私声明摘要'),
    ])

  @State settingList: SettingGroup[] = [this.group1, this.group2, this.group3, this.group4, this.group5]

  build() {
    Navigation(this.navPathStack) {

      Scroll() {
        Column({ space: 16 }) {
          ForEach(this.settingList, (group: SettingGroup, index: number) => {
            SettingCard({ group: group })
              .id(`reading-card-${index}`)
          }, (group: SettingGroup) => group.id)
        }
        .padding({ top: 16, bottom: 32, left: 16, right: 16 })
        .width('100%')
      }
      .id('setting-page-scroll')
      .scrollBar(BarState.Off)
      .width('100%')
      .height('100%')
      .backgroundColor($r('sys.color.background_secondary'))

    }
    .title('设置')
    .mode(NavigationMode.Stack)
  }
}
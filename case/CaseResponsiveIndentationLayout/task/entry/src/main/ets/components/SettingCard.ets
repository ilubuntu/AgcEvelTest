import { SettingType } from '../common/Constants';
import { SettingItem, SettingGroup } from '../common/SettingModels';

@Component
export struct SettingCard {
  @ObjectLink group: SettingGroup;

  build() {
    Column() {
      if (this.group.title) {
        Row() {
          Text(this.group.title)
            .fontSize(14)
            .fontColor($r('sys.color.font_secondary'))
            .fontWeight(FontWeight.Medium)
        }
        .width('100%')
        .padding({ left: 16, right: 16, top: 24, bottom: 8 })
      }

      List() {
        ForEach(this.group.list, (v: SettingItem) => {
          ListItem() {
            Row() {
              Column({ space: 4 }) {
                Text(v.label)
                  .fontSize(16)
                  .fontColor($r('sys.color.font_primary'))
                  .fontWeight(FontWeight.Medium)
                if (v.subLabel) {
                  Text(v.subLabel)
                    .fontSize(12)
                    .fontColor($r('sys.color.font_secondary'))
                }
              }
              .layoutWeight(1)
              .alignItems(HorizontalAlign.Start)

              Row() {
                if (v.type === SettingType.SWITCH) {
                  Toggle({ type: ToggleType.Switch, isOn: v.switchV })
                    .selectedColor('#007DFF')
                } else if (v.type === SettingType.SELECT) {
                  Row() {
                    Text(v.selectOptions.length > 0 ? v.selectOptions[v.selectIndex].label : '')
                      .fontSize(14)
                      .fontColor($r('sys.color.font_secondary'))
                    SymbolGlyph($r('sys.symbol.arrowtriangle_down_fill'))
                      .fontSize(16)
                      .fontColor([$r('sys.color.font_fourth')])
                      .margin({ left: 4 })
                  }
                } else {
                  if (v.normalText) {
                    Text(v.normalText)
                      .fontSize(14)
                      .fontColor($r('sys.color.font_secondary'))
                  }
                  SymbolGlyph($r('sys.symbol.chevron_right'))
                    .fontSize(20)
                    .fontColor([$r('sys.color.font_fourth')])
                    .margin({ left: 4 })
                }
              }
              .justifyContent(FlexAlign.End)
              .margin({ left: 16 })
            }
            .padding({ top: 12, bottom: 12, left: 16, right: 16 })
            .constraintSize({ minHeight: 48 })
            .width('100%')
          }
        }, (v: SettingItem) => v.id)
      }
      .width('100%')
      .borderRadius(20)
      .backgroundColor($r('sys.color.comp_background_list_card'))
      .padding(4)
      .divider({
        strokeWidth: 1,
        color: $r('sys.color.comp_divider'),
        startMargin: 16,
        endMargin: 16
      })
    }
    .alignItems(HorizontalAlign.Start)
  }
}
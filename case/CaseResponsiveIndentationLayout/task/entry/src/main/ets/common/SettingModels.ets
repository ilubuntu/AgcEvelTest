import { util } from '@kit.ArkTS';
import { SettingType } from './Constants';

export interface ISelectOption {
  id: number;
  label: string;
}

@Observed
export class SettingItem {
  id: string = util.generateRandomUUID();
  type: SettingType = SettingType.TEXT;
  label: string = '';
  subLabel: string = '';
  switchV: boolean = false;
  selectIndex: number = 0;
  selectOptions: ISelectOption[] = [];
  normalText: string = '';

  setType(type: SettingType) { this.type = type; return this; }
  setLabel(label: string) { this.label = label; return this; }
  setSubLabel(subLabel: string) { this.subLabel = subLabel; return this; }
  setSwitchValue(switchV: boolean) { this.switchV = switchV; return this; }
  setSelectIndex(selectIndex: number) { this.selectIndex = selectIndex; return this; }
  setSelectOptions(selectOptions: ISelectOption[]) { this.selectOptions = selectOptions; return this; }
  setNormalText(normalText: string) { this.normalText = normalText; return this; }
}

@Observed
export class SettingGroup {
  id: string = util.generateRandomUUID();
  title: string = '';
  list: SettingItem[] = [];

  setTitle(title: string) { this.title = title; return this; }
  setList(list: SettingItem[]) { this.list = list; return this; }
}
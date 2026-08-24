import { IButtonItem, NavInfo } from '../base/BaseModel'
import { AuthorResponse } from './AuthorResponse'
import { NewsResponse } from './NewsResponse'

export class AuthorInfo implements AuthorResponse {
  authorId: string = ''
  authorNickName: string = ''
  authorIcon: string = ''
  authorDesc: string = ''
  authorIp: string = ''
  watchersCount: number = 0
  followersCount: number = 0
  likeNum: number = 0
  authorPhone: string = ''
  watchers: string[] = []
  followers: string[] = []
  authorUid: string = ''
}

export interface FlexLayoutModel {
  navInfo: NavInfo
  articles: string[]
  extraInfo: Record<string, string | boolean | Record<string, string | boolean>[]>
}

@ObservedV2
export class RequestListData {
  navInfo: NavInfo = new NavInfo()
  @Trace articles: NewsResponse[] = []
  extraInfo: Record<string, string | boolean | Record<string, string | boolean>[]> = {}
}

export class LayoutSetting {
  type: string = ''
  style: Record<string, string | number> = {}
  showType: string = ''
  children: LayoutSetting[] = []
}

export class LayoutStyle {
  backgroundColor: string = ''
  borderRadius: number = 0
  space: number = 0
  paddingLeft: number | string = 0
  paddingRight: number | string = 0
  paddingBottom: number | string = 0
  paddingTop: number | string = 0
}

export class LayoutParams {
  nativeCardData: NewsResponse
  currentIndex: number = 0
  extraInfo: Record<string, string | boolean | Record<string, string | boolean>[] | IButtonItem[]> = {}
  layout: LayoutSetting = new LayoutSetting()

  constructor(nativeCardData: NewsResponse, currentIndex: number,
    extraInfo: Record<string, string | boolean | Record<string, string | boolean>[]>, layout: LayoutSetting) {
    this.nativeCardData = nativeCardData
    this.currentIndex = currentIndex
    this.extraInfo = extraInfo
    this.layout = layout
  }
}
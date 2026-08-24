import {
  AVATAR_SIZE,
  COLOR_ALERT,
  COLOR_BACKGROUND_SECONDARY,
  COLOR_BRAND,
  COLOR_COMPONENT_BACKGROUND_PRIMARY,
  COLOR_COMPONENT_BACKGROUND_SECONDARY,
  COLOR_CONFIRM,
  COLOR_FONT_PRIMARY,
  COLOR_FONT_SECONDARY,
  COLOR_FONT_TERTIARY,
  COLOR_WARNING,
  DOT_SIZE,
  FILE_THUMBNAIL_HEIGHT,
  FILE_THUMBNAIL_WIDTH,
  FONT_SIZE_CAPTION,
  FONT_SIZE_LABEL,
  FONT_SIZE_TINY,
  FULL_SIZE,
  LAYOUT_WEIGHT_FILL,
  RADIUS_CARD,
  RADIUS_DOT,
  RADIUS_GROUP,
  RADIUS_MD,
  RADIUS_SM,
  SPACE_LG,
  SPACE_PAGE,
  SPACE_SM,
  SPACE_XS,
  SPACE_XXL
} from '../common/StyleConstants';
import { ScenarioHeader } from '../components/ScenarioChrome';
import { MeetingToolBar } from '../components/MeetingToolBar';
import { MEETING_SCENE } from '../model/MeetingData';
import { ScenarioRouter } from '../routes/ScenarioRoutes';

@Builder
export function meetingScenarioPageBuilder() {
  MeetingScenarioPage()
}

@ComponentV2
struct MeetingScenarioPage {
  @Builder
  meetingBusinessBody() {
    Column({ space: SPACE_XXL }) {
      Column({ space: SPACE_LG }) {
        Row() {
          Text('共享屏幕中')
            .fontSize(FONT_SIZE_CAPTION)
            .fontColor(COLOR_BRAND)
            .fontWeight(FontWeight.Medium)
          Blank()
          Row({ space: SPACE_SM }) {
            Column().width(DOT_SIZE).height(DOT_SIZE).borderRadius(RADIUS_DOT).backgroundColor(COLOR_ALERT)
            Text('录制中').fontSize(FONT_SIZE_CAPTION).fontColor(COLOR_ALERT)
          }
          .alignItems(VerticalAlign.Center)
        }
        .width(FULL_SIZE)

        Row({ space: SPACE_LG }) {
          Column()
            .width(FILE_THUMBNAIL_WIDTH)
            .height(FILE_THUMBNAIL_HEIGHT)
            .borderRadius(RADIUS_SM)
            .backgroundColor(COLOR_COMPONENT_BACKGROUND_SECONDARY)
          Column({ space: SPACE_XS }) {
            Text('Q3 业务复盘.pptx')
              .fontSize(FONT_SIZE_LABEL)
              .fontColor(COLOR_FONT_PRIMARY)
              .maxLines(1)
            Text('张明 · 正在演示')
              .fontSize(FONT_SIZE_TINY)
              .fontColor(COLOR_FONT_SECONDARY)
          }
          .alignItems(HorizontalAlign.Start)
          .layoutWeight(LAYOUT_WEIGHT_FILL)
        }
        .width(FULL_SIZE)
        .alignItems(VerticalAlign.Center)
      }
      .width(FULL_SIZE)
      .padding(SPACE_XXL)
      .borderRadius(RADIUS_MD)
      .backgroundColor(COLOR_BACKGROUND_SECONDARY)

      Scroll() {
        Row({ space: SPACE_LG }) {
          Row({ space: SPACE_SM }) {
            Column().width(AVATAR_SIZE).height(AVATAR_SIZE).borderRadius(RADIUS_GROUP).backgroundColor(COLOR_WARNING)
            Column().width(AVATAR_SIZE).height(AVATAR_SIZE).borderRadius(RADIUS_GROUP).backgroundColor(COLOR_CONFIRM)
            Column().width(AVATAR_SIZE).height(AVATAR_SIZE).borderRadius(RADIUS_GROUP).backgroundColor(COLOR_BRAND)
            Column().width(AVATAR_SIZE).height(AVATAR_SIZE).borderRadius(RADIUS_GROUP).backgroundColor(COLOR_WARNING)
          }
          .alignItems(VerticalAlign.Center)

          Text('等 32 人在线')
            .fontSize(FONT_SIZE_CAPTION)
            .fontColor(COLOR_FONT_TERTIARY)
          Blank()
          Text('成员')
            .fontSize(FONT_SIZE_CAPTION)
            .fontColor(COLOR_FONT_SECONDARY)
        }
        .constraintSize({ minWidth: FULL_SIZE })
        .alignItems(VerticalAlign.Center)
      }
      .scrollable(ScrollDirection.Horizontal)
      .scrollBar(BarState.Off)
      .edgeEffect(EdgeEffect.Spring)
      .align(Alignment.Top)
      .width(FULL_SIZE)
    }
    .width(FULL_SIZE)
    .alignItems(HorizontalAlign.Start)
  }

  build() {
    NavDestination() {
      Scroll() {
        Column() {
          ScenarioHeader({ title: MEETING_SCENE.title, subtitle: MEETING_SCENE.subtitle })

          Column() {
            this.meetingBusinessBody()

            Column() {
              MeetingToolBar({
                controls: MEETING_SCENE.controls,
                toolbarId: MEETING_SCENE.toolbarId
              })
            }
            .width(FULL_SIZE)
            .padding(SPACE_XXL)
            .borderRadius(RADIUS_MD)
            .backgroundColor(COLOR_BACKGROUND_SECONDARY)
            .margin({ top: SPACE_XXL })
          }
          .width(FULL_SIZE)
          .padding(SPACE_PAGE)
          .borderRadius(RADIUS_CARD)
          .backgroundColor(COLOR_COMPONENT_BACKGROUND_PRIMARY)
          .margin({ top: SPACE_XXL })
        }
        .id(MEETING_SCENE.pageId)
        .width(FULL_SIZE)
        .padding(SPACE_PAGE)
        .backgroundColor(COLOR_BACKGROUND_SECONDARY)
      }
      .scrollBar(BarState.Off)
      .align(Alignment.TopStart)
      .width(FULL_SIZE)
      .height(FULL_SIZE)
    }
    .title('会议控制条')
    .onBackPressed(() => {
      ScenarioRouter.pop();
      return true;
    })
  }
}

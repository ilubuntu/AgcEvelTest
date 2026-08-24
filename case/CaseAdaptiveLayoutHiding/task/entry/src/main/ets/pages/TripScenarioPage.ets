import {
  COLOR_BACKGROUND_SECONDARY,
  COLOR_BRAND,
  COLOR_COMPONENT_BACKGROUND_PRIMARY,
  COLOR_FONT_PRIMARY,
  COLOR_FONT_SECONDARY,
  FONT_SIZE_CAPTION,
  FONT_SIZE_TITLE,
  FULL_SIZE,
  LAYOUT_WEIGHT_FILL,
  RADIUS_CARD,
  RADIUS_MD,
  SPACE_MD,
  SPACE_PAGE,
  SPACE_XS,
  SPACE_XXL
} from '../common/StyleConstants';
import { ScenarioHeader } from '../components/ScenarioChrome';
import { TripProgressTrack } from '../components/TripProgressTrack';
import { TRIP_SCENE } from '../model/TripData';
import { ScenarioRouter } from '../routes/ScenarioRoutes';

@Builder
export function tripScenarioPageBuilder() {
  TripScenarioPage()
}

@ComponentV2
struct TripScenarioPage {
  @Builder
  tripBusinessBody() {
    Column({ space: SPACE_XXL }) {
      Row() {
        Column({ space: SPACE_XS }) {
          Text('当前阶段')
            .fontSize(FONT_SIZE_CAPTION)
            .fontColor(COLOR_FONT_SECONDARY)
          Text('前往登机口')
            .fontSize(FONT_SIZE_TITLE)
            .fontColor(COLOR_FONT_PRIMARY)
            .fontWeight(FontWeight.Bold)
        }
        .alignItems(HorizontalAlign.Start)
        .layoutWeight(LAYOUT_WEIGHT_FILL)

        Column({ space: SPACE_XS }) {
          Text('预计登机')
            .fontSize(FONT_SIZE_CAPTION)
            .fontColor(COLOR_FONT_SECONDARY)
          Text('18 分钟后')
            .fontSize(FONT_SIZE_TITLE)
            .fontColor(COLOR_BRAND)
            .fontWeight(FontWeight.Bold)
        }
        .alignItems(HorizontalAlign.End)
      }
      .width(FULL_SIZE)

      Row() {
        Row({ space: SPACE_MD }) {
          Text('登机口')
            .fontSize(FONT_SIZE_CAPTION)
            .fontColor(COLOR_FONT_SECONDARY)
          Text('B12')
            .fontSize(FONT_SIZE_TITLE)
            .fontColor(COLOR_FONT_PRIMARY)
            .fontWeight(FontWeight.Bold)
        }
        .alignItems(VerticalAlign.Center)

        Blank()

        Text('距登机口约 600 米')
          .fontSize(FONT_SIZE_CAPTION)
          .fontColor(COLOR_FONT_SECONDARY)
      }
      .width(FULL_SIZE)
      .alignItems(VerticalAlign.Center)
    }
    .width(FULL_SIZE)
    .alignItems(HorizontalAlign.Start)
  }

  build() {
    NavDestination() {
      Scroll() {
        Column() {
          ScenarioHeader({ title: TRIP_SCENE.title, subtitle: TRIP_SCENE.subtitle })

          Column() {
            this.tripBusinessBody()

            Column() {
              TripProgressTrack({
                nodes: TRIP_SCENE.nodes,
                trackId: TRIP_SCENE.trackId
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
        .id(TRIP_SCENE.pageId)
        .width(FULL_SIZE)
        .padding(SPACE_PAGE)
        .backgroundColor(COLOR_BACKGROUND_SECONDARY)
      }
      .scrollBar(BarState.Off)
      .align(Alignment.TopStart)
      .width(FULL_SIZE)
      .height(FULL_SIZE)
    }
    .title('出行行程进度')
    .onBackPressed(() => {
      ScenarioRouter.pop();
      return true;
    })
  }
}

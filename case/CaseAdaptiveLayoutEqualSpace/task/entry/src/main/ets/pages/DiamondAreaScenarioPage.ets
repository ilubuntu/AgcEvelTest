import {
  COLOR_BACKGROUND_SECONDARY,
  COLOR_BRAND,
  COLOR_DIAMOND_ENTRY,
  COLOR_DIAMOND_PANEL,
  COLOR_FONT_SECONDARY,
  DIAMOND_ENTRY_WIDTH,
  DIAMOND_ICON_SIZE,
  FONT_SIZE_CAPTION,
  FULL_SIZE,
  RADIUS_ICON,
  RADIUS_PANEL,
  SPACE_LG,
  SPACE_PAGE,
  SPACE_SECTION,
  SPACE_SM,
  SYMBOL_FONT_ICON
} from '../common/StyleConstants';
import { ScenarioHeader } from '../components/ScenarioChrome';
import { CaseItem, DIAMOND_ENTRIES } from '../model/CaseModels';
import { ScenarioRouter } from '../routes/ScenarioRoutes';

@Builder
export function diamondAreaScenarioPageBuilder() {
  DiamondAreaScenarioPage()
}

@ComponentV2
struct DiamondAreaScenarioPage {
  @Builder
  entryItem(item: CaseItem) {
    Column({ space: SPACE_SM }) {
      Row() {
        SymbolGlyph(item.symbol)
          .fontSize(SYMBOL_FONT_ICON)
          .fontColor([COLOR_BRAND])
      }
      .width(DIAMOND_ICON_SIZE)
      .height(DIAMOND_ICON_SIZE)
      .borderRadius(RADIUS_ICON)
      .backgroundColor(COLOR_DIAMOND_ENTRY)
      .justifyContent(FlexAlign.Center)
      Text(item.label)
        .fontSize(FONT_SIZE_CAPTION)
        .fontColor(COLOR_FONT_SECONDARY)
    }
    .id(item.id)
    .width(DIAMOND_ENTRY_WIDTH)
    .alignItems(HorizontalAlign.Center)
  }

  @Builder
  body() {
    Row({ space: SPACE_LG }) {
      ForEach(DIAMOND_ENTRIES, (item: CaseItem) => {
        this.entryItem(item)
      }, (item: CaseItem) => item.id)
    }
    .id('section-diamond')
    .width(FULL_SIZE)
    .padding({ top: SPACE_PAGE, bottom: SPACE_PAGE })
    .backgroundColor(COLOR_DIAMOND_PANEL)
    .borderRadius(RADIUS_PANEL)
  }

  build() {
    NavDestination() {
      Scroll() {
        Column({ space: SPACE_SECTION }) {
          ScenarioHeader({ title: '金刚区高频入口', subtitle: '横向入口随可用宽度均分间距。' })
          this.body()
        }
        .id('case-page-diamond')
        .width(FULL_SIZE)
        .padding(SPACE_PAGE)
      }
      .width(FULL_SIZE)
      .height(FULL_SIZE)
      .backgroundColor(COLOR_BACKGROUND_SECONDARY)
      .scrollBar(BarState.Off)
      .align(Alignment.TopStart)
    }
    .title('金刚区高频入口')
    .onBackPressed(() => {
      ScenarioRouter.pop();
      return true;
    })
  }
}

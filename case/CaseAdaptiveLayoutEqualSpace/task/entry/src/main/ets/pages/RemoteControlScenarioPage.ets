import {
  COLOR_BACKGROUND_SECONDARY,
  COLOR_FONT_ON_PRIMARY,
  COLOR_REMOTE_KEY,
  COLOR_REMOTE_PANEL,
  COLOR_TV_SCREEN,
  FULL_SIZE,
  REMOTE_KEY_SIZE,
  RADIUS_KEY,
  RADIUS_PANEL,
  SPACE_PAGE,
  SPACE_SECTION,
  SYMBOL_FONT_KEY,
  SYMBOL_FONT_TV,
  TV_MAX_WIDTH,
} from '../common/StyleConstants';
import { ScenarioHeader } from '../components/ScenarioChrome';
import { CaseItem, REMOTE_KEYS } from '../model/CaseModels';
import { ScenarioRouter } from '../routes/ScenarioRoutes';

@Builder
export function remoteControlScenarioPageBuilder() {
  RemoteControlScenarioPage()
}

@ComponentV2
struct RemoteControlScenarioPage {
  @Builder
  keyButton(item: CaseItem) {
    Column() {
      SymbolGlyph(item.symbol)
        .fontSize(SYMBOL_FONT_KEY)
        .fontColor([COLOR_FONT_ON_PRIMARY])
    }
    .id(item.id)
    .width(REMOTE_KEY_SIZE)
    .height(REMOTE_KEY_SIZE)
    .borderRadius(RADIUS_KEY)
    .backgroundColor(COLOR_REMOTE_KEY)
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
  }

  @Builder
  tvScreen() {
    Row() {
      SymbolGlyph($r('sys.symbol.display'))
        .fontSize(SYMBOL_FONT_TV)
        .fontColor([COLOR_FONT_ON_PRIMARY])
    }
    .width(FULL_SIZE)
    .aspectRatio(16 / 9)
    .constraintSize({ maxWidth: TV_MAX_WIDTH })
    .borderRadius(RADIUS_PANEL)
    .backgroundColor(COLOR_TV_SCREEN)
    .justifyContent(FlexAlign.Center)
  }

  @Builder
  body() {
    Column({ space: SPACE_SECTION }) {
      this.tvScreen()
      Flex({ justifyContent: FlexAlign.SpaceEvenly }) {
        ForEach(REMOTE_KEYS, (item: CaseItem) => {
          this.keyButton(item)
        }, (item: CaseItem) => item.id)
      }
      .id('section-remote')
      .width(FULL_SIZE)
      .padding({ top: SPACE_PAGE, bottom: SPACE_PAGE })
      .backgroundColor(COLOR_REMOTE_PANEL)
      .borderRadius(RADIUS_PANEL)
    }
    .width(FULL_SIZE)
  }

  build() {
    NavDestination() {
      Scroll() {
        Column({ space: SPACE_SECTION }) {
          ScenarioHeader({ title: '遥控器控制面板', subtitle: '控制键随面板宽度均分间距。' })
          this.body()
        }
        .id('case-page-remote')
        .width(FULL_SIZE)
        .padding(SPACE_PAGE)
      }
      .width(FULL_SIZE)
      .height(FULL_SIZE)
      .backgroundColor(COLOR_BACKGROUND_SECONDARY)
      .scrollBar(BarState.Off)
      .align(Alignment.TopStart)
    }
    .title('遥控器控制面板')
    .onBackPressed(() => {
      ScenarioRouter.pop();
      return true;
    })
  }
}

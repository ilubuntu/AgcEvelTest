import {
  COLOR_BACKGROUND_SECONDARY,
  COLOR_BRAND,
  COLOR_COMPONENT_BACKGROUND_PRIMARY,
  COLOR_FONT_PRIMARY,
  COLOR_FONT_SECONDARY,
  COLOR_SIDEBAR_AVATAR,
  COLOR_SIDEBAR_PANEL,
  AVATAR_SIZE,
  FONT_SIZE_BODY,
  FONT_SIZE_CAPTION,
  FONT_SIZE_STAT,
  FONT_SIZE_TITLE,
  FULL_SIZE,
  RADIUS_ICON,
  RADIUS_PANEL,
  SIDEBAR_MENU_HEIGHT,
  SIDEBAR_WIDTH,
  SPACE_LG,
  SPACE_MD,
  SPACE_PAGE,
  SPACE_SECTION,
  SPACE_SM,
  SYMBOL_FONT_AVATAR,
  SYMBOL_FONT_ICON
} from '../common/StyleConstants';
import { ScenarioHeader } from '../components/ScenarioChrome';
import { CaseItem, SIDEBAR_MENUS } from '../model/CaseModels';
import { ScenarioRouter } from '../routes/ScenarioRoutes';

@Builder
export function sidebarMenuScenarioPageBuilder() {
  SidebarMenuScenarioPage()
}

@ComponentV2
struct SidebarMenuScenarioPage {
  @Builder
  menuItem(item: CaseItem) {
    Column({ space: SPACE_SM }) {
      SymbolGlyph(item.symbol)
        .fontSize(SYMBOL_FONT_ICON)
        .fontColor([COLOR_BRAND])
      Text(item.label)
        .fontSize(FONT_SIZE_CAPTION)
        .fontColor(COLOR_FONT_SECONDARY)
    }
    .id(item.id)
    .width(FULL_SIZE)
    .height(SIDEBAR_MENU_HEIGHT)
    .alignItems(HorizontalAlign.Center)
    .justifyContent(FlexAlign.Center)
  }

  @Builder
  statItem(value: string, label: string) {
    Column({ space: SPACE_SM }) {
      Text(value)
        .fontSize(FONT_SIZE_STAT)
        .fontWeight(FontWeight.Bold)
        .fontColor(COLOR_FONT_PRIMARY)
      Text(label)
        .fontSize(FONT_SIZE_CAPTION)
        .fontColor(COLOR_FONT_SECONDARY)
    }
    .layoutWeight(1)
  }

  @Builder
  mainContent() {
    Column({ space: SPACE_SECTION }) {
      ScenarioHeader({ title: '侧边栏菜单', subtitle: '纵向菜单随可用高度均分间距。' })

      Row({ space: SPACE_LG }) {
        Row() {
          SymbolGlyph($r('sys.symbol.person'))
            .fontSize(SYMBOL_FONT_AVATAR)
            .fontColor([COLOR_BRAND])
        }
        .width(AVATAR_SIZE)
        .height(AVATAR_SIZE)
        .borderRadius(RADIUS_ICON)
        .backgroundColor(COLOR_SIDEBAR_AVATAR)
        .justifyContent(FlexAlign.Center)

        Column({ space: SPACE_SM }) {
          Text('张小明')
            .fontSize(FONT_SIZE_TITLE)
            .fontWeight(FontWeight.Bold)
            .fontColor(COLOR_FONT_PRIMARY)
          Text('查看个人主页 ›')
            .fontSize(FONT_SIZE_CAPTION)
            .fontColor(COLOR_FONT_SECONDARY)
        }
        .alignItems(HorizontalAlign.Start)
        .layoutWeight(1)
      }
      .width(FULL_SIZE)
      .padding(SPACE_PAGE)
      .borderRadius(RADIUS_PANEL)
      .backgroundColor(COLOR_COMPONENT_BACKGROUND_PRIMARY)

      Row({ space: SPACE_MD }) {
        this.statItem('128', '关注')
        this.statItem('1.2万', '粉丝')
        this.statItem('36', '动态')
        this.statItem('886', '获赞')
      }
      .width(FULL_SIZE)
      .padding({ top: SPACE_PAGE, bottom: SPACE_PAGE })
      .borderRadius(RADIUS_PANEL)
      .backgroundColor(COLOR_COMPONENT_BACKGROUND_PRIMARY)

      Column({ space: SPACE_MD }) {
        Text('我的服务')
          .fontSize(FONT_SIZE_BODY)
          .fontWeight(FontWeight.Medium)
          .fontColor(COLOR_FONT_PRIMARY)
      }
      .width(FULL_SIZE)
      .padding(SPACE_PAGE)
      .borderRadius(RADIUS_PANEL)
      .backgroundColor(COLOR_COMPONENT_BACKGROUND_PRIMARY)
      .layoutWeight(1)
      .constraintSize({ minHeight: SIDEBAR_MENU_HEIGHT })
    }
    .width(FULL_SIZE)
  }

  build() {
    NavDestination() {
      Row() {
        Column() {
          ForEach(SIDEBAR_MENUS, (item: CaseItem) => {
            this.menuItem(item)
          }, (item: CaseItem) => item.id)
        }
        .justifyContent(FlexAlign.SpaceEvenly)
        .id('section-sidebar')
        .width(SIDEBAR_WIDTH)
        .height(FULL_SIZE)
        .backgroundColor(COLOR_SIDEBAR_PANEL)

        Scroll() {
          this.mainContent()
        }
        .layoutWeight(1)
        .height(FULL_SIZE)
        .padding(SPACE_PAGE)
        .scrollBar(BarState.Off)
        .align(Alignment.Top)
      }
      .width(FULL_SIZE)
      .height(FULL_SIZE)
      .backgroundColor(COLOR_BACKGROUND_SECONDARY)
    }
    .title('侧边栏菜单')
    .onBackPressed(() => {
      ScenarioRouter.pop();
      return true;
    })
  }
}

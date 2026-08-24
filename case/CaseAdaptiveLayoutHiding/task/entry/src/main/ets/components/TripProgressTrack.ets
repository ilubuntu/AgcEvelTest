import {
  CHIP_HEIGHT,
  COLOR_BRAND,
  COLOR_COMPONENT_BACKGROUND_SECONDARY,
  COLOR_COMPONENT_BACKGROUND_TERTIARY,
  COLOR_FONT_ON_PRIMARY,
  COLOR_FONT_PRIMARY,
  COLOR_FONT_TERTIARY,
  FONT_SIZE_CAPTION,
  FULL_SIZE,
  RADIUS_CHIP,
  SPACE_LG
} from '../common/StyleConstants';
import { TripNode, TripNodeTone } from '../model/TripData';

function backgroundForTone(tone: TripNodeTone): ResourceColor {
  if (tone === 'primary') {
    return COLOR_BRAND;
  }
  if (tone === 'strong') {
    return COLOR_COMPONENT_BACKGROUND_SECONDARY;
  }
  if (tone === 'muted') {
    return COLOR_COMPONENT_BACKGROUND_TERTIARY;
  }
  return COLOR_COMPONENT_BACKGROUND_SECONDARY;
}

function foregroundForTone(tone: TripNodeTone): ResourceColor {
  if (tone === 'primary') {
    return COLOR_FONT_ON_PRIMARY;
  }
  return COLOR_FONT_PRIMARY;
}

@ComponentV2
export struct TripProgressTrack {
  @Require @Param nodes: TripNode[];
  @Require @Param trackId: string;

  private nodeId(item: TripNode): string {
    return `trip-${item.id}`;
  }

  private arrowId(item: TripNode): string {
    return `trip-${item.id}-arrow`;
  }

  @Builder
  nodeChip(item: TripNode) {
    Text(item.label)
      .id(this.nodeId(item))
      .accessibilityDescription(item.description)
      .fontSize(FONT_SIZE_CAPTION)
      .fontWeight(item.tone === 'primary' ? FontWeight.Bold : FontWeight.Medium)
      .fontColor(foregroundForTone(item.tone))
      .maxLines(1)
      .textAlign(TextAlign.Center)
      .height(CHIP_HEIGHT)
      .padding({ left: SPACE_LG, right: SPACE_LG })
      .borderRadius(RADIUS_CHIP)
      .backgroundColor(backgroundForTone(item.tone))
      .flexShrink(0)
  }

  build() {
    Row({ space: SPACE_LG }) {
      ForEach(this.nodes, (item: TripNode, index: number) => {
        this.nodeChip(item)

        if (index < this.nodes.length - 1) {
          Text('→')
            .id(this.arrowId(item))
            .fontSize(FONT_SIZE_CAPTION)
            .fontColor(COLOR_FONT_TERTIARY)
            .flexShrink(0)
        }
      }, (item: TripNode) => item.id)
    }
    .id(this.trackId)
    .width(FULL_SIZE)
    .height(CHIP_HEIGHT)
    .alignItems(VerticalAlign.Center)
    .justifyContent(FlexAlign.Start)
    .clip(true)
  }
}

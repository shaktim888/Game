<GameFile>
  <PropertyGroup Name="about" Type="Layer" ID="77dff3df-eff4-43ae-87c6-782c4b017d7c" Version="3.10.0.0" />
  <Content ctype="GameProjectContent">
    <Content>
      <Animation Duration="60" Speed="1.0000" ActivedAnimationName="uiEnter">
        <Timeline ActionTag="1554944026" Property="Position">
          <PointFrame FrameIndex="0" X="636.0000" Y="1050.0000">
            <EasingData Type="5" />
          </PointFrame>
          <PointFrame FrameIndex="30" X="636.0000" Y="410.0000">
            <EasingData Type="5" />
          </PointFrame>
          <PointFrame FrameIndex="60" X="636.0000" Y="1050.0000">
            <EasingData Type="5" />
          </PointFrame>
        </Timeline>
        <Timeline ActionTag="1554944026" Property="Scale">
          <ScaleFrame FrameIndex="0" X="1.0000" Y="1.0000">
            <EasingData Type="5" />
          </ScaleFrame>
          <ScaleFrame FrameIndex="30" X="1.0000" Y="1.0000">
            <EasingData Type="5" />
          </ScaleFrame>
          <ScaleFrame FrameIndex="60" X="1.0000" Y="1.0000">
            <EasingData Type="5" />
          </ScaleFrame>
        </Timeline>
        <Timeline ActionTag="1554944026" Property="RotationSkew">
          <ScaleFrame FrameIndex="0" X="0.0000" Y="0.0000">
            <EasingData Type="5" />
          </ScaleFrame>
          <ScaleFrame FrameIndex="30" X="0.0000" Y="0.0000">
            <EasingData Type="5" />
          </ScaleFrame>
          <ScaleFrame FrameIndex="60" X="0.0000" Y="0.0000">
            <EasingData Type="5" />
          </ScaleFrame>
        </Timeline>
      </Animation>
      <AnimationList>
        <AnimationInfo Name="uiEnter" StartIndex="0" EndIndex="30">
          <RenderColor A="255" R="255" G="160" B="122" />
        </AnimationInfo>
        <AnimationInfo Name="uiExit" StartIndex="30" EndIndex="60">
          <RenderColor A="255" R="0" G="0" B="205" />
        </AnimationInfo>
      </AnimationList>
      <ObjectData Name="Layer" Tag="11" ctype="GameLayerObjectData">
        <Size X="1280.0000" Y="720.0000" />
        <Children>
          <AbstractNodeData Name="Panel_1" ActionTag="-2099771010" Tag="49" IconVisible="False" VerticalEdge="TopEdge" ClipAble="False" BackColorAlpha="102" ColorAngle="90.0000" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
            <Size X="1280.0000" Y="720.0000" />
            <Children>
              <AbstractNodeData Name="Image_1" ActionTag="1554944026" Tag="74" IconVisible="False" LeftMargin="273.5000" RightMargin="281.5000" TopMargin="-636.0000" BottomMargin="744.0000" LeftEage="239" RightEage="239" TopEage="201" BottomEage="201" Scale9OriginX="239" Scale9OriginY="201" Scale9Width="247" Scale9Height="210" ctype="ImageViewObjectData">
                <Size X="725.0000" Y="612.0000" />
                <Children>
                  <AbstractNodeData Name="ListView_1" ActionTag="-1859060731" Tag="12" IconVisible="False" LeftMargin="112.0000" RightMargin="108.0000" TopMargin="280.0000" BottomMargin="32.0000" TouchEnable="True" ClipAble="False" BackColorAlpha="102" ColorAngle="90.0000" Scale9Width="1" Scale9Height="1" ScrollDirectionType="0" DirectionType="Vertical" ctype="ListViewObjectData">
                    <Size X="505.0000" Y="300.0000" />
                    <Children>
                      <AbstractNodeData Name="Text_1" ActionTag="-1937691199" Tag="13" IconVisible="False" RightMargin="-10.0000" BottomMargin="1.0000" FontSize="20" LabelText="At the beginning of the game, the blue side and the red &#xA;side turn the cards randomly, and the color of the turned &#xA;cards determines the color of the chess pieces controlled &#xA;by both sides.&#xA;&#xA;Each player can only move a chess piece once per &#xA;round.&#xA;&#xA;The two sides have not swallowed for 20 consecutive &#xA;steps and settled the situation.&#xA;&#xA;In the end, if there is only one chess piece left, the winner &#xA;with a large number of points will be equalized." ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                        <Size X="515.0000" Y="299.0000" />
                        <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                        <Position X="257.5000" Y="150.5000" />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="0" G="0" B="0" />
                        <PrePosition X="0.5099" Y="0.5017" />
                        <PreSize X="1.0198" Y="0.9967" />
                        <OutlineColor A="255" R="255" G="0" B="0" />
                        <ShadowColor A="255" R="110" G="110" B="110" />
                      </AbstractNodeData>
                    </Children>
                    <AnchorPoint />
                    <Position X="112.0000" Y="32.0000" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition X="0.1545" Y="0.0523" />
                    <PreSize X="0.6966" Y="0.4902" />
                    <SingleColor A="255" R="150" G="150" B="255" />
                    <FirstColor A="255" R="150" G="150" B="255" />
                    <EndColor A="255" R="255" G="255" B="255" />
                    <ColorVector ScaleY="1.0000" />
                  </AbstractNodeData>
                </Children>
                <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                <Position X="636.0000" Y="1050.0000" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition X="0.4969" Y="1.4583" />
                <PreSize X="0.5664" Y="0.8500" />
                <FileData Type="Normal" Path="game/doushouqi/image/popBg.png" Plist="" />
              </AbstractNodeData>
            </Children>
            <AnchorPoint />
            <Position />
            <Scale ScaleX="1.0000" ScaleY="1.0000" />
            <CColor A="255" R="255" G="255" B="255" />
            <PrePosition />
            <PreSize X="1.0000" Y="1.0000" />
            <SingleColor A="255" R="150" G="200" B="255" />
            <FirstColor A="255" R="150" G="200" B="255" />
            <EndColor A="255" R="255" G="255" B="255" />
            <ColorVector ScaleY="1.0000" />
          </AbstractNodeData>
        </Children>
      </ObjectData>
    </Content>
  </Content>
</GameFile>
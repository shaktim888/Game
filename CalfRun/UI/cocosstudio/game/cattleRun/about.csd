<GameFile>
  <PropertyGroup Name="about" Type="Layer" ID="ea3e8802-932c-4608-82f8-2de890cb83c8" Version="3.10.0.0" />
  <Content ctype="GameProjectContent">
    <Content>
      <Animation Duration="60" Speed="1.0000" ActivedAnimationName="uiEnter">
        <Timeline ActionTag="1554944026" Property="Position">
          <PointFrame FrameIndex="0" X="636.0000" Y="360.0000">
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
              <AbstractNodeData Name="Image_1" ActionTag="1554944026" Tag="74" IconVisible="False" LeftMargin="348.5000" RightMargin="356.5000" TopMargin="176.0000" BottomMargin="176.0000" LeftEage="239" RightEage="239" TopEage="201" BottomEage="201" Scale9OriginX="239" Scale9OriginY="167" Scale9Width="97" Scale9Height="34" ctype="ImageViewObjectData">
                <Size X="575.0000" Y="368.0000" />
                <Children>
                  <AbstractNodeData Name="ListView_1" ActionTag="-1859060731" Tag="12" IconVisible="False" LeftMargin="70.0000" RightMargin="65.0000" TopMargin="88.0000" BottomMargin="40.0000" TouchEnable="True" ClipAble="True" BackColorAlpha="102" ColorAngle="90.0000" Scale9Width="1" Scale9Height="1" ScrollDirectionType="0" DirectionType="Vertical" ctype="ListViewObjectData">
                    <Size X="440.0000" Y="240.0000" />
                    <Children>
                      <AbstractNodeData Name="Text_1" ActionTag="-1937691199" Tag="13" IconVisible="False" IsCustomSize="True" FontSize="20" LabelText="Victory: &#xA;Complete the system arrangement according to the order;&#xA;&#xA;Failure: &#xA;Any irregularly arranged order errors fail to calculate, and failure starts again at this level.&#xA;&#xA;Area: &#xA;Game interface is divided into five areas, according to the level of different areas of food falling areas have also changed;&#xA;&#xA;Move: &#xA;Manipulate the plate to move, the left side of the plate moves to the left, click on the right area of the plate to move to the right, and move to another point within 0.5S.&#xA;&#xA;Food Material Spacing: &#xA;Both sides of the food need to reserve a movable position to facilitate players to avoid;" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                        <Size X="440.0000" Y="510.0000" />
                        <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                        <Position X="220.0000" Y="255.0000" />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="255" G="255" B="255" />
                        <PrePosition X="0.5000" Y="0.5000" />
                        <PreSize X="1.0000" Y="1.0000" />
                        <OutlineColor A="255" R="255" G="0" B="0" />
                        <ShadowColor A="255" R="110" G="110" B="110" />
                      </AbstractNodeData>
                    </Children>
                    <AnchorPoint />
                    <Position X="70.0000" Y="40.0000" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition X="0.1217" Y="0.1087" />
                    <PreSize X="0.7652" Y="0.6522" />
                    <SingleColor A="255" R="150" G="150" B="255" />
                    <FirstColor A="255" R="150" G="150" B="255" />
                    <EndColor A="255" R="255" G="255" B="255" />
                    <ColorVector ScaleY="1.0000" />
                  </AbstractNodeData>
                </Children>
                <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                <Position X="636.0000" Y="360.0000" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition X="0.4969" Y="0.5000" />
                <PreSize X="0.4492" Y="0.5111" />
                <FileData Type="Normal" Path="game/cattleRun/image/popBg.png" Plist="" />
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
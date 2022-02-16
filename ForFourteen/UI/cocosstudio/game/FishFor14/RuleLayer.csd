<GameFile>
  <PropertyGroup Name="RuleLayer" Type="Layer" ID="a999cb73-b1ab-4e1f-a8bb-bfaa3d1af43a" Version="3.10.0.0" />
  <Content ctype="GameProjectContent">
    <Content>
      <Animation Duration="0" Speed="1.0000" />
      <ObjectData Name="Layer" Tag="30" ctype="GameLayerObjectData">
        <Size X="1280.0000" Y="720.0000" />
        <Children>
          <AbstractNodeData Name="shade" ActionTag="-406430227" Tag="54" IconVisible="False" LeftMargin="-647.3379" RightMargin="-72.6621" TopMargin="-424.6882" BottomMargin="-355.3118" TouchEnable="True" ClipAble="False" BackColorAlpha="102" ColorAngle="90.0000" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
            <Size X="2000.0000" Y="1500.0000" />
            <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
            <Position X="352.6621" Y="394.6882" />
            <Scale ScaleX="1.0000" ScaleY="1.0000" />
            <CColor A="255" R="255" G="255" B="255" />
            <PrePosition X="0.2755" Y="0.5482" />
            <PreSize X="1.5625" Y="2.0833" />
            <SingleColor A="255" R="77" G="77" B="77" />
            <FirstColor A="255" R="150" G="200" B="255" />
            <EndColor A="255" R="255" G="255" B="255" />
            <ColorVector ScaleY="1.0000" />
          </AbstractNodeData>
          <AbstractNodeData Name="rulePanel" ActionTag="1596791634" Tag="51" IconVisible="False" PositionPercentXEnabled="True" PositionPercentYEnabled="True" PercentWidthEnable="True" PercentHeightEnable="True" PercentWidthEnabled="True" PercentHeightEnabled="True" ClipAble="False" BackColorAlpha="102" ColorAngle="90.0000" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
            <Size X="1280.0000" Y="720.0000" />
            <Children>
              <AbstractNodeData Name="closeBtn" ActionTag="-1321556418" Tag="114" IconVisible="False" LeftMargin="-2.0410" RightMargin="2.0410" TopMargin="-0.4064" BottomMargin="0.4064" TouchEnable="True" ClipAble="False" BackColorAlpha="102" ColorAngle="90.0000" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
                <Size X="1280.0000" Y="720.0000" />
                <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                <Position X="637.9590" Y="360.4064" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition X="0.4984" Y="0.5006" />
                <PreSize X="1.0000" Y="1.0000" />
                <SingleColor A="255" R="150" G="200" B="255" />
                <FirstColor A="255" R="150" G="200" B="255" />
                <EndColor A="255" R="255" G="255" B="255" />
                <ColorVector ScaleY="1.0000" />
              </AbstractNodeData>
              <AbstractNodeData Name="bg2" ActionTag="-1424838627" Tag="52" IconVisible="False" PositionPercentXEnabled="True" PositionPercentYEnabled="True" LeftMargin="317.0000" RightMargin="317.0000" TopMargin="100.5000" BottomMargin="100.5000" ctype="SpriteObjectData">
                <Size X="646.0000" Y="519.0000" />
                <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                <Position X="640.0000" Y="360.0000" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition X="0.5000" Y="0.5000" />
                <PreSize X="0.5047" Y="0.7208" />
                <FileData Type="Normal" Path="game/FishFor14/ui2/windowBg.png" Plist="" />
                <BlendFunc Src="1" Dst="771" />
              </AbstractNodeData>
              <AbstractNodeData Name="titleText" ActionTag="1077615046" Tag="54" IconVisible="False" PositionPercentXEnabled="True" LeftMargin="586.0000" RightMargin="586.0000" TopMargin="157.7750" BottomMargin="504.2250" FontSize="48" LabelText="RULE" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                <Size X="108.0000" Y="58.0000" />
                <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                <Position X="640.0000" Y="533.2250" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="0" G="0" B="0" />
                <PrePosition X="0.5000" Y="0.7406" />
                <PreSize X="0.0844" Y="0.0806" />
                <FontResource Type="Normal" Path="game/FishFor14/ui2/body.TTF" Plist="" />
                <OutlineColor A="255" R="255" G="0" B="0" />
                <ShadowColor A="255" R="110" G="110" B="110" />
              </AbstractNodeData>
              <AbstractNodeData Name="ruleScrollView" ActionTag="-1550952960" Tag="55" IconVisible="False" PositionPercentXEnabled="True" LeftMargin="336.9280" RightMargin="343.0720" TopMargin="249.6096" BottomMargin="150.3904" TouchEnable="True" ClipAble="True" BackColorAlpha="102" ColorAngle="90.0000" Scale9Width="1" Scale9Height="1" ScrollDirectionType="Vertical" ctype="ScrollViewObjectData">
                <Size X="600.0000" Y="320.0000" />
                <Children>
                  <AbstractNodeData Name="ruleText" ActionTag="1369723030" Tag="56" IconVisible="False" PositionPercentXEnabled="True" LeftMargin="20.0000" RightMargin="20.0000" TopMargin="13.9000" BottomMargin="66.1000" IsCustomSize="True" FontSize="35" LabelText="This is a classic poker game. After you have finished playing cards, you can click on the upper card and the lower card. The number of points in the upper card and the card below is equal to 14 to eliminate. The color elimination of different cards is different. Among them, the spades are the largest and the squares are the most.&#xA;&#xA;Let your partners work together to eliminate poker!" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                    <Size X="580.0000" Y="500.0000" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="310.0000" Y="316.1000" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="0" G="0" B="0" />
                    <PrePosition X="0.5000" Y="0.5450" />
                    <PreSize X="0.9355" Y="0.8621" />
                    <FontResource Type="Normal" Path="game/FishFor14/ui2/body.TTF" Plist="" />
                    <OutlineColor A="255" R="255" G="0" B="0" />
                    <ShadowColor A="255" R="110" G="110" B="110" />
                  </AbstractNodeData>
                </Children>
                <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                <Position X="636.9280" Y="310.3904" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition X="0.4976" Y="0.4311" />
                <PreSize X="0.4688" Y="0.4444" />
                <SingleColor A="255" R="255" G="150" B="100" />
                <FirstColor A="255" R="255" G="150" B="100" />
                <EndColor A="255" R="255" G="255" B="255" />
                <ColorVector ScaleY="1.0000" />
                <InnerNodeSize Width="620" Height="580" />
              </AbstractNodeData>
            </Children>
            <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
            <Position X="640.0000" Y="360.0000" />
            <Scale ScaleX="1.0000" ScaleY="1.0000" />
            <CColor A="255" R="255" G="255" B="255" />
            <PrePosition X="0.5000" Y="0.5000" />
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
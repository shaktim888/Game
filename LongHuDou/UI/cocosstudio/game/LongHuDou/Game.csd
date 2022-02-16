<GameFile>
  <PropertyGroup Name="Game" Type="Scene" ID="4fc4c32a-56f2-4760-af69-7366e7ef97ab" Version="3.10.0.0" />
  <Content ctype="GameProjectContent">
    <Content>
      <Animation Duration="0" Speed="1.0000" />
      <ObjectData Name="Scene" Tag="7" ctype="GameNodeObjectData">
        <Size X="1280.0000" Y="720.0000" />
        <Children>
          <AbstractNodeData Name="bg" CanEdit="False" ActionTag="-548104689" Tag="32" IconVisible="False" PositionPercentXEnabled="True" VerticalEdge="BothEdge" RightMargin="1.7920" TopMargin="-0.0001" BottomMargin="0.0002" StretchWidthEnable="True" StretchHeightEnable="True" LeftEage="15" RightEage="15" TopEage="15" BottomEage="15" Scale9OriginX="15" Scale9OriginY="15" Scale9Width="1250" Scale9Height="690" ctype="ImageViewObjectData">
            <Size X="1278.2080" Y="719.9999" />
            <AnchorPoint />
            <Position Y="0.0002" />
            <Scale ScaleX="1.0000" ScaleY="1.0000" />
            <CColor A="255" R="255" G="255" B="255" />
            <PrePosition Y="0.0000" />
            <PreSize X="0.9986" Y="1.0000" />
            <FileData Type="Normal" Path="game/LongHuDou/images/hall/bg_game.png" Plist="" />
          </AbstractNodeData>
          <AbstractNodeData Name="levelText" ActionTag="-1575672361" Tag="213" IconVisible="False" PositionPercentXEnabled="True" LeftMargin="594.2120" RightMargin="554.7880" TopMargin="245.2245" BottomMargin="415.7755" FontSize="50" LabelText="LEVEL 1" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
            <Size X="131.0000" Y="59.0000" />
            <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
            <Position X="659.7120" Y="445.2755" />
            <Scale ScaleX="1.0000" ScaleY="1.0000" />
            <CColor A="255" R="0" G="0" B="0" />
            <PrePosition X="0.5154" Y="0.6184" />
            <PreSize X="0.1023" Y="0.0819" />
            <FontResource Type="Normal" Path="game/LongHuDou/images/font/fish.ttf" Plist="" />
            <OutlineColor A="255" R="255" G="0" B="0" />
            <ShadowColor A="255" R="110" G="110" B="110" />
          </AbstractNodeData>
          <AbstractNodeData Name="btnBooster" ActionTag="208608" VisibleForFrame="False" Tag="272" IconVisible="False" LeftMargin="536.4490" RightMargin="518.5510" TopMargin="652.6667" BottomMargin="-4.6667" TouchEnable="True" FontSize="30" ButtonText="Booster" LeftEage="15" RightEage="15" TopEage="11" BottomEage="11" Scale9OriginX="15" Scale9OriginY="11" Scale9Width="16" Scale9Height="14" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="ButtonObjectData">
            <Size X="225.0000" Y="72.0000" />
            <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
            <Position X="648.9490" Y="31.3333" />
            <Scale ScaleX="1.0000" ScaleY="1.0000" />
            <CColor A="255" R="255" G="255" B="255" />
            <PrePosition X="0.5070" Y="0.0435" />
            <PreSize X="0.1758" Y="0.1000" />
            <FontResource Type="Normal" Path="game/LongHuDou/images/font/fish.ttf" Plist="" />
            <TextColor A="255" R="0" G="0" B="0" />
            <NormalFileData Type="Default" Path="Default/Button_Normal.png" Plist="" />
            <OutlineColor A="255" R="255" G="0" B="0" />
            <ShadowColor A="255" R="110" G="110" B="110" />
          </AbstractNodeData>
          <AbstractNodeData Name="template" ActionTag="675876039" Tag="228" IconVisible="False" LeftMargin="-442.6552" RightMargin="1368.6553" TopMargin="120.5229" BottomMargin="233.4771" ClipAble="False" BackColorAlpha="102" ColorAngle="90.0000" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
            <Size X="354.0000" Y="366.0000" />
            <Children>
              <AbstractNodeData Name="hpBg" ActionTag="1909944388" Tag="205" IconVisible="False" LeftMargin="-31.9800" RightMargin="-27.0200" TopMargin="401.9971" BottomMargin="-74.9971" LeftEage="15" RightEage="15" TopEage="9" BottomEage="9" Scale9OriginX="15" Scale9OriginY="9" Scale9Width="383" Scale9Height="21" ctype="ImageViewObjectData">
                <Size X="413.0000" Y="39.0000" />
                <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                <Position X="174.5200" Y="-55.4971" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition X="0.4930" Y="-0.1516" />
                <PreSize X="1.1667" Y="0.1066" />
                <FileData Type="Normal" Path="game/LongHuDou/images/game/bloodBar.png" Plist="" />
              </AbstractNodeData>
              <AbstractNodeData Name="hp" ActionTag="1670023589" Tag="203" IconVisible="False" LeftMargin="-32.1823" RightMargin="-26.8177" TopMargin="401.9963" BottomMargin="-74.9963" ProgressInfo="100" ctype="LoadingBarObjectData">
                <Size X="413.0000" Y="39.0000" />
                <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                <Position X="174.3177" Y="-55.4963" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition X="0.4924" Y="-0.1516" />
                <PreSize X="1.1667" Y="0.1066" />
                <ImageFileData Type="Normal" Path="game/LongHuDou/images/game/lifebartiledelves.png" Plist="" />
              </AbstractNodeData>
              <AbstractNodeData Name="round" ActionTag="677451548" Tag="231" IconVisible="False" PercentWidthEnable="True" PercentHeightEnable="True" PercentWidthEnabled="True" PercentHeightEnabled="True" TouchEnable="True" ClipAble="False" BackColorAlpha="102" ComboBoxIndex="1" ColorAngle="90.0000" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
                <Size X="354.0000" Y="366.0000" />
                <AnchorPoint />
                <Position />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition />
                <PreSize X="1.0000" Y="1.0000" />
                <SingleColor A="255" R="128" G="0" B="128" />
                <FirstColor A="255" R="150" G="200" B="255" />
                <EndColor A="255" R="255" G="255" B="255" />
                <ColorVector ScaleY="1.0000" />
              </AbstractNodeData>
              <AbstractNodeData Name="bg" ActionTag="1929986042" Tag="195" IconVisible="False" PositionPercentXEnabled="True" PositionPercentYEnabled="True" LeftEage="85" RightEage="85" TopEage="71" BottomEage="71" Scale9OriginX="85" Scale9OriginY="71" Scale9Width="184" Scale9Height="224" ctype="ImageViewObjectData">
                <Size X="354.0000" Y="366.0000" />
                <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                <Position X="177.0000" Y="183.0000" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition X="0.5000" Y="0.5000" />
                <PreSize X="1.0000" Y="1.0000" />
                <FileData Type="Normal" Path="game/LongHuDou/images/game/VSDragon_long.png" Plist="" />
              </AbstractNodeData>
              <AbstractNodeData Name="shield" ActionTag="-1316644595" Tag="190" IconVisible="False" LeftMargin="395.0000" RightMargin="-51.0000" TopMargin="102.0000" BottomMargin="64.0000" TouchEnable="True" ClipAble="False" BackColorAlpha="102" ComboBoxIndex="1" ColorAngle="90.0000" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
                <Size X="10.0000" Y="200.0000" />
                <AnchorPoint />
                <Position X="395.0000" Y="64.0000" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition X="1.1158" Y="0.1749" />
                <PreSize X="0.0282" Y="0.5464" />
                <SingleColor A="255" R="255" G="165" B="0" />
                <FirstColor A="255" R="150" G="200" B="255" />
                <EndColor A="255" R="255" G="255" B="255" />
                <ColorVector ScaleY="1.0000" />
              </AbstractNodeData>
              <AbstractNodeData Name="killHp" ActionTag="1982082442" VisibleForFrame="False" Tag="296" IconVisible="False" LeftMargin="65.0784" RightMargin="152.9216" TopMargin="199.4720" BottomMargin="27.5280" LeftEage="44" RightEage="44" TopEage="45" BottomEage="45" Scale9OriginX="44" Scale9OriginY="45" Scale9Width="48" Scale9Height="49" ctype="ImageViewObjectData">
                <Size X="136.0000" Y="139.0000" />
                <AnchorPoint ScaleX="0.5466" ScaleY="0.6220" />
                <Position X="139.4160" Y="113.9860" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition X="0.3938" Y="0.3114" />
                <PreSize X="0.3842" Y="0.3798" />
                <FileData Type="Normal" Path="game/LongHuDou/images/game/knifeLight.png" Plist="" />
              </AbstractNodeData>
              <AbstractNodeData Name="weapon" ActionTag="890540338" Tag="222" IconVisible="False" LeftMargin="265.2690" RightMargin="-38.2690" TopMargin="146.2814" BottomMargin="96.7186" LeftEage="38" RightEage="38" TopEage="52" BottomEage="52" Scale9OriginX="38" Scale9OriginY="52" Scale9Width="51" Scale9Height="19" ctype="ImageViewObjectData">
                <Size X="127.0000" Y="123.0000" />
                <AnchorPoint ScaleX="1.0000" ScaleY="0.5000" />
                <Position X="392.2690" Y="158.2186" />
                <Scale ScaleX="0.3000" ScaleY="0.3000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition X="1.1081" Y="0.4323" />
                <PreSize X="0.3588" Y="0.3361" />
                <FileData Type="Normal" Path="game/LongHuDou/images/game/weaponLong.png" Plist="" />
              </AbstractNodeData>
              <AbstractNodeData Name="btnDefense" ActionTag="604807466" Tag="209" IconVisible="False" LeftMargin="192.2227" RightMargin="29.7773" TopMargin="463.3695" BottomMargin="-232.3695" TouchEnable="True" FontSize="30" LeftEage="15" RightEage="15" TopEage="11" BottomEage="11" Scale9OriginX="15" Scale9OriginY="11" Scale9Width="102" Scale9Height="113" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="ButtonObjectData">
                <Size X="132.0000" Y="135.0000" />
                <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                <Position X="258.2227" Y="-164.8695" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition X="0.7294" Y="-0.4505" />
                <PreSize X="0.3729" Y="0.3689" />
                <FontResource Type="Normal" Path="game/LongHuDou/images/font/fish.ttf" Plist="" />
                <TextColor A="255" R="0" G="0" B="0" />
                <DisabledFileData Type="Normal" Path="game/LongHuDou/images/game/btnDefenseEnabled.png" Plist="" />
                <NormalFileData Type="Normal" Path="game/LongHuDou/images/game/btnDefense.png" Plist="" />
                <OutlineColor A="255" R="255" G="0" B="0" />
                <ShadowColor A="255" R="110" G="110" B="110" />
              </AbstractNodeData>
              <AbstractNodeData Name="btnAttack" ActionTag="920408310" Tag="208" IconVisible="False" LeftMargin="3.4259" RightMargin="218.5741" TopMargin="463.3695" BottomMargin="-232.3695" TouchEnable="True" FontSize="30" LeftEage="15" RightEage="15" TopEage="11" BottomEage="11" Scale9OriginX="15" Scale9OriginY="11" Scale9Width="102" Scale9Height="113" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="ButtonObjectData">
                <Size X="132.0000" Y="135.0000" />
                <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                <Position X="69.4259" Y="-164.8695" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition X="0.1961" Y="-0.4505" />
                <PreSize X="0.3729" Y="0.3689" />
                <FontResource Type="Normal" Path="game/LongHuDou/images/font/fish.ttf" Plist="" />
                <TextColor A="255" R="0" G="0" B="0" />
                <DisabledFileData Type="Normal" Path="game/LongHuDou/images/game/btnAttackEnabled.png" Plist="" />
                <NormalFileData Type="Normal" Path="game/LongHuDou/images/game/btnAttack.png" Plist="" />
                <OutlineColor A="255" R="255" G="0" B="0" />
                <ShadowColor A="255" R="110" G="110" B="110" />
              </AbstractNodeData>
              <AbstractNodeData Name="yun" ActionTag="-122695356" VisibleForFrame="False" Tag="291" IconVisible="False" LeftMargin="131.5794" RightMargin="96.4206" TopMargin="-16.4231" BottomMargin="326.4231" LeftEage="41" RightEage="41" TopEage="17" BottomEage="17" Scale9OriginX="41" Scale9OriginY="17" Scale9Width="44" Scale9Height="22" ctype="ImageViewObjectData">
                <Size X="126.0000" Y="56.0000" />
                <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                <Position X="194.5794" Y="354.4231" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition X="0.5497" Y="0.9684" />
                <PreSize X="0.3559" Y="0.1530" />
                <FileData Type="Normal" Path="game/LongHuDou/images/game/yun1.png" Plist="" />
              </AbstractNodeData>
              <AbstractNodeData Name="time" ActionTag="-146266052" VisibleForFrame="False" Tag="191" IconVisible="False" LeftMargin="4.0000" RightMargin="322.0000" TopMargin="4.5000" BottomMargin="304.5000" FontSize="50" LabelText="2" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                <Size X="28.0000" Y="57.0000" />
                <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                <Position X="18.0000" Y="333.0000" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition X="0.0508" Y="0.9098" />
                <PreSize X="0.0791" Y="0.1557" />
                <OutlineColor A="255" R="255" G="0" B="0" />
                <ShadowColor A="255" R="110" G="110" B="110" />
              </AbstractNodeData>
              <AbstractNodeData Name="percent" ActionTag="-723972283" Tag="273" IconVisible="False" LeftMargin="141.0644" RightMargin="148.9356" TopMargin="370.3055" BottomMargin="-33.3055" FontSize="25" LabelText="100%" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                <Size X="64.0000" Y="29.0000" />
                <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                <Position X="173.0644" Y="-18.8055" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition X="0.4889" Y="-0.0514" />
                <PreSize X="0.1808" Y="0.0792" />
                <OutlineColor A="255" R="255" G="0" B="0" />
                <ShadowColor A="255" R="110" G="110" B="110" />
              </AbstractNodeData>
            </Children>
            <AnchorPoint />
            <Position X="-442.6552" Y="233.4771" />
            <Scale ScaleX="1.0000" ScaleY="1.0000" />
            <CColor A="255" R="255" G="255" B="255" />
            <PrePosition X="-0.3458" Y="0.3243" />
            <PreSize X="0.2766" Y="0.5083" />
            <SingleColor A="255" R="150" G="200" B="255" />
            <FirstColor A="255" R="150" G="200" B="255" />
            <EndColor A="255" R="255" G="255" B="255" />
            <ColorVector ScaleY="1.0000" />
          </AbstractNodeData>
          <AbstractNodeData Name="top" ActionTag="-1863340723" Tag="88" IconVisible="False" PercentWidthEnable="True" PercentWidthEnabled="True" LeftMargin="1.2001" RightMargin="-1.2001" TopMargin="26.1714" BottomMargin="593.8286" ClipAble="False" BackColorAlpha="102" ColorAngle="90.0000" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
            <Size X="1280.0000" Y="100.0000" />
            <Children>
              <AbstractNodeData Name="scoreText" ActionTag="-532005511" Tag="220" IconVisible="False" PositionPercentXEnabled="True" LeftMargin="58.3680" RightMargin="1102.6320" TopMargin="5.7501" BottomMargin="47.2499" FontSize="40" LabelText="SCORE:0" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                <Size X="119.0000" Y="47.0000" />
                <AnchorPoint ScaleY="0.5000" />
                <Position X="58.3680" Y="70.7499" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition X="0.0456" Y="0.7075" />
                <PreSize X="0.0930" Y="0.4700" />
                <FontResource Type="Normal" Path="game/LongHuDou/images/font/fish.ttf" Plist="" />
                <OutlineColor A="255" R="255" G="0" B="0" />
                <ShadowColor A="255" R="110" G="110" B="110" />
              </AbstractNodeData>
              <AbstractNodeData Name="btn_music" ActionTag="725497061" Tag="95" IconVisible="False" LeftMargin="967.2574" RightMargin="223.7426" TopMargin="4.2422" BottomMargin="-2.2422" TouchEnable="True" FontSize="14" LeftEage="15" RightEage="15" TopEage="11" BottomEage="11" Scale9OriginX="15" Scale9OriginY="11" Scale9Width="59" Scale9Height="76" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="ButtonObjectData">
                <Size X="89.0000" Y="98.0000" />
                <AnchorPoint ScaleX="0.4469" ScaleY="0.6446" />
                <Position X="1007.0315" Y="60.9286" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition X="0.7867" Y="0.6093" />
                <PreSize X="0.0695" Y="0.9800" />
                <TextColor A="255" R="65" G="65" B="70" />
                <NormalFileData Type="Normal" Path="game/LongHuDou/images/hall/but_on.png" Plist="" />
                <OutlineColor A="255" R="255" G="0" B="0" />
                <ShadowColor A="255" R="110" G="110" B="110" />
              </AbstractNodeData>
              <AbstractNodeData Name="btn_exit" ActionTag="588446723" Tag="97" IconVisible="False" LeftMargin="1095.5618" RightMargin="95.4382" TopMargin="2.2422" BottomMargin="-0.2422" TouchEnable="True" FontSize="14" LeftEage="15" RightEage="15" TopEage="11" BottomEage="11" Scale9OriginX="15" Scale9OriginY="11" Scale9Width="59" Scale9Height="76" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="ButtonObjectData">
                <Size X="89.0000" Y="98.0000" />
                <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                <Position X="1140.0618" Y="48.7578" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition X="0.8907" Y="0.4876" />
                <PreSize X="0.0695" Y="0.9800" />
                <TextColor A="255" R="65" G="65" B="70" />
                <NormalFileData Type="Normal" Path="game/LongHuDou/images/game/but_exit.png" Plist="" />
                <OutlineColor A="255" R="255" G="0" B="0" />
                <ShadowColor A="255" R="110" G="110" B="110" />
              </AbstractNodeData>
            </Children>
            <AnchorPoint />
            <Position X="1.2001" Y="593.8286" />
            <Scale ScaleX="1.0000" ScaleY="1.0000" />
            <CColor A="255" R="255" G="255" B="255" />
            <PrePosition X="0.0009" Y="0.8248" />
            <PreSize X="1.0000" Y="0.1389" />
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
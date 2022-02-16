<GameFile>
  <PropertyGroup Name="Game" Type="Scene" ID="674442f7-f8be-4149-995e-0e585da11129" Version="3.10.0.0" />
  <Content ctype="GameProjectContent">
    <Content>
      <Animation Duration="0" Speed="1.0000" />
      <ObjectData Name="Scene" Tag="7" ctype="GameNodeObjectData">
        <Size X="1280.0000" Y="720.0000" />
        <Children>
          <AbstractNodeData Name="bg" ActionTag="-548104689" Tag="32" IconVisible="False" PositionPercentXEnabled="True" VerticalEdge="BothEdge" StretchWidthEnable="True" StretchHeightEnable="True" LeftEage="15" RightEage="15" TopEage="15" BottomEage="15" Scale9OriginX="15" Scale9OriginY="15" Scale9Width="1250" Scale9Height="690" ctype="ImageViewObjectData">
            <Size X="1280.0000" Y="720.0000" />
            <AnchorPoint />
            <Position />
            <Scale ScaleX="1.0000" ScaleY="1.0000" />
            <CColor A="255" R="255" G="255" B="255" />
            <PrePosition />
            <PreSize X="1.0000" Y="1.0000" />
            <FileData Type="Normal" Path="game/GuardCastle/images/game/gamebg.png" Plist="" />
          </AbstractNodeData>
          <AbstractNodeData Name="timeText" ActionTag="734069900" VisibleForFrame="False" Tag="34" IconVisible="False" PositionPercentXEnabled="True" PositionPercentYEnabled="True" LeftMargin="501.4600" RightMargin="515.5400" TopMargin="11.4760" BottomMargin="629.5240" FontSize="60" LabelText="Time: 0" OutlineSize="2" OutlineEnabled="True" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
            <Size X="263.0000" Y="79.0000" />
            <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
            <Position X="632.9600" Y="669.0240" />
            <Scale ScaleX="1.0000" ScaleY="1.0000" />
            <CColor A="255" R="251" G="231" B="81" />
            <PrePosition X="0.4945" Y="0.9292" />
            <PreSize X="0.2055" Y="0.1097" />
            <FontResource Type="Normal" Path="game/GuardCastle/images/font/font.ttf" Plist="" />
            <OutlineColor A="255" R="71" G="34" B="14" />
            <ShadowColor A="255" R="110" G="110" B="110" />
          </AbstractNodeData>
          <AbstractNodeData Name="castle" ActionTag="-706500609" Tag="15" IconVisible="False" LeftMargin="360.5000" RightMargin="380.5000" TopMargin="66.4871" BottomMargin="144.5129" LeftEage="170" RightEage="170" TopEage="171" BottomEage="171" Scale9OriginX="170" Scale9OriginY="171" Scale9Width="199" Scale9Height="167" ctype="ImageViewObjectData">
            <Size X="539.0000" Y="509.0000" />
            <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
            <Position X="630.0000" Y="399.0129" />
            <Scale ScaleX="1.0000" ScaleY="1.0000" />
            <CColor A="255" R="255" G="255" B="255" />
            <PrePosition X="0.4922" Y="0.5542" />
            <PreSize X="0.4211" Y="0.7069" />
            <FileData Type="Normal" Path="game/GuardCastle/images/game/castle.png" Plist="" />
          </AbstractNodeData>
          <AbstractNodeData Name="smoke" ActionTag="2111069213" Tag="35" IconVisible="True" LeftMargin="615.0000" RightMargin="665.0000" TopMargin="484.0000" BottomMargin="236.0000" ctype="ParticleObjectData">
            <Size X="0.0000" Y="0.0000" />
            <AnchorPoint />
            <Position X="615.0000" Y="236.0000" />
            <Scale ScaleX="0.9000" ScaleY="0.9000" />
            <CColor A="255" R="255" G="255" B="255" />
            <PrePosition X="0.4805" Y="0.3278" />
            <PreSize X="0.0000" Y="0.0000" />
            <FileData Type="Normal" Path="game/GuardCastle/images/game/yanwu.plist" Plist="" />
            <BlendFunc Src="770" Dst="771" />
          </AbstractNodeData>
          <AbstractNodeData Name="btnPause" ActionTag="-306028553" Tag="112" IconVisible="False" LeftMargin="942.3983" RightMargin="257.6017" TopMargin="25.3130" BottomMargin="614.6870" TouchEnable="True" FontSize="14" LeftEage="15" RightEage="15" TopEage="11" BottomEage="11" Scale9OriginX="15" Scale9OriginY="11" Scale9Width="50" Scale9Height="58" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="ButtonObjectData">
            <Size X="80.0000" Y="80.0000" />
            <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
            <Position X="982.3983" Y="654.6870" />
            <Scale ScaleX="1.0000" ScaleY="1.0000" />
            <CColor A="255" R="255" G="255" B="255" />
            <PrePosition X="0.7675" Y="0.9093" />
            <PreSize X="0.0625" Y="0.1111" />
            <TextColor A="255" R="65" G="65" B="70" />
            <NormalFileData Type="Normal" Path="game/GuardCastle/images/game/btn/btnPause.png" Plist="" />
            <OutlineColor A="255" R="255" G="0" B="0" />
            <ShadowColor A="255" R="110" G="110" B="110" />
          </AbstractNodeData>
          <AbstractNodeData Name="btnKill" ActionTag="1882016124" Tag="36" IconVisible="False" LeftMargin="1033.7291" RightMargin="102.2709" TopMargin="385.3131" BottomMargin="190.6869" TouchEnable="True" FontSize="14" LeftEage="15" RightEage="15" TopEage="11" BottomEage="11" Scale9OriginX="15" Scale9OriginY="11" Scale9Width="114" Scale9Height="122" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="ButtonObjectData">
            <Size X="144.0000" Y="144.0000" />
            <Children>
              <AbstractNodeData Name="coolingTimeText" ActionTag="75866477" Tag="12" IconVisible="False" PositionPercentXEnabled="True" PositionPercentYEnabled="True" LeftMargin="44.5000" RightMargin="44.5000" TopMargin="46.0000" BottomMargin="46.0000" FontSize="40" LabelText="15" OutlineEnabled="True" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ShadowEnabled="True" ctype="TextObjectData">
                <Size X="55.0000" Y="52.0000" />
                <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                <Position X="72.0000" Y="72.0000" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="165" B="0" />
                <PrePosition X="0.5000" Y="0.5000" />
                <PreSize X="0.3819" Y="0.3611" />
                <FontResource Type="Normal" Path="game/GuardCastle/images/font/font.ttf" Plist="" />
                <OutlineColor A="255" R="238" G="169" B="144" />
                <ShadowColor A="255" R="110" G="110" B="110" />
              </AbstractNodeData>
            </Children>
            <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
            <Position X="1105.7291" Y="262.6869" />
            <Scale ScaleX="1.0000" ScaleY="1.0000" />
            <CColor A="255" R="255" G="255" B="255" />
            <PrePosition X="0.8639" Y="0.3648" />
            <PreSize X="0.1125" Y="0.2000" />
            <TextColor A="255" R="65" G="65" B="70" />
            <NormalFileData Type="Normal" Path="game/GuardCastle/images/game/skill-sheet0.png" Plist="" />
            <OutlineColor A="255" R="255" G="0" B="0" />
            <ShadowColor A="255" R="110" G="110" B="110" />
          </AbstractNodeData>
          <AbstractNodeData Name="hpbg" ActionTag="316861597" Tag="23" IconVisible="False" LeftMargin="447.0000" RightMargin="501.0000" TopMargin="566.0000" BottomMargin="104.0000" LeftEage="199" RightEage="199" TopEage="12" BottomEage="12" Scale9OriginX="133" Scale9OriginY="12" Scale9Width="66" Scale9Height="26" ctype="ImageViewObjectData">
            <Size X="332.0000" Y="50.0000" />
            <Children>
              <AbstractNodeData Name="hp" ActionTag="1289730215" Tag="24" IconVisible="False" PositionPercentXEnabled="True" PositionPercentYEnabled="True" LeftMargin="6.0000" RightMargin="6.0000" TopMargin="15.0000" BottomMargin="15.0000" ProgressInfo="100" ctype="LoadingBarObjectData">
                <Size X="320.0000" Y="20.0000" />
                <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                <Position X="166.0000" Y="25.0000" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition X="0.5000" Y="0.5000" />
                <PreSize X="0.9639" Y="0.4000" />
                <ImageFileData Type="Normal" Path="game/GuardCastle/images/game/res_1.png" Plist="" />
              </AbstractNodeData>
            </Children>
            <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
            <Position X="613.0000" Y="129.0000" />
            <Scale ScaleX="1.0000" ScaleY="1.0000" />
            <CColor A="255" R="255" G="255" B="255" />
            <PrePosition X="0.4789" Y="0.1792" />
            <PreSize X="0.2594" Y="0.0694" />
            <FileData Type="Normal" Path="game/GuardCastle/images/game/res_2.png" Plist="" />
          </AbstractNodeData>
          <AbstractNodeData Name="btnRule" ActionTag="880774268" Tag="33" IconVisible="False" LeftMargin="1048.6383" RightMargin="151.3617" TopMargin="25.3130" BottomMargin="614.6870" TouchEnable="True" FontSize="14" LeftEage="15" RightEage="15" TopEage="11" BottomEage="11" Scale9OriginX="15" Scale9OriginY="11" Scale9Width="50" Scale9Height="58" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="ButtonObjectData">
            <Size X="80.0000" Y="80.0000" />
            <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
            <Position X="1088.6383" Y="654.6870" />
            <Scale ScaleX="1.0000" ScaleY="1.0000" />
            <CColor A="255" R="255" G="255" B="255" />
            <PrePosition X="0.8505" Y="0.9093" />
            <PreSize X="0.0625" Y="0.1111" />
            <TextColor A="255" R="65" G="65" B="70" />
            <NormalFileData Type="Normal" Path="game/GuardCastle/images/game/btn/btnRule.png" Plist="" />
            <OutlineColor A="255" R="255" G="0" B="0" />
            <ShadowColor A="255" R="110" G="110" B="110" />
          </AbstractNodeData>
          <AbstractNodeData Name="musicBtn" ActionTag="-1700649286" Tag="34" IconVisible="False" LeftMargin="1154.8782" RightMargin="45.1218" TopMargin="25.3127" BottomMargin="614.6873" TouchEnable="True" FontSize="14" LeftEage="15" RightEage="15" TopEage="11" BottomEage="11" Scale9OriginX="15" Scale9OriginY="11" Scale9Width="50" Scale9Height="58" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="ButtonObjectData">
            <Size X="80.0000" Y="80.0000" />
            <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
            <Position X="1194.8782" Y="654.6873" />
            <Scale ScaleX="1.0000" ScaleY="1.0000" />
            <CColor A="255" R="255" G="255" B="255" />
            <PrePosition X="0.9335" Y="0.9093" />
            <PreSize X="0.0625" Y="0.1111" />
            <TextColor A="255" R="65" G="65" B="70" />
            <PressedFileData Type="Normal" Path="game/GuardCastle/images/hall/but_off.png" Plist="" />
            <NormalFileData Type="Normal" Path="game/GuardCastle/images/hall/but_on.png" Plist="" />
            <OutlineColor A="255" R="255" G="0" B="0" />
            <ShadowColor A="255" R="110" G="110" B="110" />
          </AbstractNodeData>
          <AbstractNodeData Name="btnBack" ActionTag="225588451" Tag="43" IconVisible="False" LeftMargin="836.1583" RightMargin="363.8417" TopMargin="29.0109" BottomMargin="610.9891" TouchEnable="True" FontSize="14" LeftEage="15" RightEage="15" TopEage="11" BottomEage="11" Scale9OriginX="15" Scale9OriginY="11" Scale9Width="50" Scale9Height="58" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="ButtonObjectData">
            <Size X="80.0000" Y="80.0000" />
            <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
            <Position X="876.1583" Y="650.9891" />
            <Scale ScaleX="1.0000" ScaleY="1.0000" />
            <CColor A="255" R="255" G="255" B="255" />
            <PrePosition X="0.6845" Y="0.9042" />
            <PreSize X="0.0625" Y="0.1111" />
            <TextColor A="255" R="65" G="65" B="70" />
            <NormalFileData Type="Normal" Path="game/GuardCastle/images/game/btn/btnBack.png" Plist="" />
            <OutlineColor A="255" R="255" G="0" B="0" />
            <ShadowColor A="255" R="110" G="110" B="110" />
          </AbstractNodeData>
          <AbstractNodeData Name="headImage" ActionTag="-997725762" Tag="62" IconVisible="False" LeftMargin="43.1185" RightMargin="1146.8815" TopMargin="32.2903" BottomMargin="597.7097" LeftEage="29" RightEage="29" TopEage="29" BottomEage="29" Scale9OriginX="29" Scale9OriginY="29" Scale9Width="32" Scale9Height="32" ctype="ImageViewObjectData">
            <Size X="90.0000" Y="90.0000" />
            <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
            <Position X="88.1185" Y="642.7097" />
            <Scale ScaleX="1.0000" ScaleY="1.0000" />
            <CColor A="255" R="255" G="255" B="255" />
            <PrePosition X="0.0688" Y="0.8927" />
            <PreSize X="0.0703" Y="0.1250" />
            <FileData Type="Normal" Path="game/GuardCastle/images/select/head_1.png" Plist="" />
          </AbstractNodeData>
          <AbstractNodeData Name="head" ActionTag="-1052927593" Tag="42" IconVisible="False" LeftMargin="32.2219" RightMargin="984.7781" TopMargin="18.4882" BottomMargin="583.5118" ctype="SpriteObjectData">
            <Size X="263.0000" Y="118.0000" />
            <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
            <Position X="163.7219" Y="642.5118" />
            <Scale ScaleX="1.0000" ScaleY="1.0000" />
            <CColor A="255" R="255" G="255" B="255" />
            <PrePosition X="0.1279" Y="0.8924" />
            <PreSize X="0.2055" Y="0.1639" />
            <FileData Type="Normal" Path="game/GuardCastle/images/game/head/head.png" Plist="" />
            <BlendFunc Src="1" Dst="771" />
          </AbstractNodeData>
          <AbstractNodeData Name="playerName" ActionTag="1112467835" Tag="70" IconVisible="False" LeftMargin="157.7248" RightMargin="1044.2751" TopMargin="77.0114" BottomMargin="611.9886" FontSize="25" LabelText="昊天锤" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
            <Size X="78.0000" Y="31.0000" />
            <AnchorPoint ScaleY="0.5000" />
            <Position X="157.7248" Y="627.4886" />
            <Scale ScaleX="1.0000" ScaleY="1.0000" />
            <CColor A="255" R="255" G="255" B="255" />
            <PrePosition X="0.1232" Y="0.8715" />
            <PreSize X="0.0609" Y="0.0431" />
            <FontResource Type="Normal" Path="game/GuardCastle/images/font/font.ttf" Plist="" />
            <OutlineColor A="255" R="255" G="0" B="0" />
            <ShadowColor A="255" R="110" G="110" B="110" />
          </AbstractNodeData>
          <AbstractNodeData Name="scoreText" ActionTag="50808356" Tag="34" IconVisible="False" LeftMargin="171.5276" RightMargin="1048.4724" TopMargin="652.3409" BottomMargin="27.6590" FontSize="30" LabelText="X 0" OutlineEnabled="True" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
            <Size X="60.0000" Y="40.0000" />
            <AnchorPoint ScaleY="0.5000" />
            <Position X="171.5276" Y="47.6590" />
            <Scale ScaleX="1.0000" ScaleY="1.0000" />
            <CColor A="255" R="251" G="231" B="81" />
            <PrePosition X="0.1340" Y="0.0662" />
            <PreSize X="0.0469" Y="0.0556" />
            <FontResource Type="Normal" Path="game/GuardCastle/images/font/font.ttf" Plist="" />
            <OutlineColor A="255" R="71" G="34" B="14" />
            <ShadowColor A="255" R="110" G="110" B="110" />
          </AbstractNodeData>
          <AbstractNodeData Name="btnKill2" ActionTag="1111501898" Tag="60" IconVisible="False" LeftMargin="926.3995" RightMargin="228.6005" TopMargin="527.3368" BottomMargin="67.6632" TouchEnable="True" FontSize="14" LeftEage="15" RightEage="15" TopEage="11" BottomEage="11" Scale9OriginX="15" Scale9OriginY="11" Scale9Width="95" Scale9Height="103" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="ButtonObjectData">
            <Size X="125.0000" Y="125.0000" />
            <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
            <Position X="988.8995" Y="130.1632" />
            <Scale ScaleX="1.0000" ScaleY="1.0000" />
            <CColor A="255" R="255" G="255" B="255" />
            <PrePosition X="0.7726" Y="0.1808" />
            <PreSize X="0.0977" Y="0.1736" />
            <TextColor A="255" R="65" G="65" B="70" />
            <NormalFileData Type="Normal" Path="game/GuardCastle/images/game/btnBigKill.png" Plist="" />
            <OutlineColor A="255" R="255" G="0" B="0" />
            <ShadowColor A="255" R="110" G="110" B="110" />
          </AbstractNodeData>
          <AbstractNodeData Name="shade" ActionTag="-983427248" VisibleForFrame="False" Tag="64" IconVisible="False" PositionPercentXEnabled="True" LeftMargin="140.0006" RightMargin="139.9994" TopMargin="143.4570" BottomMargin="496.5430" ClipAble="False" BackColorAlpha="102" ComboBoxIndex="1" ColorAngle="90.0000" ctype="PanelObjectData">
            <Size X="1000.0000" Y="80.0000" />
            <Children>
              <AbstractNodeData Name="text" ActionTag="1408987610" Tag="63" IconVisible="False" PositionPercentXEnabled="True" LeftMargin="87.6691" RightMargin="104.3309" TopMargin="18.3907" BottomMargin="19.6093" FontSize="30" LabelText="仙家，击杀妖魔数量达1000只方可获取【梵向真魔功】技能" OutlineSize="2" OutlineEnabled="True" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                <Size X="808.0000" Y="42.0000" />
                <AnchorPoint ScaleX="0.5103" ScaleY="0.5566" />
                <Position X="500.0000" Y="42.9866" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition X="0.5000" Y="0.5373" />
                <PreSize X="0.8080" Y="0.5250" />
                <FontResource Type="Normal" Path="game/GuardCastle/images/font/font.ttf" Plist="" />
                <OutlineColor A="255" R="0" G="0" B="0" />
                <ShadowColor A="255" R="110" G="110" B="110" />
              </AbstractNodeData>
            </Children>
            <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
            <Position X="640.0006" Y="536.5430" />
            <Scale ScaleX="1.0000" ScaleY="1.0000" />
            <CColor A="255" R="255" G="255" B="255" />
            <PrePosition X="0.5000" Y="0.7452" />
            <PreSize X="0.7813" Y="0.1111" />
            <SingleColor A="255" R="0" G="0" B="0" />
            <FirstColor A="255" R="150" G="200" B="255" />
            <EndColor A="255" R="255" G="255" B="255" />
            <ColorVector ScaleY="1.0000" />
          </AbstractNodeData>
          <AbstractNodeData Name="Image_8" ActionTag="435658543" Tag="69" IconVisible="False" LeftMargin="77.3252" RightMargin="1146.6748" TopMargin="638.2622" BottomMargin="25.7378" LeftEage="18" RightEage="18" TopEage="18" BottomEage="18" Scale9OriginX="18" Scale9OriginY="18" Scale9Width="20" Scale9Height="20" ctype="ImageViewObjectData">
            <Size X="56.0000" Y="56.0000" />
            <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
            <Position X="105.3252" Y="53.7378" />
            <Scale ScaleX="1.0000" ScaleY="1.0000" />
            <CColor A="255" R="255" G="255" B="255" />
            <PrePosition X="0.0823" Y="0.0746" />
            <PreSize X="0.0437" Y="0.0778" />
            <FileData Type="Normal" Path="game/GuardCastle/images/game/ghost.png" Plist="" />
          </AbstractNodeData>
        </Children>
      </ObjectData>
    </Content>
  </Content>
</GameFile>
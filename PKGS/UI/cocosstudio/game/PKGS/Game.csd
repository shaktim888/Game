<GameFile>
  <PropertyGroup Name="Game" Type="Scene" ID="315918b6-64a0-450f-b3c2-45cbceeef0f7" Version="3.10.0.0" />
  <Content ctype="GameProjectContent">
    <Content>
      <Animation Duration="0" Speed="1.0000" />
      <ObjectData Name="Scene" Tag="15" ctype="GameNodeObjectData">
        <Size X="960.0000" Y="640.0000" />
        <Children>
          <AbstractNodeData Name="bg" ActionTag="1159564519" Tag="7" IconVisible="False" RightMargin="240.0000" TopMargin="-640.0000" ctype="SpriteObjectData">
            <Size X="720.0000" Y="1280.0000" />
            <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
            <Position X="360.0000" Y="640.0000" />
            <Scale ScaleX="1.0000" ScaleY="1.0000" />
            <CColor A="255" R="255" G="255" B="255" />
            <PrePosition X="0.3750" Y="1.0000" />
            <PreSize X="0.7500" Y="2.0000" />
            <FileData Type="Normal" Path="game/PKGS/images/bj.png" Plist="" />
            <BlendFunc Src="1" Dst="771" />
          </AbstractNodeData>
          <AbstractNodeData Name="Image_1" ActionTag="-1132269103" Tag="10" IconVisible="False" LeftMargin="-85.0000" RightMargin="43.0000" TopMargin="-27.5000" BottomMargin="6.5000" LeftEage="330" RightEage="330" TopEage="218" BottomEage="218" Scale9OriginX="330" Scale9OriginY="218" Scale9Width="342" Scale9Height="225" ctype="ImageViewObjectData">
            <Size X="1002.0000" Y="661.0000" />
            <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
            <Position X="416.0000" Y="337.0000" />
            <Scale ScaleX="1.0000" ScaleY="1.0000" />
            <CColor A="255" R="255" G="255" B="255" />
            <PrePosition X="0.4333" Y="0.5266" />
            <PreSize X="1.0438" Y="1.0328" />
            <FileData Type="Normal" Path="game/PKGS/images/role.png" Plist="" />
          </AbstractNodeData>
          <AbstractNodeData Name="card" ActionTag="1038865159" Tag="8" IconVisible="False" LeftMargin="271.3693" RightMargin="510.6307" TopMargin="424.8279" BottomMargin="-12.8279" ctype="SpriteObjectData">
            <Size X="178.0000" Y="228.0000" />
            <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
            <Position X="360.3693" Y="101.1721" />
            <Scale ScaleX="0.5000" ScaleY="0.5000" />
            <CColor A="255" R="255" G="255" B="255" />
            <PrePosition X="0.3754" Y="0.1581" />
            <PreSize X="0.1854" Y="0.3562" />
            <FileData Type="Normal" Path="game/PKGS/images/card.png" Plist="" />
            <BlendFunc Src="1" Dst="771" />
          </AbstractNodeData>
          <AbstractNodeData Name="Panel_1" ActionTag="-1300526657" Tag="10" IconVisible="False" LeftMargin="-0.0001" RightMargin="240.0001" TopMargin="-640.0000" BottomMargin="1180.0000" TouchEnable="True" ClipAble="False" BackColorAlpha="102" ComboBoxIndex="1" ColorAngle="90.0000" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
            <Size X="720.0000" Y="100.0000" />
            <Children>
              <AbstractNodeData Name="textScore" ActionTag="-212912720" Tag="11" IconVisible="False" LeftMargin="299.1309" RightMargin="291.8691" TopMargin="26.6833" BottomMargin="30.3167" FontSize="36" LabelText="Score:0" ShadowOffsetX="1.0000" ShadowOffsetY="-1.0000" ShadowEnabled="True" ctype="TextObjectData">
                <Size X="129.0000" Y="43.0000" />
                <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                <Position X="363.6309" Y="51.8167" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition X="0.5050" Y="0.5182" />
                <PreSize X="0.1792" Y="0.4300" />
                <FontResource Type="Normal" Path="game/PKGS/font_pkgs.ttf" Plist="" />
                <OutlineColor A="255" R="255" G="0" B="0" />
                <ShadowColor A="255" R="136" G="134" B="134" />
              </AbstractNodeData>
              <AbstractNodeData Name="textTime" ActionTag="-1430791317" Tag="12" IconVisible="False" LeftMargin="49.9332" RightMargin="539.0668" TopMargin="34.6487" BottomMargin="22.3513" FontSize="36" LabelText="Time:60" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                <Size X="131.0000" Y="43.0000" />
                <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                <Position X="115.4332" Y="43.8513" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition X="0.1603" Y="0.4385" />
                <PreSize X="0.1819" Y="0.4300" />
                <FontResource Type="Normal" Path="game/PKGS/font_pkgs.ttf" Plist="" />
                <OutlineColor A="255" R="255" G="0" B="0" />
                <ShadowColor A="255" R="110" G="110" B="110" />
              </AbstractNodeData>
              <AbstractNodeData Name="hpBarBg" ActionTag="1231751376" Alpha="195" Tag="14" IconVisible="False" LeftMargin="64.0818" RightMargin="555.9182" TopMargin="38.3207" BottomMargin="31.6793" ProgressInfo="100" ctype="LoadingBarObjectData">
                <Size X="100.0000" Y="30.0000" />
                <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                <Position X="114.0818" Y="46.6793" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="142" G="0" B="0" />
                <PrePosition X="0.1584" Y="0.4668" />
                <PreSize X="0.1389" Y="0.3000" />
                <ImageFileData Type="Default" Path="Default/LoadingBarFile.png" Plist="" />
              </AbstractNodeData>
              <AbstractNodeData Name="hpBar" ActionTag="-2120541454" Alpha="195" Tag="13" IconVisible="False" LeftMargin="64.0818" RightMargin="555.9182" TopMargin="38.3207" BottomMargin="31.6793" ProgressInfo="60" ctype="LoadingBarObjectData">
                <Size X="100.0000" Y="30.0000" />
                <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                <Position X="114.0818" Y="46.6793" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="252" G="89" B="89" />
                <PrePosition X="0.1584" Y="0.4668" />
                <PreSize X="0.1389" Y="0.3000" />
                <ImageFileData Type="Default" Path="Default/LoadingBarFile.png" Plist="" />
              </AbstractNodeData>
            </Children>
            <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
            <Position X="359.9999" Y="1230.0000" />
            <Scale ScaleX="1.0000" ScaleY="1.0000" />
            <CColor A="255" R="255" G="255" B="255" />
            <PrePosition X="0.3750" Y="1.9219" />
            <PreSize X="0.7500" Y="0.1563" />
            <SingleColor A="255" R="150" G="200" B="255" />
            <FirstColor A="255" R="150" G="200" B="255" />
            <EndColor A="255" R="255" G="255" B="255" />
            <ColorVector ScaleY="1.0000" />
          </AbstractNodeData>
          <AbstractNodeData Name="butPause" ActionTag="-1554034977" Tag="26" IconVisible="False" LeftMargin="454.4526" RightMargin="231.5474" TopMargin="-624.5342" BottomMargin="1186.5342" TouchEnable="True" FontSize="50" ButtonText="Pause" Scale9Enable="True" LeftEage="15" RightEage="15" TopEage="11" BottomEage="11" Scale9OriginX="15" Scale9OriginY="11" Scale9Width="172" Scale9Height="50" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="ButtonObjectData">
            <Size X="274.0000" Y="78.0000" />
            <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
            <Position X="591.4526" Y="1225.5342" />
            <Scale ScaleX="0.7000" ScaleY="0.7000" />
            <CColor A="255" R="255" G="255" B="255" />
            <PrePosition X="0.6161" Y="1.9149" />
            <PreSize X="0.2854" Y="0.1219" />
            <FontResource Type="Normal" Path="game/PKGS/font_pkgs.ttf" Plist="" />
            <TextColor A="255" R="255" G="255" B="255" />
            <NormalFileData Type="Normal" Path="game/PKGS/images/btn.png" Plist="" />
            <OutlineColor A="255" R="255" G="0" B="0" />
            <ShadowColor A="255" R="110" G="110" B="110" />
          </AbstractNodeData>
        </Children>
      </ObjectData>
    </Content>
  </Content>
</GameFile>
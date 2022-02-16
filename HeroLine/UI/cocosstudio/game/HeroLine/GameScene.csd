<GameFile>
  <PropertyGroup Name="GameScene" Type="Scene" ID="4fc4c32a-56f2-4760-af69-7366e7ef97ab" Version="3.10.0.0" />
  <Content ctype="GameProjectContent">
    <Content>
      <Animation Duration="0" Speed="1.0000" />
      <ObjectData Name="Scene" Tag="7" ctype="GameNodeObjectData">
        <Size X="1280.0000" Y="720.0000" />
        <Children>
          <AbstractNodeData Name="gameBg" ActionTag="726934173" Tag="41" IconVisible="False" PositionPercentXEnabled="True" PositionPercentYEnabled="True" ctype="SpriteObjectData">
            <Size X="1280.0000" Y="720.0000" />
            <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
            <Position X="640.0000" Y="360.0000" />
            <Scale ScaleX="1.0000" ScaleY="1.0000" />
            <CColor A="255" R="255" G="255" B="255" />
            <PrePosition X="0.5000" Y="0.5000" />
            <PreSize X="1.0000" Y="1.0000" />
            <FileData Type="Normal" Path="game/HeroLine/image/bg.png" Plist="" />
            <BlendFunc Src="1" Dst="771" />
          </AbstractNodeData>
          <AbstractNodeData Name="linePool" ActionTag="-1261172273" Tag="12" IconVisible="False" PositionPercentXEnabled="True" PositionPercentYEnabled="True" ClipAble="False" BackColorAlpha="102" ColorAngle="90.0000" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
            <Size X="1280.0000" Y="720.0000" />
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
          <AbstractNodeData Name="peoplePool" ActionTag="444639890" Tag="10" IconVisible="False" PositionPercentXEnabled="True" PositionPercentYEnabled="True" ClipAble="False" BackColorAlpha="102" ColorAngle="90.0000" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
            <Size X="1280.0000" Y="720.0000" />
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
          <AbstractNodeData Name="returnBtn" ActionTag="-1395958356" Tag="45" IconVisible="False" LeftMargin="1162.2279" RightMargin="32.7721" TopMargin="6.0691" BottomMargin="628.9309" TouchEnable="True" FontSize="14" LeftEage="15" RightEage="15" TopEage="11" BottomEage="11" Scale9OriginX="15" Scale9OriginY="11" Scale9Width="55" Scale9Height="63" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="ButtonObjectData">
            <Size X="85.0000" Y="85.0000" />
            <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
            <Position X="1204.7279" Y="671.4309" />
            <Scale ScaleX="1.0000" ScaleY="1.0000" />
            <CColor A="255" R="255" G="255" B="255" />
            <PrePosition X="0.9412" Y="0.9325" />
            <PreSize X="0.0664" Y="0.1181" />
            <TextColor A="255" R="65" G="65" B="70" />
            <PressedFileData Type="Normal" Path="game/HeroLine/image/returnBtn.png" Plist="" />
            <NormalFileData Type="Normal" Path="game/HeroLine/image/returnBtn.png" Plist="" />
            <OutlineColor A="255" R="255" G="0" B="0" />
            <ShadowColor A="255" R="110" G="110" B="110" />
          </AbstractNodeData>
          <AbstractNodeData Name="scoreLabel" ActionTag="-266869747" Tag="18" IconVisible="False" LeftMargin="184.0000" RightMargin="924.0000" TopMargin="21.0000" BottomMargin="641.0000" FontSize="48" LabelText="分数：0" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
            <Size X="172.0000" Y="58.0000" />
            <AnchorPoint ScaleY="0.5000" />
            <Position X="184.0000" Y="670.0000" />
            <Scale ScaleX="1.0000" ScaleY="1.0000" />
            <CColor A="255" R="255" G="255" B="255" />
            <PrePosition X="0.1437" Y="0.9306" />
            <PreSize X="0.1344" Y="0.0806" />
            <FontResource Type="Normal" Path="game/HeroLine/image/nvpk.ttf" Plist="" />
            <OutlineColor A="255" R="255" G="0" B="0" />
            <ShadowColor A="255" R="110" G="110" B="110" />
          </AbstractNodeData>
          <AbstractNodeData Name="scoreLoadingBar" ActionTag="-518605187" Tag="50" IconVisible="False" LeftMargin="565.0000" RightMargin="215.0000" TopMargin="43.7170" BottomMargin="656.2830" ProgressInfo="0" ctype="LoadingBarObjectData">
            <Size X="500.0000" Y="20.0000" />
            <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
            <Position X="815.0000" Y="666.2830" />
            <Scale ScaleX="1.0000" ScaleY="1.0000" />
            <CColor A="255" R="255" G="255" B="0" />
            <PrePosition X="0.6367" Y="0.9254" />
            <PreSize X="0.3906" Y="0.0278" />
            <ImageFileData Type="Default" Path="Default/LoadingBarFile.png" Plist="" />
          </AbstractNodeData>
          <AbstractNodeData Name="scoreLoadingImage" ActionTag="934246196" Tag="49" IconVisible="False" LeftMargin="535.5000" RightMargin="185.5000" TopMargin="17.5000" BottomMargin="637.5000" LeftEage="276" RightEage="276" TopEage="32" BottomEage="32" Scale9OriginX="276" Scale9OriginY="32" Scale9Width="7" Scale9Height="1" ctype="ImageViewObjectData">
            <Size X="559.0000" Y="65.0000" />
            <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
            <Position X="815.0000" Y="670.0000" />
            <Scale ScaleX="1.0000" ScaleY="1.0000" />
            <CColor A="255" R="255" G="255" B="255" />
            <PrePosition X="0.6367" Y="0.9306" />
            <PreSize X="0.4367" Y="0.0903" />
            <FileData Type="Normal" Path="game/HeroLine/image/progressbar.png" Plist="" />
          </AbstractNodeData>
          <AbstractNodeData Name="timeLoadingBar" ActionTag="1426566458" Tag="52" RotationSkewX="-90.0000" RotationSkewY="-90.0000" IconVisible="False" LeftMargin="-123.4700" RightMargin="983.4700" TopMargin="364.0000" BottomMargin="284.0000" ProgressInfo="100" ctype="LoadingBarObjectData">
            <Size X="420.0000" Y="72.0000" />
            <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
            <Position X="86.5300" Y="320.0000" />
            <Scale ScaleX="1.0000" ScaleY="1.0000" />
            <CColor A="255" R="255" G="165" B="0" />
            <PrePosition X="0.0676" Y="0.4444" />
            <PreSize X="0.3281" Y="0.1000" />
            <ImageFileData Type="Default" Path="Default/LoadingBarFile.png" Plist="" />
          </AbstractNodeData>
          <AbstractNodeData Name="timeLoadingImage" ActionTag="-270447493" Tag="53" IconVisible="False" LeftMargin="28.5002" RightMargin="1152.4998" TopMargin="132.4999" BottomMargin="52.5001" LeftEage="32" RightEage="32" TopEage="176" BottomEage="176" Scale9OriginX="32" Scale9OriginY="176" Scale9Width="35" Scale9Height="183" ctype="ImageViewObjectData">
            <Size X="99.0000" Y="535.0000" />
            <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
            <Position X="78.0002" Y="320.0001" />
            <Scale ScaleX="1.0000" ScaleY="1.0000" />
            <CColor A="255" R="255" G="255" B="255" />
            <PrePosition X="0.0609" Y="0.4444" />
            <PreSize X="0.0773" Y="0.7431" />
            <FileData Type="Normal" Path="game/HeroLine/image/timebar.png" Plist="" />
          </AbstractNodeData>
          <AbstractNodeData Name="gameGradeLabel" ActionTag="-1938173190" Tag="11" IconVisible="False" LeftMargin="1046.4980" RightMargin="212.5020" TopMargin="25.0007" BottomMargin="636.9993" FontSize="48" LabelText="1" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
            <Size X="21.0000" Y="58.0000" />
            <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
            <Position X="1056.9980" Y="665.9993" />
            <Scale ScaleX="1.0000" ScaleY="1.0000" />
            <CColor A="255" R="255" G="255" B="255" />
            <PrePosition X="0.8258" Y="0.9250" />
            <PreSize X="0.0164" Y="0.0806" />
            <FontResource Type="Normal" Path="game/HeroLine/image/nvpk.ttf" Plist="" />
            <OutlineColor A="255" R="255" G="0" B="0" />
            <ShadowColor A="255" R="110" G="110" B="110" />
          </AbstractNodeData>
        </Children>
      </ObjectData>
    </Content>
  </Content>
</GameFile>
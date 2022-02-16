local terrain = class("terrain")

terrain.TerrainTypre = {
    Lawn = 0,                   --草地
    Land = 1,                   --土地
    Potion = 2,                 --药水
    Stab = 3,                   --地刺
    Tree = 4,                   --树木
    mapEnd = -1                 --终点
}

function terrain:ctor()
    self.terrainTypeLength = 0
    for k,v in pairs(terrain.TerrainTypre) do 
        self.terrainTypeLength = self.terrainTypeLength + 1
    end
end

--添加地图块
function terrain:createTerrain(isLast, index)
    local terrainType = math.floor(math.random(0, 100) % (self.terrainTypeLength - 1))
    if isLast then
        terrainType = terrain.TerrainTypre.mapEnd 
    end
    if index ~= nil then
        terrainType = index
    end
    local terrainSprite = ccui.ImageView:create()
    self:setTerrain(terrainSprite, terrainType)
    return terrainSprite
end

--更换地图块，index 固定用那个地图块
function terrain:replaceTerrain(terrainSprite, index)
    local childCount = terrainSprite:getChildren()
    if terrainSprite:getChildrenCount() >= 1 then
        for i = 1, #childCount do
            childCount[i]:removeFromParent()
        end
    end
    local terrainType = math.floor(math.random(0, 100) % (self.terrainTypeLength - 1))
    -- terrainType = terrain.TerrainTypre.mapEnd
    if index ~= nil then
        terrainType = index
    end
    self:setTerrain(terrainSprite, terrainType)
    return terrainSprite
end

--设置地图块
function terrain:setTerrain(terrainSprite, terrainTypre)
    if terrainTypre == terrain.TerrainTypre.Lawn then
        terrainSprite:loadTexture("game/MountaintopJumps/image/terrain/00.png", 0)
    elseif terrainTypre == terrain.TerrainTypre.Land then
        terrainSprite:loadTexture("game/MountaintopJumps/image/terrain/01.png", 0)
        local obstacleSprite = ccui.ImageView:create()
        obstacleSprite:loadTexture("game/MountaintopJumps/image/terrain/02.png", 0)
        obstacleSprite:setPosition(75 , 75)
        terrainSprite:addChild(obstacleSprite)
    elseif terrainTypre == terrain.TerrainTypre.Potion then
        terrainSprite:loadTexture("game/MountaintopJumps/image/terrain/00.png", 0)
        local obstacleSprite = ccui.ImageView:create()
        obstacleSprite:loadTexture("game/MountaintopJumps/image/props/01.png", 0)
        obstacleSprite:setPosition(75 , 95)
        obstacleSprite:setScale(0.5)
        terrainSprite:addChild(obstacleSprite)
    elseif terrainTypre == terrain.TerrainTypre.Stab then
        terrainSprite:loadTexture("game/MountaintopJumps/image/terrain/01.png", 0)
        local obstacleSprite = ccui.ImageView:create()
        obstacleSprite:loadTexture("game/MountaintopJumps/image/terrain/04.png", 0)
        obstacleSprite:setPosition(75 , 75)
        obstacleSprite:setScale(0.9)
        terrainSprite:addChild(obstacleSprite)
    elseif terrainTypre == terrain.TerrainTypre.Tree then
        terrainSprite:loadTexture("game/MountaintopJumps/image/terrain/00.png", 0)
        local obstacleSprite = ccui.ImageView:create()
        obstacleSprite:loadTexture("game/MountaintopJumps/image/terrain/03.png", 0)
        obstacleSprite:setPosition(75 , 120)
        terrainSprite:addChild(obstacleSprite)
    elseif terrainTypre == terrain.TerrainTypre.mapEnd then
        terrainSprite:loadTexture("game/MountaintopJumps/image/terrain/00.png", 0)
        local obstacleSprite = ccui.ImageView:create()
        obstacleSprite:loadTexture("game/MountaintopJumps/image/props/00.png", 0)
        obstacleSprite:setPosition(75 , 95)
        obstacleSprite:setScale(0.5)
        terrainSprite:addChild(obstacleSprite)
    end
    terrainSprite.type = terrainTypre
end

return terrain
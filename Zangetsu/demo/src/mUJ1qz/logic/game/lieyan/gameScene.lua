local GameScene = class("GameScene", cc.load("mvc").ModuleBase)

    --图片
    local image = {
        bgimage = "game/lieyan/image/bg.png",
        renwu   = "game/lieyan/image/renwu.png",
        zhuzi1   = "game/lieyan/image/zhuzi1.png",
        zhuzi2   = "game/lieyan/image/zhuzi2.png",
        quan    = "game/lieyan/image/quanquan.png",
        pi      = "game/lieyan/image/pi.png",
        shang   = "game/lieyan/image/shang.png",
        xia     = "game/lieyan/image/xia.png",
        texiao  = "game/lieyan/image/pengzhuang.mp3",
        ziti    = "game/lieyan/image/nvpk.ttf",  
    }
    --坐标
    local coor = {
        shangx = display.cx,
        shangy = display.top + 180,
        xiax   = display.cx,
        xiay   = display.bottom - 180,
    }


function GameScene:onCreate()
    self.idx      = 0
    self.jishu    = 1
    self.zhuzi1   = {}
    self.zhuzi2   = {}
    self.fenshu   = 0              --得分
    self.time     = 80             --柱子产生的速度
    self.sudo     = 300            --柱子移动的速度
    self.click    = false          --是否点击屏幕
    self.touch    = false          --是否碰撞
    self.a        = false          --判断得分

    --创建背景图片
    self.bg = cc.Sprite:create(image.bgimage)
    self.bg:setPosition(display.center)
    self.bg:addTo(self)

    --人物
    self.ren = cc.Sprite:create(image.renwu)
        self.ren:setPosition(display.center)
        self.ren:addTo(self)
    self.renSize  = self.ren:getBoundingBox()
    --容器
    self.panel  = ccui.Layout:create()        
    self.panel:setPosition(0.0000, 0.0000)
    self.panel:setSize({width = 1280.0000, height = 720.0000})
    self.panel:addTo(self)

    --得分
    self.score = cc.Label:createWithTTF(self.fenshu,image.ziti,80)
        :setColor(ccc3(0,0,0))
        :setPosition(1100,620)
        :addTo(self)

    math.randomseed(os.time())     --随机数因子
    self:onUpdate(handler(self,self.update))   
    self:onRenwu()
    self:onZhuzi()
    -- self.onDefen()
end

function GameScene:update(dt)
    self.jishu = self.jishu + 1
    if self.jishu > self.time and not self.touch then
        self.jishu = 1
        self:onZhuzi()
    end
    self:onJump(dt)
    if not self.touch then
        self:onPeng(dt)
        self:yidong(dt)
    end
end

function GameScene:onRenwu()
    local function onTouchBegan(touch,event)
        if not self.touch then
            self.click = true
        end
        return true
    end
    local function onTouchMoved(touch,event)
    end
    local function onTouchEnded(touch,event)
        self.click = false
    end
    local listener = cc.EventListenerTouchOneByOne:create() -- 创建一个事件监听器
    listener:setSwallowTouches(true)
    listener:registerScriptHandler(onTouchBegan, cc.Handler.EVENT_TOUCH_BEGAN)
    listener:registerScriptHandler(onTouchMoved, cc.Handler.EVENT_TOUCH_MOVED)
    listener:registerScriptHandler(onTouchEnded, cc.Handler.EVENT_TOUCH_ENDED)
    local eventDispatcher = self:getEventDispatcher()
    eventDispatcher:addEventListenerWithSceneGraphPriority(listener,self)
end

function GameScene:onPeng(dt)
    local renBox      = self.ren:getBoundingBox()
    local zhuzi1Box   = self.zhuzi1[1]:getBoundingBox()
    local zhuzi2Box   = self.zhuzi2[1]:getBoundingBox()
    local zhuzi       = self.panel:getChildren() 
    self.x1 ,self.y1  = self.ren:getPosition()
    for i, v in ipairs(zhuzi) do 
        local zhuziBox = v:getBoundingBox()
        if (cc.rectIntersectsRect(zhuziBox,renBox)) or self.y1 < display.bottom then  --检测是否碰撞
            cc.SimpleAudioEngine:getInstance():playMusic(image.texiao,false)
            --产生特效
            self.zx , self.zy = v:getPosition()     
            local renS = self.ren:getBoundingBox()
            local renPX , renPY = self.ren:getPosition()
            local zzS  = self.zhuzi1[1]:getBoundingBox()
            if renPX > self.zx then
                self.quan_x = renPX - renS.width/2
            end
            if renPX < self.zx then
                self.quan_x = renPX + renS.width/2
            end
            if renPY > self.zy then
                self.quan_y = renPY - renS.height/2
            end
            if renPY < self.zy then
                self.quan_y = renPY + renS.height/2
            end
            self.quan = cc.Sprite:create(image.quan)
            self.quan:setPosition(self.quan_x , self.quan_y)
            self.quan:addTo(self)
            self.quan:runAction(cc.ScaleTo:create(0.5,1))
            self.quan:runAction(cc.FadeOut:create(0.5))
            self.touch = true
            --屏幕抖动
            local run1 = cc.MoveBy:create(0.05,cc.p(10,0))
            local run2 = cc.MoveBy:create(0.05,cc.p(-10,0))
            local run3 = cc.MoveBy:create(0.05,cc.p(0,10))
            local run4 = cc.MoveBy:create(0.05,cc.p(0,-10))
            self:runAction(cc.Sequence:create(run1,run2,run3,run4))

            --进入结束界面
            global.countDown.createTimer("time", 0.4 )
            local node = cc.Node:create()
            node:addTo(self)
            performWithDelay(node,function()
                self:onJieShu()
                end,0.4)
        end
    end
end

function GameScene:onJump(dt)
    self.ren_x ,self.ren_y = self.ren:getPosition()
    if self.click then
        self:onPi()
        self.ren_y = self.ren_y + dt * 400
        self.ren:setPosition(self.ren_x,self.ren_y)
    end
    if not self.click then
        self.ren_y = self.ren_y - dt * 300
        self.ren:setPosition(self.ren_x,self.ren_y)
    end
end

function GameScene:onZhuzi()
    self.idx  = self.idx + 1
    if self.idx > 2 then
        self.fenshu = self.idx - 2
        self.score:setString(self.fenshu)
    end
    local zhuzi_y = math.random(-50 , 150)
    self.zhuzi1[self.idx] = cc.Sprite:create(image.zhuzi1)
    self.zhuzi1[self.idx]:addTo(self.panel)
    self.zhuziSize = self.zhuzi1[self.idx]:getBoundingBox()
    self.zhuzi1[self.idx].ChushiPox = display.width + self.zhuziSize.width/2
    self.zhuzi1[self.idx].ChushiPoy = zhuzi_y
    self.zhuzi1[self.idx]:setPosition(self.zhuzi1[self.idx].ChushiPox ,self.zhuzi1[self.idx].ChushiPoy)
    self.zhuzi2[self.idx] = cc.Sprite:create(image.zhuzi2)
    self.zhuzi2[self.idx]:addTo(self.panel)
    self.zhuzi2[self.idx].ChushiPox = display.width + self.zhuziSize.width/2
    self.zhuzi2[self.idx].ChushiPoy = zhuzi_y + self.renSize.height * 2.5 + self.zhuziSize.height
    self.zhuzi2[self.idx]:setPosition(self.zhuzi2[self.idx].ChushiPox ,self.zhuzi2[self.idx].ChushiPoy)
end

function GameScene:yidong(dt)
    for i = 1, self.idx do
        if(self.zhuzi1[i]) and self.zhuzi1[i].ChushiPox then
            self.zhuzi1[i].ChushiPox = self.zhuzi1[i].ChushiPox - self.sudo * dt
            self.zhuzi1[i]:setPosition(self.zhuzi1[i].ChushiPox ,self.zhuzi1[i].ChushiPoy)
        end
        if(self.zhuzi2[i]) and self.zhuzi2[i].ChushiPox then
            self.zhuzi2[i].ChushiPox = self.zhuzi2[i].ChushiPox - self.sudo * dt
            self.zhuzi2[i]:setPosition(self.zhuzi2[i].ChushiPox ,self.zhuzi2[i].ChushiPoy)
        end
    end
end

function GameScene:onJieShu()
    local time = 0.5
    local shang = cc.Sprite:create(image.shang)
    shang:setPosition(coor.shangx,coor.shangy)
    shang:addTo(self,2)

    local xia = cc.Sprite:create(image.xia)
        xia:setPosition(coor.xiax,coor.xiay)
        xia:addTo(self,2)

    shang:runAction(cc.MoveTo:create(0.4,cc.p(coor.shangx,display.top - 180)))
    xia:runAction(cc.MoveTo:create(0.4,cc.p(coor.xiax,display.bottom + 180)))
                

    global.countDown.createTimer("time",time )
    local node = cc.Node:create()
    node:addTo(self)
    performWithDelay(node,function()
    CCDirector.sharedDirector():resume()
    require("logic.game.lieyan.mainScene").new():showWithScene()
        end,time + 0.1)


end

function GameScene:onPi()
    self.pi = cc.Sprite:create(image.pi)
        self.pi:setPosition(self.ren_x , self.ren_y - self.renSize.height/2)
        self.pi:addTo(self)
    self.pi:runAction(cc.RotateBy:create(0.4,360))
    self.pi:runAction(cc.FadeOut:create(0.4))
    self.pi:runAction(cc.ScaleTo:create(0.4,0.5))
    self.pi:runAction(cc.JumpBy:create(0.4,cc.p(-100,150),-30,1))

end
return GameScene

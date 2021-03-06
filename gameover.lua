local composer = require( "composer" )
local scene = composer.newScene()

local physics = require("physics")
physics.start()

deathmusic = audio.loadSound( "soundtrack/death.wav" )
audio.play( deathmusic, {channel=2, loops=-1} )

local function gotoMenu()
    display.remove(scoreText)
    composer.gotoScene( "mainmenu", { time=150, effect="crossFade"} )
    audio.stop(2)
    audio.play( menumusic, {channel=1, loops=-1} )
end

-- funções do composer --
composer.recycleOnSceneChange = true;
function scene:create ( event )
    sceneGroup = self.view
    background = display.newImageRect( "Sprites/gameover.png", 570, 320)
    background.x = display.contentCenterX
    background.y = display.contentCenterY

    -- botão para voltar --
    back = display.newRect( 470, 290, 100, 40 )
    back.alpha = 0.01

    sceneGroup:insert(background)
    sceneGroup:insert(back)
end

function scene:show( event )
    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        back:addEventListener( "tap", gotoMenu )
    elseif ( phase == "did" ) then
    end
end

function scene:hide( event )
    local sceneGroup = self.view
    local phase = event.phase
    if ( phase == "will" ) then
    elseif ( phase == "did" ) then
    end
end

function scene:destroy( event )
    local sceneGroup = self.view
end
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
return scene
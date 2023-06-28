local icon =  "Default" --// Default, Scale Verticle, Default V2

function onCreate()
    makeLuaSprite('iconP1obj', 'iconobj', 0, 0)
    makeLuaSprite('iconP2obj', 'iconobj', 0, 0) 
end
    
function onUpdatePost(elapsed)
    setProperty('iconP1.scale.x', getProperty('iconP1obj.scale.x'))
    setProperty('iconP2.scale.x', getProperty('iconP2obj.scale.x'))
    setProperty('iconP1.scale.y', getProperty('iconP1obj.scale.y'))
    setProperty('iconP2.scale.y', getProperty('iconP2obj.scale.y'))
end

function onBeatHit()
    local dance = true
    if curBeat % 2 == 0 then
        dance = false
    end
    if icon == "Scale Verticle" then
        if dance then
            scaleObject('iconP1obj', 1, 0.4)
            scaleObject('iconP2obj', 1, 1.5)
            setProperty('iconP1.y', getProperty('iconP1.y') - 20)
            setProperty('iconP2.y', getProperty('iconP2.y') + 20)
            doTweenY('icon1', 'iconP1', getProperty('iconP1.y') + 20, crochet / 1000, 'circOut')
            doTweenY('icon2', 'iconP2', getProperty('iconP2.y') - 20, crochet / 1000, 'circOut')
        else
            scaleObject('iconP1obj', 1, 1.5)
            scaleObject('iconP2obj', 1, 0.4)
            setProperty('iconP1.y', getProperty('iconP1.y') + 20)
            setProperty('iconP2.y', getProperty('iconP2.y') - 20)
            doTweenY('icon1', 'iconP1', getProperty('iconP1.y') - 20, crochet / 1000, 'circOut')
            doTweenY('icon2', 'iconP2', getProperty('iconP2.y') + 20, crochet / 1000, 'circOut')
        end
        doTweenY('iconScale1', 'iconP1obj.scale', 1, crochet / 1000, 'circOut')
        doTweenY('iconScale2', 'iconP2obj.scale', 1, crochet / 1000, 'circOut')
    end
    if icon == "Default V2" then
        local turn = 20 
        if curBeat % 2 == 0 then
            turn = -20
        end
        setProperty('iconP1.angle', turn)
        setProperty('iconP2.angle', -turn)
        doTweenAngle('icon1e', 'iconP1', 0, crochet / 1000, 'circOut')
        doTweenAngle('icon2e', 'iconP2', 0, crochet / 1000, 'circOut')
    end
end
local icon =  "Default" --// Default, Scale Verticle, Scale Horizontal, Scale Diangle

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
            setProperty('iconP1.y', getProperty('iconP1.y') - 40)
            setProperty('iconP2.y', getProperty('iconP2.y') + 40)
            doTweenY('icon1', 'iconP1', getProperty('iconP1.y') + 40, crochet / 1300, 'circOut')
            doTweenY('icon2', 'iconP2', getProperty('iconP2.y') - 40, crochet / 1300, 'circOut')
        else
            scaleObject('iconP1obj', 1, 1.5)
            scaleObject('iconP2obj', 1, 0.4)
            setProperty('iconP1.y', getProperty('iconP1.y') + 40)
            setProperty('iconP2.y', getProperty('iconP2.y') - 40)
            doTweenY('icon11', 'iconP1', getProperty('iconP1.y') - 40, crochet / 1300, 'circOut')
            doTweenY('icon22', 'iconP2', getProperty('iconP2.y') + 40, crochet / 1300, 'circOut')
        end
        doTweenY('iconScale1', 'iconP1obj.scale', 1, crochet / 1300, 'circOut')
        doTweenY('iconScale2', 'iconP2obj.scale', 1, crochet / 1300, 'circOut')
    end
    if icon == "Scale Horizontal" then
        if dance then
            scaleObject('iconP1obj', 0.4, 1)
            scaleObject('iconP2obj', 1.5, 1)
            setProperty('iconP1.y', getProperty('iconP1.x') - 40)
            setProperty('iconP2.y', getProperty('iconP2.x') + 40)
            doTweenX('icon12', 'iconP1', getProperty('iconP1.x') + 40, crochet / 1300, 'circOut')
            doTweenX('icon21', 'iconP2', getProperty('iconP2.x') - 40, crochet / 1300, 'circOut')
        else
            scaleObject('iconP1obj', 1.5, 1)
            scaleObject('iconP2obj', 0.4, 1)
            setProperty('iconP1.x', getProperty('iconP1.x') + 40)
            setProperty('iconP2.x', getProperty('iconP2.x') - 40)
            doTweenX('icon14', 'iconP1', getProperty('iconP1.x') - 40, crochet / 1300, 'circOut')
            doTweenX('icon24', 'iconP2', getProperty('iconP2.x') + 40, crochet / 1300, 'circOut')
        end
        doTweenX('iconScale1', 'iconP1obj.scale', 1, crochet / 1300, 'circOut')
        doTweenX('iconScale2', 'iconP2obj.scale', 1, crochet / 1300, 'circOut')
    end
    if icon == "Scale Diangle" then
        if dance then
            scaleObject('iconP1obj', 1, 0.2)
            scaleObject('iconP2obj', 1, 1.9)
            setProperty('iconP1.y', getProperty('iconP1.y') - 40)
            setProperty('iconP2.y', getProperty('iconP2.y') + 40)
            setProperty('iconP1.angle', 50)
            setProperty('iconP2.angle', -50)
            doTweenY('icon15', 'iconP1', getProperty('iconP1.y') + 40, crochet / 1300, 'circOut')
            doTweenY('icon26', 'iconP2', getProperty('iconP2.y') - 40, crochet / 1300, 'circOut')
        else
            scaleObject('iconP1obj', 1, 1.9)
            scaleObject('iconP2obj', 1, 0.2)
            setProperty('iconP1.angle', -50)
            setProperty('iconP2.angle', 50)
            setProperty('iconP1.y', getProperty('iconP1.y') + 40)
            setProperty('iconP2.y', getProperty('iconP2.y') - 40)
            doTweenY('icon13', 'iconP1', getProperty('iconP1.y') - 40, crochet / 1300, 'circOut')
            doTweenY('icon27', 'iconP2', getProperty('iconP2.y') + 40, crochet / 1300, 'circOut')
        end
        doTweenY('iconScale1', 'iconP1obj.scale', 1, crochet / 1300, 'circOut')
        doTweenY('iconScale2', 'iconP2obj.scale', 1, crochet / 1300, 'circOut')
        doTweenAngle('iconTween1','iconP1', 0, crochet / 1300,'circOut')
        doTweenAngle('iconTween2','iconP2', 0, crochet / 1300,'circOut')
    end
end
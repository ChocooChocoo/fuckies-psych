--[[
    Tutorial:
    all you need to know is Dad and BF is just the zoom values, if you dont want a zoom keep the values at the same number
]]

local d = { --// edit \\
    dad = 1,
    bf = 1.2
}

--// stop \\
local camMoving = false
function onCreatePost()
    makeLuaSprite("cam", nil, 300,300)
    makeGraphic("cam", 69, 69, "0xFFFF0000")
    setScrollFactor("cam", 1, 1)
    setProperty("cam.alpha", 0)
    addLuaSprite("cam", true)

    setProperty("cameraSpeed", 0.5)
end
function onUpdatePost(elapsed)
    if mustHitSection then
        camTweenin(getMidpointX("boyfriend") - 100, getMidpointY("boyfriend") - 100, d.bf)
    else
        camTweenin(getMidpointX("dad") + 150, getMidpointY("dad") - 100, d.dad)
    end
end
function camTweenin(xx, yy, scale)
    setProperty("camFollow.x", getProperty("cam.x"))
    setProperty("camFollow.y", getProperty("cam.y"))
    setProperty("defaultCamZoom", getProperty("cam.scale.x"))
    if not camMoving then
        camMoving = true
        doTweenX("camX", "cam", xx, stepCrochet * 0.004 * playbackRate, "sineIn")
        doTweenY("camY", "cam", yy, stepCrochet * 0.004 * playbackRate, "sineIn")
        doTweenX("camS", "cam.scale", scale, stepCrochet * 0.004 * playbackRate, "sineInOut")
    end
end
function onTweenCompleted(tag)
    if tag == "camX" then
        cancelTween("camX")
        camMoving = false
    end
    if tag == "camY" then
        cancelTween("camY")
        camMoving = false
    end
    if tag == "camS" then
        cancelTween("camS")
    end
end
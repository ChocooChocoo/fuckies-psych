local settings = {
    enable = true, --// should this be enabled, default to true
    dad = 40, --// intensity for dad camera, default to 40
    boyfriend = 40, --// intensity for bf camera, default to 40
    girlfriend = 40 --// intensity for bf camera, default to 40
}

--// don't edit this if you don't know what your doing.
local camFollowX = 0
local camFollowY = 0
local curSection = "dad"

function camSet(x,y)
    setProperty("camFollow.x", x)
    setProperty("camFollow.y", y)
end
function onMoveCamera(character)
    if character == "dad" then
        curSection = "dad"
    end
    if character == "boyfriend" or character == "bf" then
        curSection = "boyfriend"
    end
    if character == "gf" or character == "girlfriend" then
        curSection = "gf"
    end
end
function onUpdate(elapsed)
    if settings.enable then
        if curSection == "dad" then
            camFollowX = getMidpointX("dad")
            camFollowY = getMidpointY("dad")
            if getProperty("dad.animation.curAnim.name") == "singLEFT" then
                camFollowX = camFollowX - settings.dad
            end
            if getProperty("dad.animation.curAnim.name") == "singRIGHT" then
                camFollowX = camFollowX + settings.dad
            end
            if getProperty("dad.animation.curAnim.name") == "singUP" then
                camFollowY = camFollowY - settings.dad
            end
            if getProperty("dad.animation.curAnim.name") == "singDOWN" then
                camFollowY = camFollowY + settings.dad
            end
            camSet(camFollowX + 150,camFollowY - 100)
        end
        if curSection == "boyfriend" then
            camFollowX = getMidpointX("boyfriend")
            camFollowY = getMidpointY("boyfriend")
            if getProperty("boyfriend.animation.curAnim.name") == "singLEFT" then
                camFollowX = camFollowX - settings.boyfriend
            end
            if getProperty("boyfriend.animation.curAnim.name") == "singRIGHT" then
                camFollowX = camFollowX + settings.boyfriend
            end
            if getProperty("boyfriend.animation.curAnim.name") == "singUP" then
                camFollowY = camFollowY - settings.boyfriend
            end
            if getProperty("boyfriend.animation.curAnim.name") == "singDOWN" then
                camFollowY = camFollowY + settings.boyfriend
            end
            camSet(camFollowX - 100,camFollowY - 100)
        end
        if curSection == "gf" then
            camFollowX = getMidpointX("gf")
            camFollowY = getMidpointY("gf")
            if getProperty("gf.animation.curAnim.name") == "singLEFT" then
                camFollowX = camFollowX - settings.girlfriend
            end
            if getProperty("gf.animation.curAnim.name") == "singRIGHT" then
                camFollowX = camFollowX + settings.girlfriend
            end
            if getProperty("gf.animation.curAnim.name") == "singUP" then
                camFollowY = camFollowY - settings.girlfriend
            end
            if getProperty("gf.animation.curAnim.name") == "singDOWN" then
                camFollowY = camFollowY + settings.girlfriend
            end
            camSet(camFollowX,camFollowY - 20)
        end 
    end
end
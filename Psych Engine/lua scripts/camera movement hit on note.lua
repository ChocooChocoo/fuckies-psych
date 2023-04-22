--//only edit this.
local settings = {
    enable = true, --// should this be enabled, default to true
    dad = 40, --// intensity for dad camera, default to 40
    boyfriend = 40, --// intensity for bf camera, default to 40
    gf = 40, --// intensity for gf camera, default to 40
    idleAnims = {'idle', 'danceLeft', 'danceRight', 'hey'} --// what to reset the camera value
}

--// don't edit this if you don't know what your doing.
local camOriginD = {0,0}
local camOriginB = {0,0}
local camOriginG = {0,0}

function onMoveCamera(target)
    if settings.enable then
        if target == "dad" then
            camOriginD = {runHaxeCode([[game.dad.getMidpoint().x]]) + 150, runHaxeCode([[game.dad.getMidpoint().y]]) - 100}
            camOriginD[1] = camOriginD[1] - runHaxeCode([[ game.dad.cameraPosition[0] ]]) - runHaxeCode([[ game.dad.cameraPosition[1] ]])
            camOriginD[2] = camOriginD[2] + runHaxeCode([[ game.dad.cameraPosition[1] ]]) + runHaxeCode([[ game.dad.cameraPosition[1] ]])
            setProperty('camFollow.x', camOriginD[1])
            setProperty('camFollow.y', camOriginD[2])
        end
        if target == "boyfriend" then
            camOriginB = {runHaxeCode([[game.boyfriend.getMidpoint().x]]) - 100, runHaxeCode([[game.boyfriend.getMidpoint().y]]) - 100}
            camOriginB[1] = camOriginB[1] - runHaxeCode([[ game.boyfriend.cameraPosition[0] ]]) - runHaxeCode([[ game.boyfriend.cameraPosition[0] ]])
            camOriginB[2] = camOriginB[2] + runHaxeCode([[ game.boyfriend.cameraPosition[1] ]]) + runHaxeCode([[ game.boyfriend.cameraPosition[1] ]])
            setProperty('camFollow.x', camOriginB[1])
            setProperty('camFollow.y', camOriginB[2])
        end
        if target == "gf" then
            camOriginG = {runHaxeCode([[game.gf.getMidpoint().x]]), runHaxeCode([[game.gf.getMidpoint().y]])}
            camOriginG[1] = camOriginG[1] - runHaxeCode([[ game.gf.cameraPosition[0] ]]) - runHaxeCode([[ game.gf.cameraPosition[1] ]])
            camOriginG[2] = camOriginG[2] + runHaxeCode([[ game.gf.cameraPosition[1] ]]) + runHaxeCode([[ game.gf.cameraPosition[1] ]])
            setProperty('camFollow.x', camOriginG[1])
            setProperty('camFollow.y', camOriginG[2])
        end
    end
end

function opponentNoteHit(id, noteData, noteType, isSustainNote)
    if settings.enable then
        if not gfSection then
            if noteData == 0 then
                setProperty('camFollow.x', camOriginD[1] - settings.dad)
                setProperty('camFollow.y', camOriginD[2])
            end
            if noteData == 1 then
                setProperty('camFollow.x', camOriginD[1])
                setProperty('camFollow.y', camOriginD[2] + settings.dad)
            end
            if noteData == 2 then
                setProperty('camFollow.x', camOriginD[1])
                setProperty('camFollow.y', camOriginD[2] - settings.dad)
            end
            if noteData == 3 then
                setProperty('camFollow.x', camOriginD[1] + settings.dad)
                setProperty('camFollow.y', camOriginD[2])
            end
        else
            if noteData == 0 then
                setProperty('camFollow.x', camOriginG[1] - settings.gf)
                setProperty('camFollow.y', camOriginG[2])
            end
            if noteData == 1 then
                setProperty('camFollow.x', camOriginG[1])
                setProperty('camFollow.y', camOriginG[2] + settings.gf)
            end
            if noteData == 2 then
                setProperty('camFollow.x', camOriginG[1])
                setProperty('camFollow.y', camOriginG[2] - settings.gf)
            end
            if noteData == 3 then
                setProperty('camFollow.x', camOriginG[1] + settings.gf)
                setProperty('camFollow.y', camOriginG[2])
            end 
        end 
    end
end

function goodNoteHit(id, noteData, noteType, isSustainNote)
    if settings.enable then
        if not gfSection then
            if noteData == 0 then
                setProperty('camFollow.x', camOriginB[1] - settings.boyfriend)
                setProperty('camFollow.y', camOriginB[2])
            end
            if noteData == 1 then
                setProperty('camFollow.x', camOriginB[1])
                setProperty('camFollow.y', camOriginB[2] + settings.boyfriend)
            end
            if noteData == 2 then
                setProperty('camFollow.x', camOriginB[1])
                setProperty('camFollow.y', camOriginB[2] - settings.boyfriend)
            end
            if noteData == 3 then
                setProperty('camFollow.x', camOriginB[1] + settings.boyfriend)
                setProperty('camFollow.y', camOriginB[2])
            end
        else
            if noteData == 0 then
                setProperty('camFollow.x', camOriginG[1] - settings.gf)
                setProperty('camFollow.y', camOriginG[2])
            end
            if noteData == 1 then
                setProperty('camFollow.x', camOriginG[1])
                setProperty('camFollow.y', camOriginG[2] + settings.gf)
            end
            if noteData == 2 then
                setProperty('camFollow.x', camOriginG[1])
                setProperty('camFollow.y', camOriginG[2] - settings.gf)
            end
            if noteData == 3 then
                setProperty('camFollow.x', camOriginG[1] + settings.gf)
                setProperty('camFollow.y', camOriginG[2])
            end 
        end 
    end
end

function onBeatHit()
    if settings.enable then
        for i = 0,getProperty('settings.idleAnims.lenght') do
            if not mustHitSection and getProperty('dad.animation.curAnim.name.startsWith') == settings.idleAnims[i] then
                setProperty('camFollow.x', camOriginD[1])
                setProperty('camFollow.y', camOriginD[2])
            end
        end
        for i = 0,getProperty('settings.idleAnims.lenght') do
            if mustHitSection and getProperty('boyfriend.animation.curAnim.name.startsWith') == settings.idleAnims[i] then
                setProperty('camFollow.x', camOriginB[1])
                setProperty('camFollow.y', camOriginB[2])
            end
        end
        for i = 0,getProperty('settings.idleAnims.lenght') do
            if gfSection and getProperty('gf.animation.curAnim.name.startsWith') == settings.idleAnims[i] then
                setProperty('camFollow.x', camOriginG[1])
                setProperty('camFollow.y', camOriginG[2])
            end
        end 
    end
end
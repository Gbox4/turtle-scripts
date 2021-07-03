print("Torches in first slot, chests in second.")
print("Half of the length of tunnel: ")
local length = tonumber(io.read())

turtle.up()
turtle.dig()
turtle.forward()
turtle.turnLeft()

function torch()
    turtle.select(1)
    turtle.placeDown()
end

function chest()

    local free = 0
    for i=1,16,1 do
        if turtle.getItemDetail(i) == nil then
            free = free + 1
        end
    end

    if free <= 3 then
        turtle.select(2)
        turtle.placeDown()
        for i=3,16,1 do
            turtle.select(i)
            turtle.dropDown()
        end
    end
end

function removeJunk()
    for i = 1,16,1 do
        turtle.select(i)
        local block = turtle.getItemDetail()
        
        if block ~= nil then
            if block.name == "minecraft:cobblestone" or block.name == "minecraft:dirt" or block.name == "rustic:slate" or block.name == "minecraft:stone" or block.name == "chisel:basalt2" or block.name == "minecraft:gravel" or block.name == "rustic:slate"
            then
                turtle.drop()
            end
        end
    end
end

function backAndForth()

    for i = 1,15,1 do
        turtle.dig()
        turtle.forward()
        turtle.digDown()
        turtle.digUp()
        print(i)
    end

    removeJunk()
    chest()

    turtle.turnRight()
    turtle.dig()
    turtle.forward()
    turtle.digDown()
    turtle.digUp()
    turtle.turnRight()



    for i = 1,15,1 do
        turtle.dig()
        turtle.forward()
        turtle.digDown()
        turtle.digUp()
    end

    removeJunk()
    chest()

    turtle.turnLeft()
    turtle.dig()
    turtle.forward()
    turtle.digDown()
    turtle.digUp()
    turtle.turnLeft()

    

end


for i = 1,length,1 do
    backAndForth()

    if i % 5 == 0 then
        torch()
    end
end
local keyOrder = {
    'f', 'j', 'd', 'k', 's', 'l', 'a', ';'
}

local windows = {}
local images = {}
tap = hs.eventtap.new({hs.eventtap.event.types['keyDown']}, function(event)
    if event:getKeyCode() ~= hs.keycodes.map['escape'] then
        window = windows[event:getKeyCode()]
        if window == nil then
            return true
        end
        windows[event:getKeyCode()]:focus()
    end
    for _, imagepair in ipairs(images) do
        imagepair[1]:hide()
        imagepair[2]:hide()
    end
    tap:stop()
    return true
end)

function smartswitch()
    local i = 1
    for _, window in ipairs(hs.window.visibleWindows()) do
        if i > 8 then
            break
        end
        if window:isStandard() then
            local frame = window:frame()
            local styledtext = hs.styledtext.new(keyOrder[i], {
                color = {white=1.0, alpha=1},
                strokeWidth = -10,
                font = {name = "Helvetica", size = 80}
            })
            local text = hs.drawing.text(hs.geometry.rect(
                frame.x + frame.w / 2,
                frame.y + frame.h / 2,
                100,
                100), styledtext
            )
            local bg = hs.drawing.rectangle(hs.geometry.rect(
                frame.x + frame.w / 2 - 25,
                frame.y + frame.h / 2,
                100,
                100)
            )
            bg:setFillColor({white=0.0, alpha=1})
            bg:setFill(true)
            bg:show()
            text:show()
            images[i] = {text, bg}
            windows[hs.keycodes.map[keyOrder[i]]] = window
            i = i + 1
        end
    end
    tap:start()
end

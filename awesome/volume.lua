local wibox = require("wibox")
local awful = require("awful")
 
volume_widget = wibox.widget.textbox()
volume_widget:set_align("right")
 



function update_volume(widget)
   local fd = io.popen("amixer sget Master")
   local status = fd:read("*all")
   fd:close()
 
   -- local volume = tonumber(string.match(status, "(%d?%d?%d)%%")) / 100
   local volume = string.match(status, "(%d?%d?%d)%%")
   volume = string.format("% 3d", volume)
 
   status = string.match(status, "%[(o[^%]]*)%]")

   if string.find(status, "on", 1, true) then
       -- For the volume numbers
       volume = volume .. "%"
   else
       -- For the mute button
       volume = volume .. "M"
       
   end
   widget:set_markup(volume)
end


function changeVolume(action)
    if action == 'up' then
        awful.util.spawn("amixer set Master 3%+")
    elseif action == 'down' then
        awful.util.spawn("amixer set Master 3%-")
    else
        -- this amixer command is more complicated than the others because
        -- if you don't do this, it has problems unmuting because it 
        -- seems to mute all channels then only unmutes master.
        awful.util.spawn("amixer -D pulse set Master Playback Switch toggle")

        -- this is an ugly ugly ugly hack to make up for the fact that the
        -- amixer command seems to run to slow when muting
        update_volume(volume_widget)
        update_volume(volume_widget)
        update_volume(volume_widget)
        update_volume(volume_widget)
        update_volume(volume_widget)
    end
    update_volume(volume_widget)
end
 

volume_widget:buttons(awful.util.table.join(
   awful.button({ }, 1, function () changeVolume("muteToggle") end),
   awful.button({ }, 4, function () changeVolume("up") end),
   awful.button({ }, 5, function () changeVolume("down") end)
 )) 

 
update_volume(volume_widget)

-- this is a long sleep, but when the widget is directly interacted with, the
-- update mechanism is called directly. Thus, delay will only be seen when the
-- volume is altered by means other than this widget.
mytimer = timer({ timeout = 5 })
mytimer:connect_signal("timeout", function () update_volume(volume_widget) end)
mytimer:start()

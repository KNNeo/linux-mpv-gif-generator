-- Original by Ruin0x11 & blueray453
-- Adapted from https://github.com/the-honey/mpv-gif-generator
-- Usage: "[" to set start frame, "]" to set end frame, "g" for changing fps, "Ctrl+g" to create.

start_time = -1
end_time = -1
fps = 8

function make_gif()
    local start_time_l = start_time
    local end_time_l = end_time
    if start_time_l == -1 or end_time_l == -1 or start_time_l >= end_time_l then
        mp.osd_message("Invalid start/end time.")
        return
    end

    mp.osd_message("Creating GIF...")

    local video_path = mp.get_property("path")
    local video_dir_path = video_path:gsub("(.*)/.*$","%1")

    local position = start_time_l
    local duration = end_time_l - start_time_l

    -- then, make the gif
    local kdialogcommand = string.format("kdialog --getsavefilename %q '*.gif' | tr -d '\n'", video_dir_path)
    local handle = io.popen(kdialogcommand)
    local gif_path = handle:read("*a")
    handle:close()

    if(gif_path:sub(-string.len(".gif")) ~= ".gif")
    then
        gif_path = gif_path .. ".gif"
    end
    
    local palette_path = video_dir_path .. "/palette.png"

    args = string.format(
	'ffmpeg -ss %s -t %s -i %q -vf fps=%s,scale=w=320:h=-1:flags=lanczos,palettegen -y %q && ' ..
	'ffmpeg -ss %s -t %s -i %q -i %q -lavfi "fps=%s,scale=w=320:h=-1:flags=lanczos [x]; [x][1:v] paletteuse" -loop 0 -y %q && ' ..
	'rm -f %q',
	position, duration, video_path, fps, palette_path, -- palette generation
	position, duration, video_path, palette_path, fps, gif_path, -- GIF creation
	palette_path -- remove palette file
    )
    os.execute(args)
    mp.osd_message("Done. ")
end

function set_gif_start()
    start_time = mp.get_property_number("time-pos", -1)
    mp.osd_message("GIF start: " .. start_time)
end

function set_gif_end()
    end_time = mp.get_property_number("time-pos", -1)
    mp.osd_message("GIF end: " .. end_time)
end

function toggle_gif_fps()
    if fps == 8 then
		fps = 10
	else
		fps = 8
	end
    mp.osd_message("GIF frames per second: " .. fps)
end

mp.add_key_binding("g", "toggle_gif_fps", toggle_gif_fps)
mp.add_key_binding("[", "set_gif_start", set_gif_start)
mp.add_key_binding("]", "set_gif_end", set_gif_end)
mp.add_key_binding("Ctrl+g", "make_gif", make_gif)

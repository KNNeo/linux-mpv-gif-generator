-- Original by Ruin0x11
-- Adapted from https://github.com/the-honey/mpv-gif-generator
-- Usage: "g" to set start frame, "G" to set end frame, "Ctrl+g" to create.

start_time = -1
end_time = -1

function make_gif()
    local start_time_l = start_time
    local end_time_l = end_time
    if start_time_l == -1 or end_time_l == -1 or start_time_l >= end_time_l then
        mp.osd_message("Invalid start/end time.")
        return
    end

    mp.osd_message("Creating GIF.")

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

    args = string.format('ffmpeg -ss %s -t %s -i %q -vf fps=5,scale=w=720:h=-1 -loop 0 -y %q', position, duration, video_path, gif_path)
    -- mp.osd_message("args: " .. args)
    os.execute(args)

end

function set_gif_start()
    start_time = mp.get_property_number("time-pos", -1)
    mp.osd_message("GIF Start: " .. start_time)
end

function set_gif_end()
    end_time = mp.get_property_number("time-pos", -1)
    mp.osd_message("GIF End: " .. end_time)
end

function file_exists(name)
    local f=io.open(name,"r")
    if f~=nil then io.close(f) return true else return false end
end

mp.add_key_binding("g", "set_gif_start", set_gif_start)
mp.add_key_binding("G", "set_gif_end", set_gif_end)
mp.add_key_binding("Ctrl+g", "make_gif", make_gif)
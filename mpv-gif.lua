-- Original by Ruin0x11
-- Adapted from https://github.com/the-honey/mpv-gif-generator
-- Usage: "g" to set start frame, "G" to set end frame, "Ctrl+g" to create.

require 'mp.options'

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

    -- shell escape
    function esc(s)
        return string.gsub(s, '"', '"\\""')
    end

    local pathname = mp.get_property("path", "")


    local position = start_time_l
    local duration = end_time_l - start_time_l

    -- then, make the gif
    local filename = mp.get_property("filename/no-ext")
    local handle = io.popen("kdialog --getsavefilename | tr -d '\n'")
    local file_path = handle:read("*a")
    handle:close()

    args = string.format('ffmpeg -ss %s -t %s -i "%s" -vf fps=5,scale=w=720:h=-1 -loop 0 -y "%s"', position, duration,
        esc(pathname), esc(file_path))
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
    local f = io.open(name, "r")
    if f ~= nil then io.close(f) return true else return false end
end

mp.add_key_binding("g", "set_gif_start", set_gif_start)
mp.add_key_binding("G", "set_gif_end", set_gif_end)
mp.add_key_binding("Ctrl+g", "make_gif", make_gif)

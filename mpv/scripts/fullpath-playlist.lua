local mp = require("mp")

mp.add_key_binding("p", "fullpath-playlist", function()
	local playlist = mp.get_property_native("playlist")
	local current = -1
	local width = 5
	local msg = ""

	for index, item in ipairs(playlist) do
		if item.current then
			current = index
		end
		-- msg = msg..tostring(index).."\n"
	end

	local begin = math.max(1, current - width)
	if begin > 1 then msg = msg.."...\n" end
	for index, item in ipairs(playlist) do
		if index < begin then goto continue end
		if index > current + width then
			msg = msg.."...\n"
			break
		end

		if item.current then
			msg = msg..mp.get_property("osd-ass-cc/0").."{\\b1}"..item.filename.."{\\b0}"..mp.get_property("osd-ass-cc/1").."\n"
		else
			msg = msg..item.filename.."\n"
		end

		::continue::
	end

	mp.osd_message(msg, 1)
end)

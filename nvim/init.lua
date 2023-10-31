require("core")
if os.getenv("NVIM_ENABLE_PLUGINS") ~= nil then
	require("plugins")
else
	require("noplugs")
end

require("core")
if os.getenv("NVIM_ENABLE_PLUGINS") == "true" then
	require("plugins")
else
	require("noplugs")
end

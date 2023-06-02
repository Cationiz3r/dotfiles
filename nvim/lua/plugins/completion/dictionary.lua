local dict = require("cmp_dictionary")
dict.setup({
	first_case_insensitive = true,
})

dict.switcher({
  spelllang = {
		en = os.getenv("XDG_CACHE_HOME") .. "/dict/en",
  },
})

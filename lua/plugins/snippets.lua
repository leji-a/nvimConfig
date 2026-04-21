return {
	{
		"L3MON4D3/LuaSnip",
		config = function(_, opts)
			require("luasnip").config.setup(opts)

			local ls = require("luasnip")
			local s = ls.snippet
			local t = ls.text_node

			ls.add_snippets("c", {
				s("main", {
					t({
						"#include <stdio.h>",
						"",
						"int main() {",
						"  printf(\"hello\");",
						"  return 0;",
						"}"
					}),
				}),
			})
		end,
	},
}

local ls = require("luasnip")

return {
	ls.snippet("aoc", {
		ls.text_node({
			[[run: solution]],
			[[	./solution input.txt]],
			[[]],
			[[test: solution]],
			[[	./solution test.txt]],
			[[]],
			[[solution: solution.cpp]],
			[[	clang++ -std=c++20 -o solution solution.cpp -I../../]],
		}),
	}),
}

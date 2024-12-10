local ls = require("luasnip")

return {
	ls.snippet("aoc", {
		ls.text_node({
			[[#include <bits/stdc++.h>]],
			[[#include <cassert>]],
			[[using namespace std;]],
			[[]],
			[[#define ll long long]],
			[[]],
			[[vector<string> read_input(const string &filename) {]],
			[[  vector<string> lines{};]],
			[[  ifstream fs(filename);]],
			[[]],
			[[  string line;]],
			[[  while (getline(fs, line))]],
			[[    lines.push_back(line);]],
			[[  return lines;]],
			[[}]],
			[[]],
			[[int part1(const vector<string> &lines) { return 0; }]],
			[[]],
			[[int part2(const vector<string> &lines) { return 0; }]],
			[[]],
			[[int main(int argc, char *argv[]) {]],
			[[  assert(argc > 1 && "Need some input brotha\n");]],
			[[  auto lines = read_input(argv[1]);]],
			[[  for (auto const &l : lines)]],
			[[    cout << l << '\n';]],
			[[  cout << "Part 1:" << part1(lines) << '\n';]],
			[[  cout << "Part 2:" << part2(lines) << '\n';]],
			[[  return 0;]],
			[[}]],
		}),
	}),
	ls.snippet("adj4", {
		ls.text_node({
			[[const vector<pair<int, int>> adj4 = {{0, 1}, {1, 0}, {0, -1}, {-1, 0}};]],
		}),
	}),
	ls.snippet("adj8", {
		ls.text_node({
			[[const vector<pair<int, int>> adj8 = {{0, 1},  {1, 1},   {1, 0},  {1, -1},]],
			[[                                     {0, -1}, {-1, -1}, {-1, 0}, {-1, 1}};]],
		}),
	}),
	ls.snippet("valid_pos", {
		ls.text_node({
			[[inline bool is_valid_pos(int i, int j, int r, int c) {]],
			[[  return i >= 0 && j >= 0 && i < r && j < c;]],
			[[}]],
		}),
	}),
}

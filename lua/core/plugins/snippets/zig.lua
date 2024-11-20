local ls = require("luasnip")

return {
	ls.snippet("aoc", {
		ls.text_node({
			[[const std = @import("std");]],
			[[const Allocator = std.mem.Allocator;]],
			[[const ArrayList = std.ArrayList;]],
			[[const splitSeq = std.mem.splitSequence;]],
			[[]],
			[[pub fn main() !void {]],
			[[    var arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);]],
			[[    defer arena.deinit();]],
			[[    const allocator = arena.allocator();]],
			[[]],
			[[    const args = try std.process.argsAlloc(allocator);]],
			[[    std.debug.assert(args.len > 1);]],
			[[    const lines = try read_lines(&allocator, args[1]);]],
			[[]],
			[[    std.debug.print("Part 1: {}\n", .{part1(lines)});]],
			[[    std.debug.print("Part 2: {}\n", .{part2(lines)});]],
			[[}]],
			[[]],
			[[fn part1(_: [][]const u8) u32 {]],
			[[    return 0;]],
			[[}]],
			[[]],
			[[fn part2(_: [][]const u8) u32 {]],
			[[    return 0;]],
			[[}]],
			[[]],
			[[fn read_lines(allocator: *const Allocator, filename: []const u8) !ArrayList([]const u8) {]],
			[[    const file = try std.fs.cwd().openFile(filename, .{});]],
			[[    defer file.close();]],
			[[]],
			[[    var lines = ArrayList([]const u8).init(allocator.*);]],
			[[]],
			[[    const file_size = (try file.stat()).size;]],
			[[    const content = try file.reader().readAllAlloc(allocator.*, file_size);]],
			[[]],
			[[    var iter = splitSeq(u8, content, "\n");]],
			[[    while (iter.next()) |line| {]],
			[[        try lines.append(line);]],
			[[    }]],
			[[]],
			[[    return lines;]],
			[[}]],
		}),
	}),
}

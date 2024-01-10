const std = @import("std");
const ArrayList = @import("std").ArrayList;
const r = @cImport(@cInclude("raylib.h"));
const constants = @import("rendering/window.zig");
const Screen = @import("rendering/draw.zig").Screen;
const Matter = @import("mechanics/matter.zig").Matter;

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    const allocator = gpa.allocator();

    r.InitWindow(constants.WINDOW_HEIGHT, constants.WINDOW_LENGTH, constants.TITLE);
    r.SetTargetFPS(120);
	defer r.CloseWindow();

	var starting_objects_for_test = ArrayList(*Matter).init(allocator);
	defer starting_objects_for_test.deinit();
	for (1..4) |i|  {
	    var obj = try allocator.create(Matter);
	    obj.x = 100 * i;
	    obj.y = 50 * i;
	    try starting_objects_for_test.append(obj);
	}

	while (!r.WindowShouldClose()) {
        Screen.update(starting_objects_for_test);
	}
}

test "simple test" {
}

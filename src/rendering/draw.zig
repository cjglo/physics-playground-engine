const r = @cImport(@cInclude("raylib.h"));
const ArrayList = @import("std").ArrayList;
const Matter = @import("../mechanics/matter.zig").Matter;
const Allocator = import("std").mem.Allocator;

pub const Screen = struct {

    pub fn update(objects: ArrayList(*Matter), ) void {
        r.BeginDrawing();
        r.ClearBackground(r.BLACK);
        for (objects.items) |obj| {
           r.DrawCircle(@intCast(obj.x), @intCast(obj.y), 10, r.WHITE);
        }
        r.EndDrawing();
    }

};
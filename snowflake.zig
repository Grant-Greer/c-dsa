const std = @import("std");

pub fn identify_identical(values: []u8) void {
    for (values[0..]) |i| {
        for (values[1..]) |j| {
            if (i == j) {
                std.debug.print("Twin Integers Found! \n", .{});
                return;
            }
        }
    }
    std.debug.print("No two integers are alike. \n", .{});
}

pub fn main() void {
    var a: [5]u8 = .{ 1, 2, 3, 1, 5 };
    identify_identical(&a);
}

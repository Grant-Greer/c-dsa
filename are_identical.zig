const std = @import("std");

fn identical_right(snow1: []const i32, snow2: []const i32, start: i32) bool {
    for (0..6) |offset| {
        const snow2_index = (start + offset) % 6;
        if (snow1[offset] != snow2[snow2_index]) {
            return false;
        }
    }
    return true;
}

fn identical_left(snow1: []const i32, snow2: []const i32, start: i32) bool {
    for (0..6) |offset| {
        const snow2_index = start - offset;
        if (snow2_index < 0) {
            snow2_index += 6;
        }
        if (snow1[offset] != snow2[snow2_index]) {
            return false;
        }
    }
    return true;
}

pub fn are_identical(snow1: []const i32, snow2: []const i32) bool {
    for (0..6) |start| {
        if (identical_right(snow1, snow2, start))
            return true;

        if (identical_left(snow1, snow2, start))
            return true;
    }
    return false;
}

pub fn identify_identical(snowflakes: [][]const i32, n: usize) void {
    for (0..n) |i| {
        for (i + 1..n) |j| {
            if (are_identical(snowflakes[i], snowflakes[j])) {
                std.debug.print("Twin snowflakes found! \n", .{});
                return;
            }
        }
    }
    std.debug.print("No two integers are alike. \n", .{});
}

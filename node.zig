const std = @import("std");

const Node = struct {
    leftNode: ?*Node,
    data: i32,
    rightNode: ?*Node,

    pub fn newNode(data: i32, allocator: std.mem.Allocator) !*Node {
        const node = try allocator.create(Node);

        node.* = Node{
            .leftNode = null,
            .data = data,
            .rightNode = null,
        };

        return node;
    }
};
pub fn main() !void {
    const allocator = std.heap.page_allocator;

    // Create the root node
    var root = try Node.newNode(1, allocator);

    // Create left and right children of the root node
    root.leftNode = try Node.newNode(2, allocator);
    root.rightNode = try Node.newNode(3, allocator);

    // Create children for the left node
    root.leftNode.?.leftNode = try Node.newNode(4, allocator);
    root.leftNode.?.rightNode = try Node.newNode(5, allocator);

    // Create children for the right node
    root.rightNode.?.leftNode = try Node.newNode(6, allocator);
    root.rightNode.?.rightNode = try Node.newNode(7, allocator);

    std.debug.print("{any}/n", .{root});
}

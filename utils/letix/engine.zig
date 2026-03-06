const std = @import("std");

pub fn LetixEngine(file:[]u8) !void {
    var file = try std.fs.cwd().openFile(file,.{.mode = .read_only});
    defer file.close();
    var fileContent_buff = std.io.b;
    std.debug.print(fileContent, .{});
}
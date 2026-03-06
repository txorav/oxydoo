const std = @import("std");

pub fn main() !void {
    logoPrint();
}

pub fn  logoPrint () !void {
    const easteregg = "greatness is not about defeating the bad only its about taking controll of your own self while defeating the bad !";
    std.debug.print(easteregg,.{"the best running manager for odoo"});
}
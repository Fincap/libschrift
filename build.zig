const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    // libschrift
    const libschrift = b.addLibrary(.{
        .name = "libschrift",
        .linkage = .static,
        .root_module = b.addModule("libschrift", .{
            .target = target,
            .optimize = optimize,
        }),
    });
    libschrift.addCSourceFile(.{ .file = b.path("schrift.c") });
    libschrift.installHeader(b.path("schrift.h"), "schrift.h");
    libschrift.linkLibC();
    b.installArtifact(libschrift);
}

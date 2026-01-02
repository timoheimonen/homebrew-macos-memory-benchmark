# typed: false
# frozen_string_literal: true

class MemoryBenchmark < Formula
  desc "Memory performance benchmark tool for macOS Apple Silicon"
  homepage "https://github.com/timoheimonen/macOS-memory-benchmark"
  url "https://github.com/timoheimonen/macOS-memory-benchmark/archive/refs/tags/v.0.52.4.tar.gz"
  sha256 "bda1ff4b8d4449e0c4193ddd20d967c27db3d8f26266b53bd02844ee22f897c7"
  license "GPL-3.0"
  head "https://github.com/timoheimonen/macOS-memory-benchmark.git", branch: "main"

  # Only supports Apple Silicon (ARM64)
  depends_on :macos

  on_arm do
    def install
      system "make", "clean"
      system "make"
      bin.install "memory_benchmark"
    end
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/memory_benchmark -h", 0)
  end
end

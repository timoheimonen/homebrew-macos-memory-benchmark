# typed: false
# frozen_string_literal: true

class MemoryBenchmark < Formula
  desc "Memory performance benchmark tool for macOS Apple Silicon"
  homepage "https://github.com/timoheimonen/macOS-memory-benchmark"
  url "https://github.com/timoheimonen/macOS-memory-benchmark/archive/refs/tags/v.0.52.9.tar.gz"
  sha256 "365ce04b22ead48875fc1fe448ab41e93803e27ed27c50e70426f2263cac311f"
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

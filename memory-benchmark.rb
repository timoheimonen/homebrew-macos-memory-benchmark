# typed: false
# frozen_string_literal: true

class MemoryBenchmark < Formula
  desc "Memory performance benchmark tool for macOS Apple Silicon"
  homepage "https://github.com/timoheimonen/macOS-memory-benchmark"
  url "https://github.com/timoheimonen/macOS-memory-benchmark/archive/refs/tags/v.0.50.tar.gz"
  sha256 "6a7cf412ff6322be5e62e185a4a9fdd1e68e3e9eb24411c3ce4656f4554afc01"
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

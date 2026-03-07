# typed: false
# frozen_string_literal: true

class MemoryBenchmark < Formula
  desc "Memory performance benchmark tool for macOS Apple Silicon"
  homepage "https://github.com/timoheimonen/macOS-memory-benchmark"
  url "https://github.com/timoheimonen/macOS-memory-benchmark/archive/refs/tags/v.0.52.8.tar.gz"
  sha256 "084ed942d021cff3b1d2888f0037b8ada646dcf9d59d8e13098f68dac7909e25"
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

# typed: false
# frozen_string_literal: true

class MemoryBenchmark < Formula
  desc "Memory performance benchmark tool for macOS Apple Silicon"
  homepage "https://github.com/timoheimonen/macOS-memory-benchmark"
  url "https://github.com/timoheimonen/macOS-memory-benchmark/archive/refs/tags/v.0.55.3.tar.gz"
  sha256 "15f395e1751a7429a8c0e6a6a03334a562c775e94e292da59c243c430754a812"
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

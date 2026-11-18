class ShellExplain < Formula
  desc "Offline reference for shell commands: examples, options and mistakes"
  homepage "https://shell-explain.ninegene.com"
  url "https://github.com/ninegene/shell-explain/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "ac9f7c893e6707e6db43295412c583ecc45c07a7168fe05b582f4e5ef5af9098"
  license "MIT"
  head "https://github.com/ninegene/shell-explain.git", branch: "main"

  depends_on "go" => :build

  def install
    ldflags = "-s -w -X main.version=#{version}"
    system "go", "build", *std_go_args(ldflags:, output: bin/"explain"), "./cmd/explain"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/explain --version")
    assert_match "grep", shell_output("#{bin}/explain grep")
  end
end

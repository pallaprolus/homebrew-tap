class Contextcut < Formula
  desc "Prepare focused code context and change reviews for AI chats"
  homepage "https://github.com/pallaprolus/contextcut"
  version "0.3.0"
  license "MIT"

  on_macos do
    depends_on macos: :big_sur

    on_arm do
      url "https://github.com/pallaprolus/contextcut/releases/download/v0.3.0/contextcut-0.3.0-aarch64-apple-darwin.tar.gz"
      sha256 "5c56ebccacca60d67f921a24f840f51ead82b3515b2a7e292da4e54d6883b69c"
    end

    on_intel do
      url "https://github.com/pallaprolus/contextcut/releases/download/v0.3.0/contextcut-0.3.0-x86_64-apple-darwin.tar.gz"
      sha256 "bb3081c3eba11ce62de8470580f751c93499799a951bcc8e99c1b59bdd609c65"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pallaprolus/contextcut/releases/download/v0.3.0/contextcut-0.3.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "744d93b2a0becf836ac2129ee15176c40242e343caf7faff0e8e9b633cd5ddc3"
    end

    on_intel do
      url "https://github.com/pallaprolus/contextcut/releases/download/v0.3.0/contextcut-0.3.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "d3924236994d353df8e0ac1aa6e86f6cd3d7a086b635a3c42c252c740627447f"
    end
  end

  uses_from_macos "git"

  def install
    bin.install "contextcut"
    doc.install "README.md"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/contextcut --version")
    (testpath/"example.py").write "answer = 42\n"
    assert_match "answer = 42", shell_output("#{bin}/contextcut #{testpath} --budget 2k")
  end
end

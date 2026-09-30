class Contextcut < Formula
  desc "Prepare focused code context and change reviews for AI chats"
  homepage "https://github.com/pallaprolus/contextcut"
  version "0.3.1"
  license "MIT"

  on_macos do
    depends_on macos: :big_sur

    on_arm do
      url "https://github.com/pallaprolus/contextcut/releases/download/v0.3.1/contextcut-0.3.1-aarch64-apple-darwin.tar.gz"
      sha256 "73b9554ce11960a107d2710be50a5de8ebc8dea1d7fbf126d93d04eb9367f8a1"
    end

    on_intel do
      url "https://github.com/pallaprolus/contextcut/releases/download/v0.3.1/contextcut-0.3.1-x86_64-apple-darwin.tar.gz"
      sha256 "ec1436212776b9753249da541b3c3fe3a0dc3781c6ed5a86196935918bb79bc6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pallaprolus/contextcut/releases/download/v0.3.1/contextcut-0.3.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "83e8ad47debe7f80aed9a0b1d380226947b529621f1cc9424a6982a4ac472d8d"
    end

    on_intel do
      url "https://github.com/pallaprolus/contextcut/releases/download/v0.3.1/contextcut-0.3.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "4f8c64abb80d362b0e8c1b1424d300deb284f2585204eb72c524521ba7693afa"
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

require "language/node"

class AngularCli < Formula
  desc "CLI tool for Angular"
  homepage "https://cli.angular.io/"
  url "https://registry.npmjs.org/@angular/cli/-/cli-13.1.3.tgz"
  sha256 "4f7e3589f732f5c40d030d3e44c58e54e7f139bff6061ddef68600a48ac25b1e"
  license "MIT"

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_monterey: "e2f121fe5e167a01fb81913b6bb46c70e38b858c2563d2fabb0558e92ec2df9b"
    sha256 cellar: :any_skip_relocation, arm64_big_sur:  "e2f121fe5e167a01fb81913b6bb46c70e38b858c2563d2fabb0558e92ec2df9b"
    sha256 cellar: :any_skip_relocation, monterey:       "e6426261a842eb2fe2395fb6ec9c3176ff148d3f36688bc0b2e14db7c990b33c"
    sha256 cellar: :any_skip_relocation, big_sur:        "e6426261a842eb2fe2395fb6ec9c3176ff148d3f36688bc0b2e14db7c990b33c"
    sha256 cellar: :any_skip_relocation, catalina:       "e6426261a842eb2fe2395fb6ec9c3176ff148d3f36688bc0b2e14db7c990b33c"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "e2f121fe5e167a01fb81913b6bb46c70e38b858c2563d2fabb0558e92ec2df9b"
  end

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    system bin/"ng", "new", "angular-homebrew-test", "--skip-install"
    assert_predicate testpath/"angular-homebrew-test/package.json", :exist?, "Project was not created"
  end
end

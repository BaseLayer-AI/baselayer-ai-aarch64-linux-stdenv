{
  description = "aarch64-linux-dev";

  inputs = {
    nixpkgs.url = "https://flakehub.com/f/NixOS/nixpkgs/*";
  };

  outputs = { self, nixpkgs }:
    let
      host = import nixpkgs { system = "aarch64-linux"; };
    in {
      packages.aarch64-linux.default = host.writeTextFile { name = "readme"; executable = true; destination = "/bin/readme";
        text = ''#!${host.stdenv.shell}
cat ${self}/README.md
        '';};

      packages.aarch64-linux.info = host.writeTextFile { name = "info"; executable = true; destination = "/bin/info";
        text = ''#!${host.stdenv.shell}
echo 'host.stdenv'
echo ${builtins.toString host.stdenv}
ls -lR ${builtins.toString host.stdenv}
echo 'host.stdenv/setup'
cat -n ${builtins.toString host.stdenv}/setup
echo 'host.stdenv.shell'
echo ${host.coreutils}
ls -l ${host.coreutils}/bin |cat -n
${host.coreutils}/bin/uname -a
echo ${builtins.toString host.stdenv.shell}
ls -lR ${builtins.toString host.stdenv.shell}
${host.stdenv.shell} --version
''; };
  };
}


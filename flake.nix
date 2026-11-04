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
unset PATH
${host.coreutils}/bin/cat ${self}/README.md
        '';};

      packages.aarch64-linux.info = host.writeTextFile { name = "info"; executable = true; destination = "/bin/info";
        text = ''#!${host.stdenv.shell}
unset PATH
echo 'host.stdenv'
echo ${builtins.toString host.stdenv}
${host.coreutils}/bin/ls -lR ${builtins.toString host.stdenv}
echo 'host.stdenv/setup'
${host.coreutils}/bin/cat -n ${builtins.toString host.stdenv}/setup
echo 'host.stdenv.shell'
echo ${host.coreutils}
${host.coreutils}/bin/ls -l ${host.coreutils}/bin | ${host.coreutils}/bin/cat -n
${host.coreutils}/bin/uname -av
echo ${builtins.toString host.stdenv.shell}
${host.coreutils}/bin/ls -lR ${builtins.toString host.stdenv.shell}
${host.stdenv.shell} --version
''; };
  };
}


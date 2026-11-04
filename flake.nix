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
echo ${host.stdenv.shell}
${host.stdenv.shell} --version
${host.coreutils}/bin/uname -a
${host.coreutils}/bin/ls -R ${host.coreutils}
${host.coreutils}/bin/ls -R ${host.findutils}
${host.coreutils}/bin/ls -R ${host.diffutils}
${host.coreutils}/bin/ls -R ${host.gnused}
${host.coreutils}/bin/ls -R ${host.gnugrep}
${host.coreutils}/bin/ls -R ${host.gawk}
${host.coreutils}/bin/ls -R ${host.gnutar}
${host.coreutils}/bin/ls -R ${host.gzip}
${host.coreutils}/bin/ls -R ${host.bzip2}
${host.coreutils}/bin/ls -R ${host.gnumake}
${host.coreutils}/bin/ls -R ${host.patch}
${host.coreutils}/bin/ls -R ${host.xz}
${host.coreutils}/bin/ls -R ${host.file}
''; };
  };
}


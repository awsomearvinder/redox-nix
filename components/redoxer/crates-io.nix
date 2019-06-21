{ lib, buildRustCrate, buildRustCrateHelpers }:
with buildRustCrateHelpers;
let inherit (lib.lists) fold;
    inherit (lib.attrsets) recursiveUpdate;
in
rec {

# adler32-1.0.3

  crates.adler32."1.0.3" = deps: { features?(features_.adler32."1.0.3" deps {}) }: buildRustCrate {
    crateName = "adler32";
    version = "1.0.3";
    authors = [ "Remi Rampin <remirampin@gmail.com>" ];
    sha256 = "1z3mvjgw02mbqk98kizzibrca01d5wfkpazsrp3vkkv3i56pn6fb";
  };
  features_.adler32."1.0.3" = deps: f: updateFeatures f (rec {
    adler32."1.0.3".default = (f.adler32."1.0.3".default or true);
  }) [];


# end
# arg_parser-0.1.0

  crates.arg_parser."0.1.0" = deps: { features?(features_.arg_parser."0.1.0" deps {}) }: buildRustCrate {
    crateName = "arg_parser";
    version = "0.1.0";
    authors = [ "Jose Narvaez <goyox86@gmail.com>" ];
    sha256 = "1v1smylyazd7s30c40p8w3j5f45zab2sk5b3nfdca6qjpvv7p6g4";
  };
  features_.arg_parser."0.1.0" = deps: f: updateFeatures f (rec {
    arg_parser."0.1.0".default = (f.arg_parser."0.1.0".default or true);
  }) [];


# end
# argon2rs-0.2.5

  crates.argon2rs."0.2.5" = deps: { features?(features_.argon2rs."0.2.5" deps {}) }: buildRustCrate {
    crateName = "argon2rs";
    version = "0.2.5";
    authors = [ "bryant <bryant@defrag.in>" ];
    sha256 = "1byl9b3wwyrarn8qack21v5fi2qsnn3y5clvikk2apskhmnih1rw";
    dependencies = mapFeatures features ([
      (crates."blake2_rfc"."${deps."argon2rs"."0.2.5"."blake2_rfc"}" deps)
      (crates."scoped_threadpool"."${deps."argon2rs"."0.2.5"."scoped_threadpool"}" deps)
    ]);
    features = mkFeatures (features."argon2rs"."0.2.5" or {});
  };
  features_.argon2rs."0.2.5" = deps: f: updateFeatures f (rec {
    argon2rs."0.2.5".default = (f.argon2rs."0.2.5".default or true);
    blake2_rfc = fold recursiveUpdate {} [
      { "${deps.argon2rs."0.2.5".blake2_rfc}"."simd_asm" =
        (f.blake2_rfc."${deps.argon2rs."0.2.5".blake2_rfc}"."simd_asm" or false) ||
        (argon2rs."0.2.5"."simd" or false) ||
        (f."argon2rs"."0.2.5"."simd" or false); }
      { "${deps.argon2rs."0.2.5".blake2_rfc}".default = true; }
    ];
    scoped_threadpool."${deps.argon2rs."0.2.5".scoped_threadpool}".default = true;
  }) [
    (features_.blake2_rfc."${deps."argon2rs"."0.2.5"."blake2_rfc"}" deps)
    (features_.scoped_threadpool."${deps."argon2rs"."0.2.5"."scoped_threadpool"}" deps)
  ];


# end
# arrayvec-0.4.10

  crates.arrayvec."0.4.10" = deps: { features?(features_.arrayvec."0.4.10" deps {}) }: buildRustCrate {
    crateName = "arrayvec";
    version = "0.4.10";
    authors = [ "bluss" ];
    sha256 = "0qbh825i59w5wfdysqdkiwbwkrsy7lgbd4pwbyb8pxx8wc36iny8";
    dependencies = mapFeatures features ([
      (crates."nodrop"."${deps."arrayvec"."0.4.10"."nodrop"}" deps)
    ]);
    features = mkFeatures (features."arrayvec"."0.4.10" or {});
  };
  features_.arrayvec."0.4.10" = deps: f: updateFeatures f (rec {
    arrayvec = fold recursiveUpdate {} [
      { "0.4.10".default = (f.arrayvec."0.4.10".default or true); }
      { "0.4.10".serde =
        (f.arrayvec."0.4.10".serde or false) ||
        (f.arrayvec."0.4.10".serde-1 or false) ||
        (arrayvec."0.4.10"."serde-1" or false); }
      { "0.4.10".std =
        (f.arrayvec."0.4.10".std or false) ||
        (f.arrayvec."0.4.10".default or false) ||
        (arrayvec."0.4.10"."default" or false); }
    ];
    nodrop."${deps.arrayvec."0.4.10".nodrop}".default = (f.nodrop."${deps.arrayvec."0.4.10".nodrop}".default or false);
  }) [
    (features_.nodrop."${deps."arrayvec"."0.4.10"."nodrop"}" deps)
  ];


# end
# autocfg-0.1.4

  crates.autocfg."0.1.4" = deps: { features?(features_.autocfg."0.1.4" deps {}) }: buildRustCrate {
    crateName = "autocfg";
    version = "0.1.4";
    authors = [ "Josh Stone <cuviper@gmail.com>" ];
    sha256 = "1xhpq1h2rqhqx95rc20x3wxi5yhv4a62jr269b8dqyhp8r84ss9i";
  };
  features_.autocfg."0.1.4" = deps: f: updateFeatures f (rec {
    autocfg."0.1.4".default = (f.autocfg."0.1.4".default or true);
  }) [];


# end
# backtrace-0.3.30

  crates.backtrace."0.3.30" = deps: { features?(features_.backtrace."0.3.30" deps {}) }: buildRustCrate {
    crateName = "backtrace";
    version = "0.3.30";
    authors = [ "The Rust Project Developers" ];
    sha256 = "1pqabms2dmva63rs48vjamkdq0rr02jxnj5h6hyj10nljzfgvny1";
    dependencies = mapFeatures features ([
      (crates."cfg_if"."${deps."backtrace"."0.3.30"."cfg_if"}" deps)
      (crates."libc"."${deps."backtrace"."0.3.30"."libc"}" deps)
      (crates."rustc_demangle"."${deps."backtrace"."0.3.30"."rustc_demangle"}" deps)
    ]
      ++ (if features.backtrace."0.3.30".backtrace-sys or false then [ (crates.backtrace_sys."${deps."backtrace"."0.3.30".backtrace_sys}" deps) ] else []))
      ++ (if kernel == "windows" then mapFeatures features ([
]) else []);

    buildDependencies = mapFeatures features ([
      (crates."autocfg"."${deps."backtrace"."0.3.30"."autocfg"}" deps)
    ]);
    features = mkFeatures (features."backtrace"."0.3.30" or {});
  };
  features_.backtrace."0.3.30" = deps: f: updateFeatures f (rec {
    autocfg."${deps.backtrace."0.3.30".autocfg}".default = true;
    backtrace = fold recursiveUpdate {} [
      { "0.3.30".addr2line =
        (f.backtrace."0.3.30".addr2line or false) ||
        (f.backtrace."0.3.30".gimli-symbolize or false) ||
        (backtrace."0.3.30"."gimli-symbolize" or false); }
      { "0.3.30".backtrace-sys =
        (f.backtrace."0.3.30".backtrace-sys or false) ||
        (f.backtrace."0.3.30".libbacktrace or false) ||
        (backtrace."0.3.30"."libbacktrace" or false); }
      { "0.3.30".coresymbolication =
        (f.backtrace."0.3.30".coresymbolication or false) ||
        (f.backtrace."0.3.30".default or false) ||
        (backtrace."0.3.30"."default" or false); }
      { "0.3.30".dbghelp =
        (f.backtrace."0.3.30".dbghelp or false) ||
        (f.backtrace."0.3.30".default or false) ||
        (backtrace."0.3.30"."default" or false); }
      { "0.3.30".default = (f.backtrace."0.3.30".default or true); }
      { "0.3.30".dladdr =
        (f.backtrace."0.3.30".dladdr or false) ||
        (f.backtrace."0.3.30".default or false) ||
        (backtrace."0.3.30"."default" or false); }
      { "0.3.30".findshlibs =
        (f.backtrace."0.3.30".findshlibs or false) ||
        (f.backtrace."0.3.30".gimli-symbolize or false) ||
        (backtrace."0.3.30"."gimli-symbolize" or false); }
      { "0.3.30".libbacktrace =
        (f.backtrace."0.3.30".libbacktrace or false) ||
        (f.backtrace."0.3.30".default or false) ||
        (backtrace."0.3.30"."default" or false); }
      { "0.3.30".libunwind =
        (f.backtrace."0.3.30".libunwind or false) ||
        (f.backtrace."0.3.30".default or false) ||
        (backtrace."0.3.30"."default" or false); }
      { "0.3.30".memmap =
        (f.backtrace."0.3.30".memmap or false) ||
        (f.backtrace."0.3.30".gimli-symbolize or false) ||
        (backtrace."0.3.30"."gimli-symbolize" or false); }
      { "0.3.30".rustc-serialize =
        (f.backtrace."0.3.30".rustc-serialize or false) ||
        (f.backtrace."0.3.30".serialize-rustc or false) ||
        (backtrace."0.3.30"."serialize-rustc" or false); }
      { "0.3.30".serde =
        (f.backtrace."0.3.30".serde or false) ||
        (f.backtrace."0.3.30".serialize-serde or false) ||
        (backtrace."0.3.30"."serialize-serde" or false); }
      { "0.3.30".serde_derive =
        (f.backtrace."0.3.30".serde_derive or false) ||
        (f.backtrace."0.3.30".serialize-serde or false) ||
        (backtrace."0.3.30"."serialize-serde" or false); }
      { "0.3.30".std =
        (f.backtrace."0.3.30".std or false) ||
        (f.backtrace."0.3.30".default or false) ||
        (backtrace."0.3.30"."default" or false); }
    ];
    backtrace_sys."${deps.backtrace."0.3.30".backtrace_sys}".default = true;
    cfg_if."${deps.backtrace."0.3.30".cfg_if}".default = true;
    libc."${deps.backtrace."0.3.30".libc}".default = (f.libc."${deps.backtrace."0.3.30".libc}".default or false);
    rustc_demangle."${deps.backtrace."0.3.30".rustc_demangle}".default = true;
  }) [
    (features_.backtrace_sys."${deps."backtrace"."0.3.30"."backtrace_sys"}" deps)
    (features_.cfg_if."${deps."backtrace"."0.3.30"."cfg_if"}" deps)
    (features_.libc."${deps."backtrace"."0.3.30"."libc"}" deps)
    (features_.rustc_demangle."${deps."backtrace"."0.3.30"."rustc_demangle"}" deps)
    (features_.autocfg."${deps."backtrace"."0.3.30"."autocfg"}" deps)
  ];


# end
# backtrace-sys-0.1.28

  crates.backtrace_sys."0.1.28" = deps: { features?(features_.backtrace_sys."0.1.28" deps {}) }: buildRustCrate {
    crateName = "backtrace-sys";
    version = "0.1.28";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "1bbw8chs0wskxwzz7f3yy7mjqhyqj8lslq8pcjw1rbd2g23c34xl";
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."libc"."${deps."backtrace_sys"."0.1.28"."libc"}" deps)
    ]);

    buildDependencies = mapFeatures features ([
      (crates."cc"."${deps."backtrace_sys"."0.1.28"."cc"}" deps)
    ]);
  };
  features_.backtrace_sys."0.1.28" = deps: f: updateFeatures f (rec {
    backtrace_sys."0.1.28".default = (f.backtrace_sys."0.1.28".default or true);
    cc."${deps.backtrace_sys."0.1.28".cc}".default = true;
    libc."${deps.backtrace_sys."0.1.28".libc}".default = (f.libc."${deps.backtrace_sys."0.1.28".libc}".default or false);
  }) [
    (features_.libc."${deps."backtrace_sys"."0.1.28"."libc"}" deps)
    (features_.cc."${deps."backtrace_sys"."0.1.28"."cc"}" deps)
  ];


# end
# base64-0.9.3

  crates.base64."0.9.3" = deps: { features?(features_.base64."0.9.3" deps {}) }: buildRustCrate {
    crateName = "base64";
    version = "0.9.3";
    authors = [ "Alice Maz <alice@alicemaz.com>" "Marshall Pierce <marshall@mpierce.org>" ];
    sha256 = "11hhz8ln4zbpn2h2gm9fbbb9j254wrd4fpmddlyah2rrnqsmmqkd";
    dependencies = mapFeatures features ([
      (crates."byteorder"."${deps."base64"."0.9.3"."byteorder"}" deps)
      (crates."safemem"."${deps."base64"."0.9.3"."safemem"}" deps)
    ]);
  };
  features_.base64."0.9.3" = deps: f: updateFeatures f (rec {
    base64."0.9.3".default = (f.base64."0.9.3".default or true);
    byteorder."${deps.base64."0.9.3".byteorder}".default = true;
    safemem."${deps.base64."0.9.3".safemem}".default = true;
  }) [
    (features_.byteorder."${deps."base64"."0.9.3"."byteorder"}" deps)
    (features_.safemem."${deps."base64"."0.9.3"."safemem"}" deps)
  ];


# end
# bidir-map-0.6.0

  crates.bidir_map."0.6.0" = deps: { features?(features_.bidir_map."0.6.0" deps {}) }: buildRustCrate {
    crateName = "bidir-map";
    version = "0.6.0";
    authors = [ "nabijaczleweli <nabijaczleweli@gmail.com>" "Jake Goulding <jake.goulding@gmail.com>" "kennytm <kennytm@gmail.com>" "Boscop <kingboscop@gmail.com>" ];
    sha256 = "0hqjlrcc22fbsgi5aj74k4ymqa61yz0gyy7vl3k1sigw8bqpd677";
  };
  features_.bidir_map."0.6.0" = deps: f: updateFeatures f (rec {
    bidir_map."0.6.0".default = (f.bidir_map."0.6.0".default or true);
  }) [];


# end
# bitflags-1.1.0

  crates.bitflags."1.1.0" = deps: { features?(features_.bitflags."1.1.0" deps {}) }: buildRustCrate {
    crateName = "bitflags";
    version = "1.1.0";
    authors = [ "The Rust Project Developers" ];
    sha256 = "1iwa4jrqcf4lnbwl562a3lx3r0jkh1j88b219bsqvbm4sni67dyv";
    build = "build.rs";
    features = mkFeatures (features."bitflags"."1.1.0" or {});
  };
  features_.bitflags."1.1.0" = deps: f: updateFeatures f (rec {
    bitflags."1.1.0".default = (f.bitflags."1.1.0".default or true);
  }) [];


# end
# blake2-rfc-0.2.18

  crates.blake2_rfc."0.2.18" = deps: { features?(features_.blake2_rfc."0.2.18" deps {}) }: buildRustCrate {
    crateName = "blake2-rfc";
    version = "0.2.18";
    authors = [ "Cesar Eduardo Barros <cesarb@cesarb.eti.br>" ];
    sha256 = "0pyqrik4471ljk16prs0iwb2sam39z0z6axyyjxlqxdmf4wprf0l";
    dependencies = mapFeatures features ([
      (crates."arrayvec"."${deps."blake2_rfc"."0.2.18"."arrayvec"}" deps)
      (crates."constant_time_eq"."${deps."blake2_rfc"."0.2.18"."constant_time_eq"}" deps)
    ]);
    features = mkFeatures (features."blake2_rfc"."0.2.18" or {});
  };
  features_.blake2_rfc."0.2.18" = deps: f: updateFeatures f (rec {
    arrayvec."${deps.blake2_rfc."0.2.18".arrayvec}".default = (f.arrayvec."${deps.blake2_rfc."0.2.18".arrayvec}".default or false);
    blake2_rfc = fold recursiveUpdate {} [
      { "0.2.18".default = (f.blake2_rfc."0.2.18".default or true); }
      { "0.2.18".simd =
        (f.blake2_rfc."0.2.18".simd or false) ||
        (f.blake2_rfc."0.2.18".simd_opt or false) ||
        (blake2_rfc."0.2.18"."simd_opt" or false); }
      { "0.2.18".simd_opt =
        (f.blake2_rfc."0.2.18".simd_opt or false) ||
        (f.blake2_rfc."0.2.18".simd_asm or false) ||
        (blake2_rfc."0.2.18"."simd_asm" or false); }
      { "0.2.18".std =
        (f.blake2_rfc."0.2.18".std or false) ||
        (f.blake2_rfc."0.2.18".default or false) ||
        (blake2_rfc."0.2.18"."default" or false); }
    ];
    constant_time_eq."${deps.blake2_rfc."0.2.18".constant_time_eq}".default = true;
  }) [
    (features_.arrayvec."${deps."blake2_rfc"."0.2.18"."arrayvec"}" deps)
    (features_.constant_time_eq."${deps."blake2_rfc"."0.2.18"."constant_time_eq"}" deps)
  ];


# end
# block-buffer-0.7.3

  crates.block_buffer."0.7.3" = deps: { features?(features_.block_buffer."0.7.3" deps {}) }: buildRustCrate {
    crateName = "block-buffer";
    version = "0.7.3";
    authors = [ "RustCrypto Developers" ];
    sha256 = "0kryp6l1ia1f5vxmmzggx0pnc5zqxm6m9m9wvh5y0b3wdcj5xm1v";
    dependencies = mapFeatures features ([
      (crates."block_padding"."${deps."block_buffer"."0.7.3"."block_padding"}" deps)
      (crates."byte_tools"."${deps."block_buffer"."0.7.3"."byte_tools"}" deps)
      (crates."byteorder"."${deps."block_buffer"."0.7.3"."byteorder"}" deps)
      (crates."generic_array"."${deps."block_buffer"."0.7.3"."generic_array"}" deps)
    ]);
  };
  features_.block_buffer."0.7.3" = deps: f: updateFeatures f (rec {
    block_buffer."0.7.3".default = (f.block_buffer."0.7.3".default or true);
    block_padding."${deps.block_buffer."0.7.3".block_padding}".default = true;
    byte_tools."${deps.block_buffer."0.7.3".byte_tools}".default = true;
    byteorder."${deps.block_buffer."0.7.3".byteorder}".default = (f.byteorder."${deps.block_buffer."0.7.3".byteorder}".default or false);
    generic_array."${deps.block_buffer."0.7.3".generic_array}".default = true;
  }) [
    (features_.block_padding."${deps."block_buffer"."0.7.3"."block_padding"}" deps)
    (features_.byte_tools."${deps."block_buffer"."0.7.3"."byte_tools"}" deps)
    (features_.byteorder."${deps."block_buffer"."0.7.3"."byteorder"}" deps)
    (features_.generic_array."${deps."block_buffer"."0.7.3"."generic_array"}" deps)
  ];


# end
# block-padding-0.1.4

  crates.block_padding."0.1.4" = deps: { features?(features_.block_padding."0.1.4" deps {}) }: buildRustCrate {
    crateName = "block-padding";
    version = "0.1.4";
    authors = [ "RustCrypto Developers" ];
    sha256 = "08xvr2spxn614x5scn1wsv8a8daslmj1b3n94n644ygb13gsq8zq";
    dependencies = mapFeatures features ([
      (crates."byte_tools"."${deps."block_padding"."0.1.4"."byte_tools"}" deps)
    ]);
  };
  features_.block_padding."0.1.4" = deps: f: updateFeatures f (rec {
    block_padding."0.1.4".default = (f.block_padding."0.1.4".default or true);
    byte_tools."${deps.block_padding."0.1.4".byte_tools}".default = true;
  }) [
    (features_.byte_tools."${deps."block_padding"."0.1.4"."byte_tools"}" deps)
  ];


# end
# byte-tools-0.3.1

  crates.byte_tools."0.3.1" = deps: { features?(features_.byte_tools."0.3.1" deps {}) }: buildRustCrate {
    crateName = "byte-tools";
    version = "0.3.1";
    authors = [ "RustCrypto Developers" ];
    sha256 = "01hfp59bxq74glhfmhvm9wma2migq2kfmvcvqq5pssk5k52g8ja0";
  };
  features_.byte_tools."0.3.1" = deps: f: updateFeatures f (rec {
    byte_tools."0.3.1".default = (f.byte_tools."0.3.1".default or true);
  }) [];


# end
# bytecount-0.1.7

  crates.bytecount."0.1.7" = deps: { features?(features_.bytecount."0.1.7" deps {}) }: buildRustCrate {
    crateName = "bytecount";
    version = "0.1.7";
    authors = [ "Andre Bogus <bogusandre@gmail.de>" "Joshua Landau <joshua@landau.ws>" ];
    sha256 = "0ni7hz2dv8lv1659vsc7sjw9ha9gsdq7brkdnpp6x4n9dxxk5r97";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."bytecount"."0.1.7" or {});
  };
  features_.bytecount."0.1.7" = deps: f: updateFeatures f (rec {
    bytecount = fold recursiveUpdate {} [
      { "0.1.7".default = (f.bytecount."0.1.7".default or true); }
      { "0.1.7".simd =
        (f.bytecount."0.1.7".simd or false) ||
        (f.bytecount."0.1.7".simd-accel or false) ||
        (bytecount."0.1.7"."simd-accel" or false); }
      { "0.1.7".simd-accel =
        (f.bytecount."0.1.7".simd-accel or false) ||
        (f.bytecount."0.1.7".avx-accel or false) ||
        (bytecount."0.1.7"."avx-accel" or false); }
    ];
  }) [];


# end
# byteorder-1.3.2

  crates.byteorder."1.3.2" = deps: { features?(features_.byteorder."1.3.2" deps {}) }: buildRustCrate {
    crateName = "byteorder";
    version = "1.3.2";
    authors = [ "Andrew Gallant <jamslam@gmail.com>" ];
    sha256 = "099fxwc79ncpcl8dgg9hql8gznz11a3sjs7pai0mg6w8r05khvdx";
    build = "build.rs";
    features = mkFeatures (features."byteorder"."1.3.2" or {});
  };
  features_.byteorder."1.3.2" = deps: f: updateFeatures f (rec {
    byteorder = fold recursiveUpdate {} [
      { "1.3.2".default = (f.byteorder."1.3.2".default or true); }
      { "1.3.2".std =
        (f.byteorder."1.3.2".std or false) ||
        (f.byteorder."1.3.2".default or false) ||
        (byteorder."1.3.2"."default" or false); }
    ];
  }) [];


# end
# cc-1.0.37

  crates.cc."1.0.37" = deps: { features?(features_.cc."1.0.37" deps {}) }: buildRustCrate {
    crateName = "cc";
    version = "1.0.37";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "1m5s357yi2amgd0kd8chxdcbnscyxwxifmf5hgv92x5xj56b3shj";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."cc"."1.0.37" or {});
  };
  features_.cc."1.0.37" = deps: f: updateFeatures f (rec {
    cc = fold recursiveUpdate {} [
      { "1.0.37".default = (f.cc."1.0.37".default or true); }
      { "1.0.37".rayon =
        (f.cc."1.0.37".rayon or false) ||
        (f.cc."1.0.37".parallel or false) ||
        (cc."1.0.37"."parallel" or false); }
    ];
  }) [];


# end
# cfg-if-0.1.9

  crates.cfg_if."0.1.9" = deps: { features?(features_.cfg_if."0.1.9" deps {}) }: buildRustCrate {
    crateName = "cfg-if";
    version = "0.1.9";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "13g9p2mc5b2b5wn716fwvilzib376ycpkgk868yxfp16jzix57p7";
  };
  features_.cfg_if."0.1.9" = deps: f: updateFeatures f (rec {
    cfg_if."0.1.9".default = (f.cfg_if."0.1.9".default or true);
  }) [];


# end
# clap-2.33.0

  crates.clap."2.33.0" = deps: { features?(features_.clap."2.33.0" deps {}) }: buildRustCrate {
    crateName = "clap";
    version = "2.33.0";
    authors = [ "Kevin K. <kbknapp@gmail.com>" ];
    sha256 = "054n9ngh6pkknpmd4acgdsp40iw6f5jzq8a4h2b76gnbvk6p5xjh";
    dependencies = mapFeatures features ([
      (crates."bitflags"."${deps."clap"."2.33.0"."bitflags"}" deps)
      (crates."textwrap"."${deps."clap"."2.33.0"."textwrap"}" deps)
      (crates."unicode_width"."${deps."clap"."2.33.0"."unicode_width"}" deps)
    ])
      ++ (if !(kernel == "windows") then mapFeatures features ([
]) else []);
    features = mkFeatures (features."clap"."2.33.0" or {});
  };
  features_.clap."2.33.0" = deps: f: updateFeatures f (rec {
    bitflags."${deps.clap."2.33.0".bitflags}".default = true;
    clap = fold recursiveUpdate {} [
      { "2.33.0".ansi_term =
        (f.clap."2.33.0".ansi_term or false) ||
        (f.clap."2.33.0".color or false) ||
        (clap."2.33.0"."color" or false); }
      { "2.33.0".atty =
        (f.clap."2.33.0".atty or false) ||
        (f.clap."2.33.0".color or false) ||
        (clap."2.33.0"."color" or false); }
      { "2.33.0".clippy =
        (f.clap."2.33.0".clippy or false) ||
        (f.clap."2.33.0".lints or false) ||
        (clap."2.33.0"."lints" or false); }
      { "2.33.0".color =
        (f.clap."2.33.0".color or false) ||
        (f.clap."2.33.0".default or false) ||
        (clap."2.33.0"."default" or false); }
      { "2.33.0".default = (f.clap."2.33.0".default or true); }
      { "2.33.0".strsim =
        (f.clap."2.33.0".strsim or false) ||
        (f.clap."2.33.0".suggestions or false) ||
        (clap."2.33.0"."suggestions" or false); }
      { "2.33.0".suggestions =
        (f.clap."2.33.0".suggestions or false) ||
        (f.clap."2.33.0".default or false) ||
        (clap."2.33.0"."default" or false); }
      { "2.33.0".term_size =
        (f.clap."2.33.0".term_size or false) ||
        (f.clap."2.33.0".wrap_help or false) ||
        (clap."2.33.0"."wrap_help" or false); }
      { "2.33.0".vec_map =
        (f.clap."2.33.0".vec_map or false) ||
        (f.clap."2.33.0".default or false) ||
        (clap."2.33.0"."default" or false); }
      { "2.33.0".yaml =
        (f.clap."2.33.0".yaml or false) ||
        (f.clap."2.33.0".doc or false) ||
        (clap."2.33.0"."doc" or false); }
      { "2.33.0".yaml-rust =
        (f.clap."2.33.0".yaml-rust or false) ||
        (f.clap."2.33.0".yaml or false) ||
        (clap."2.33.0"."yaml" or false); }
    ];
    textwrap = fold recursiveUpdate {} [
      { "${deps.clap."2.33.0".textwrap}"."term_size" =
        (f.textwrap."${deps.clap."2.33.0".textwrap}"."term_size" or false) ||
        (clap."2.33.0"."wrap_help" or false) ||
        (f."clap"."2.33.0"."wrap_help" or false); }
      { "${deps.clap."2.33.0".textwrap}".default = true; }
    ];
    unicode_width."${deps.clap."2.33.0".unicode_width}".default = true;
  }) [
    (features_.bitflags."${deps."clap"."2.33.0"."bitflags"}" deps)
    (features_.textwrap."${deps."clap"."2.33.0"."textwrap"}" deps)
    (features_.unicode_width."${deps."clap"."2.33.0"."unicode_width"}" deps)
  ];


# end
# cloudabi-0.0.3

  crates.cloudabi."0.0.3" = deps: { features?(features_.cloudabi."0.0.3" deps {}) }: buildRustCrate {
    crateName = "cloudabi";
    version = "0.0.3";
    authors = [ "Nuxi (https://nuxi.nl/) and contributors" ];
    sha256 = "1z9lby5sr6vslfd14d6igk03s7awf91mxpsfmsp3prxbxlk0x7h5";
    libPath = "cloudabi.rs";
    dependencies = mapFeatures features ([
    ]
      ++ (if features.cloudabi."0.0.3".bitflags or false then [ (crates.bitflags."${deps."cloudabi"."0.0.3".bitflags}" deps) ] else []));
    features = mkFeatures (features."cloudabi"."0.0.3" or {});
  };
  features_.cloudabi."0.0.3" = deps: f: updateFeatures f (rec {
    bitflags."${deps.cloudabi."0.0.3".bitflags}".default = true;
    cloudabi = fold recursiveUpdate {} [
      { "0.0.3".bitflags =
        (f.cloudabi."0.0.3".bitflags or false) ||
        (f.cloudabi."0.0.3".default or false) ||
        (cloudabi."0.0.3"."default" or false); }
      { "0.0.3".default = (f.cloudabi."0.0.3".default or true); }
    ];
  }) [
    (features_.bitflags."${deps."cloudabi"."0.0.3"."bitflags"}" deps)
  ];


# end
# constant_time_eq-0.1.3

  crates.constant_time_eq."0.1.3" = deps: { features?(features_.constant_time_eq."0.1.3" deps {}) }: buildRustCrate {
    crateName = "constant_time_eq";
    version = "0.1.3";
    authors = [ "Cesar Eduardo Barros <cesarb@cesarb.eti.br>" ];
    sha256 = "03qri9hjf049gwqg9q527lybpg918q6y5q4g9a5lma753nff49wd";
  };
  features_.constant_time_eq."0.1.3" = deps: f: updateFeatures f (rec {
    constant_time_eq."0.1.3".default = (f.constant_time_eq."0.1.3".default or true);
  }) [];


# end
# crc32fast-1.2.0

  crates.crc32fast."1.2.0" = deps: { features?(features_.crc32fast."1.2.0" deps {}) }: buildRustCrate {
    crateName = "crc32fast";
    version = "1.2.0";
    authors = [ "Sam Rijs <srijs@airpost.net>" "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "1mx88ndqln6vzg7hjhjp8b7g0qggpqggsjrlsdqrfsrbpdzffcn8";
    dependencies = mapFeatures features ([
      (crates."cfg_if"."${deps."crc32fast"."1.2.0"."cfg_if"}" deps)
    ]);
    features = mkFeatures (features."crc32fast"."1.2.0" or {});
  };
  features_.crc32fast."1.2.0" = deps: f: updateFeatures f (rec {
    cfg_if."${deps.crc32fast."1.2.0".cfg_if}".default = true;
    crc32fast = fold recursiveUpdate {} [
      { "1.2.0".default = (f.crc32fast."1.2.0".default or true); }
      { "1.2.0".std =
        (f.crc32fast."1.2.0".std or false) ||
        (f.crc32fast."1.2.0".default or false) ||
        (crc32fast."1.2.0"."default" or false); }
    ];
  }) [
    (features_.cfg_if."${deps."crc32fast"."1.2.0"."cfg_if"}" deps)
  ];


# end
# digest-0.8.0

  crates.digest."0.8.0" = deps: { features?(features_.digest."0.8.0" deps {}) }: buildRustCrate {
    crateName = "digest";
    version = "0.8.0";
    authors = [ "RustCrypto Developers" ];
    sha256 = "1bsddd8vdmncmprks8b392yccf132wjwzrcy5wdy1kh05qm23il8";
    dependencies = mapFeatures features ([
      (crates."generic_array"."${deps."digest"."0.8.0"."generic_array"}" deps)
    ]);
    features = mkFeatures (features."digest"."0.8.0" or {});
  };
  features_.digest."0.8.0" = deps: f: updateFeatures f (rec {
    digest = fold recursiveUpdate {} [
      { "0.8.0".blobby =
        (f.digest."0.8.0".blobby or false) ||
        (f.digest."0.8.0".dev or false) ||
        (digest."0.8.0"."dev" or false); }
      { "0.8.0".default = (f.digest."0.8.0".default or true); }
    ];
    generic_array."${deps.digest."0.8.0".generic_array}".default = true;
  }) [
    (features_.generic_array."${deps."digest"."0.8.0"."generic_array"}" deps)
  ];


# end
# dirs-1.0.5

  crates.dirs."1.0.5" = deps: { features?(features_.dirs."1.0.5" deps {}) }: buildRustCrate {
    crateName = "dirs";
    version = "1.0.5";
    authors = [ "Simon Ochsenreither <simon@ochsenreither.de>" ];
    sha256 = "1py68zwwrhlj5vbz9f9ansjmhc8y4gs5bpamw9ycmqz030pprwf3";
    dependencies = (if kernel == "redox" then mapFeatures features ([
      (crates."redox_users"."${deps."dirs"."1.0.5"."redox_users"}" deps)
    ]) else [])
      ++ (if (kernel == "linux" || kernel == "darwin") then mapFeatures features ([
      (crates."libc"."${deps."dirs"."1.0.5"."libc"}" deps)
    ]) else [])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."dirs"."1.0.5"."winapi"}" deps)
    ]) else []);
  };
  features_.dirs."1.0.5" = deps: f: updateFeatures f (rec {
    dirs."1.0.5".default = (f.dirs."1.0.5".default or true);
    libc."${deps.dirs."1.0.5".libc}".default = true;
    redox_users."${deps.dirs."1.0.5".redox_users}".default = true;
    winapi = fold recursiveUpdate {} [
      { "${deps.dirs."1.0.5".winapi}"."knownfolders" = true; }
      { "${deps.dirs."1.0.5".winapi}"."objbase" = true; }
      { "${deps.dirs."1.0.5".winapi}"."shlobj" = true; }
      { "${deps.dirs."1.0.5".winapi}"."winbase" = true; }
      { "${deps.dirs."1.0.5".winapi}"."winerror" = true; }
      { "${deps.dirs."1.0.5".winapi}".default = true; }
    ];
  }) [
    (features_.redox_users."${deps."dirs"."1.0.5"."redox_users"}" deps)
    (features_.libc."${deps."dirs"."1.0.5"."libc"}" deps)
    (features_.winapi."${deps."dirs"."1.0.5"."winapi"}" deps)
  ];


# end
# err-derive-0.1.5

  crates.err_derive."0.1.5" = deps: { features?(features_.err_derive."0.1.5" deps {}) }: buildRustCrate {
    crateName = "err-derive";
    version = "0.1.5";
    authors = [ "Thomas Schaller <torkleyy@gmail.com>" ];
    sha256 = "0a6gq50nxg6a343q62i5ifhvjb7kba4zkpsfq2z16dik1hhjm53n";
    procMacro = true;
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."proc_macro2"."${deps."err_derive"."0.1.5"."proc_macro2"}" deps)
      (crates."quote"."${deps."err_derive"."0.1.5"."quote"}" deps)
      (crates."syn"."${deps."err_derive"."0.1.5"."syn"}" deps)
      (crates."synstructure"."${deps."err_derive"."0.1.5"."synstructure"}" deps)
    ]);

    buildDependencies = mapFeatures features ([
      (crates."rustc_version"."${deps."err_derive"."0.1.5"."rustc_version"}" deps)
    ]);
  };
  features_.err_derive."0.1.5" = deps: f: updateFeatures f (rec {
    err_derive."0.1.5".default = (f.err_derive."0.1.5".default or true);
    proc_macro2."${deps.err_derive."0.1.5".proc_macro2}".default = true;
    quote."${deps.err_derive."0.1.5".quote}".default = true;
    rustc_version."${deps.err_derive."0.1.5".rustc_version}".default = true;
    syn."${deps.err_derive."0.1.5".syn}".default = true;
    synstructure."${deps.err_derive."0.1.5".synstructure}".default = true;
  }) [
    (features_.proc_macro2."${deps."err_derive"."0.1.5"."proc_macro2"}" deps)
    (features_.quote."${deps."err_derive"."0.1.5"."quote"}" deps)
    (features_.syn."${deps."err_derive"."0.1.5"."syn"}" deps)
    (features_.synstructure."${deps."err_derive"."0.1.5"."synstructure"}" deps)
    (features_.rustc_version."${deps."err_derive"."0.1.5"."rustc_version"}" deps)
  ];


# end
# failure-0.1.5

  crates.failure."0.1.5" = deps: { features?(features_.failure."0.1.5" deps {}) }: buildRustCrate {
    crateName = "failure";
    version = "0.1.5";
    authors = [ "Without Boats <boats@mozilla.com>" ];
    sha256 = "1msaj1c0fg12dzyf4fhxqlx1gfx41lj2smdjmkc9hkrgajk2g3kx";
    dependencies = mapFeatures features ([
    ]
      ++ (if features.failure."0.1.5".backtrace or false then [ (crates.backtrace."${deps."failure"."0.1.5".backtrace}" deps) ] else [])
      ++ (if features.failure."0.1.5".failure_derive or false then [ (crates.failure_derive."${deps."failure"."0.1.5".failure_derive}" deps) ] else []));
    features = mkFeatures (features."failure"."0.1.5" or {});
  };
  features_.failure."0.1.5" = deps: f: updateFeatures f (rec {
    backtrace."${deps.failure."0.1.5".backtrace}".default = true;
    failure = fold recursiveUpdate {} [
      { "0.1.5".backtrace =
        (f.failure."0.1.5".backtrace or false) ||
        (f.failure."0.1.5".std or false) ||
        (failure."0.1.5"."std" or false); }
      { "0.1.5".default = (f.failure."0.1.5".default or true); }
      { "0.1.5".derive =
        (f.failure."0.1.5".derive or false) ||
        (f.failure."0.1.5".default or false) ||
        (failure."0.1.5"."default" or false); }
      { "0.1.5".failure_derive =
        (f.failure."0.1.5".failure_derive or false) ||
        (f.failure."0.1.5".derive or false) ||
        (failure."0.1.5"."derive" or false); }
      { "0.1.5".std =
        (f.failure."0.1.5".std or false) ||
        (f.failure."0.1.5".default or false) ||
        (failure."0.1.5"."default" or false); }
    ];
    failure_derive."${deps.failure."0.1.5".failure_derive}".default = true;
  }) [
    (features_.backtrace."${deps."failure"."0.1.5"."backtrace"}" deps)
    (features_.failure_derive."${deps."failure"."0.1.5"."failure_derive"}" deps)
  ];


# end
# failure_derive-0.1.5

  crates.failure_derive."0.1.5" = deps: { features?(features_.failure_derive."0.1.5" deps {}) }: buildRustCrate {
    crateName = "failure_derive";
    version = "0.1.5";
    authors = [ "Without Boats <woboats@gmail.com>" ];
    sha256 = "1wzk484b87r4qszcvdl2bkniv5ls4r2f2dshz7hmgiv6z4ln12g0";
    procMacro = true;
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."proc_macro2"."${deps."failure_derive"."0.1.5"."proc_macro2"}" deps)
      (crates."quote"."${deps."failure_derive"."0.1.5"."quote"}" deps)
      (crates."syn"."${deps."failure_derive"."0.1.5"."syn"}" deps)
      (crates."synstructure"."${deps."failure_derive"."0.1.5"."synstructure"}" deps)
    ]);
    features = mkFeatures (features."failure_derive"."0.1.5" or {});
  };
  features_.failure_derive."0.1.5" = deps: f: updateFeatures f (rec {
    failure_derive."0.1.5".default = (f.failure_derive."0.1.5".default or true);
    proc_macro2."${deps.failure_derive."0.1.5".proc_macro2}".default = true;
    quote."${deps.failure_derive."0.1.5".quote}".default = true;
    syn."${deps.failure_derive."0.1.5".syn}".default = true;
    synstructure."${deps.failure_derive."0.1.5".synstructure}".default = true;
  }) [
    (features_.proc_macro2."${deps."failure_derive"."0.1.5"."proc_macro2"}" deps)
    (features_.quote."${deps."failure_derive"."0.1.5"."quote"}" deps)
    (features_.syn."${deps."failure_derive"."0.1.5"."syn"}" deps)
    (features_.synstructure."${deps."failure_derive"."0.1.5"."synstructure"}" deps)
  ];


# end
# filetime-0.2.6

  crates.filetime."0.2.6" = deps: { features?(features_.filetime."0.2.6" deps {}) }: buildRustCrate {
    crateName = "filetime";
    version = "0.2.6";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    edition = "2018";
    sha256 = "07yx5lmv4mbv5ynqdzviwrgsji42vk8wjvggdiy5daklf6885f94";
    dependencies = mapFeatures features ([
      (crates."cfg_if"."${deps."filetime"."0.2.6"."cfg_if"}" deps)
    ])
      ++ (if kernel == "redox" then mapFeatures features ([
      (crates."redox_syscall"."${deps."filetime"."0.2.6"."redox_syscall"}" deps)
    ]) else [])
      ++ (if (kernel == "linux" || kernel == "darwin") then mapFeatures features ([
      (crates."libc"."${deps."filetime"."0.2.6"."libc"}" deps)
    ]) else [])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."filetime"."0.2.6"."winapi"}" deps)
    ]) else []);
  };
  features_.filetime."0.2.6" = deps: f: updateFeatures f (rec {
    cfg_if."${deps.filetime."0.2.6".cfg_if}".default = true;
    filetime."0.2.6".default = (f.filetime."0.2.6".default or true);
    libc."${deps.filetime."0.2.6".libc}".default = true;
    redox_syscall."${deps.filetime."0.2.6".redox_syscall}".default = true;
    winapi = fold recursiveUpdate {} [
      { "${deps.filetime."0.2.6".winapi}"."fileapi" = true; }
      { "${deps.filetime."0.2.6".winapi}"."minwindef" = true; }
      { "${deps.filetime."0.2.6".winapi}"."winbase" = true; }
      { "${deps.filetime."0.2.6".winapi}".default = true; }
    ];
  }) [
    (features_.cfg_if."${deps."filetime"."0.2.6"."cfg_if"}" deps)
    (features_.redox_syscall."${deps."filetime"."0.2.6"."redox_syscall"}" deps)
    (features_.libc."${deps."filetime"."0.2.6"."libc"}" deps)
    (features_.winapi."${deps."filetime"."0.2.6"."winapi"}" deps)
  ];


# end
# fixedbitset-0.1.9

  crates.fixedbitset."0.1.9" = deps: { features?(features_.fixedbitset."0.1.9" deps {}) }: buildRustCrate {
    crateName = "fixedbitset";
    version = "0.1.9";
    authors = [ "bluss" ];
    sha256 = "1bkb5aq7h9p4rzlgxagnda1f0dd11q0qz41bmdy11z18q1p8igy1";
  };
  features_.fixedbitset."0.1.9" = deps: f: updateFeatures f (rec {
    fixedbitset."0.1.9".default = (f.fixedbitset."0.1.9".default or true);
  }) [];


# end
# fuchsia-cprng-0.1.1

  crates.fuchsia_cprng."0.1.1" = deps: { features?(features_.fuchsia_cprng."0.1.1" deps {}) }: buildRustCrate {
    crateName = "fuchsia-cprng";
    version = "0.1.1";
    authors = [ "Erick Tryzelaar <etryzelaar@google.com>" ];
    edition = "2018";
    sha256 = "07apwv9dj716yjlcj29p94vkqn5zmfh7hlrqvrjx3wzshphc95h9";
  };
  features_.fuchsia_cprng."0.1.1" = deps: f: updateFeatures f (rec {
    fuchsia_cprng."0.1.1".default = (f.fuchsia_cprng."0.1.1".default or true);
  }) [];


# end
# fuse-0.3.1

  crates.fuse."0.3.1" = deps: { features?(features_.fuse."0.3.1" deps {}) }: buildRustCrate {
    crateName = "fuse";
    version = "0.3.1";
    authors = [ "Andreas Neuhaus <zargony@zargony.com>" ];
    sha256 = "06s8fmccm6armmad9wyashxi3lqysw8nyhsgm33nbp3gdh3b9n3d";
    libPath = "src/lib.rs";
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."libc"."${deps."fuse"."0.3.1"."libc"}" deps)
      (crates."log"."${deps."fuse"."0.3.1"."log"}" deps)
      (crates."thread_scoped"."${deps."fuse"."0.3.1"."thread_scoped"}" deps)
      (crates."time"."${deps."fuse"."0.3.1"."time"}" deps)
    ]);

    buildDependencies = mapFeatures features ([
      (crates."pkg_config"."${deps."fuse"."0.3.1"."pkg_config"}" deps)
    ]);
  };
  features_.fuse."0.3.1" = deps: f: updateFeatures f (rec {
    fuse."0.3.1".default = (f.fuse."0.3.1".default or true);
    libc."${deps.fuse."0.3.1".libc}".default = true;
    log."${deps.fuse."0.3.1".log}".default = true;
    pkg_config."${deps.fuse."0.3.1".pkg_config}".default = true;
    thread_scoped."${deps.fuse."0.3.1".thread_scoped}".default = true;
    time."${deps.fuse."0.3.1".time}".default = true;
  }) [
    (features_.libc."${deps."fuse"."0.3.1"."libc"}" deps)
    (features_.log."${deps."fuse"."0.3.1"."log"}" deps)
    (features_.thread_scoped."${deps."fuse"."0.3.1"."thread_scoped"}" deps)
    (features_.time."${deps."fuse"."0.3.1"."time"}" deps)
    (features_.pkg_config."${deps."fuse"."0.3.1"."pkg_config"}" deps)
  ];


# end
# generic-array-0.12.0

  crates.generic_array."0.12.0" = deps: { features?(features_.generic_array."0.12.0" deps {}) }: buildRustCrate {
    crateName = "generic-array";
    version = "0.12.0";
    authors = [ "Bartłomiej Kamiński <fizyk20@gmail.com>" "Aaron Trent <novacrazy@gmail.com>" ];
    sha256 = "12fjpkx1ilqlmynis45g0gh69zkad6jnsc589j64z3idk18lvv91";
    libName = "generic_array";
    dependencies = mapFeatures features ([
      (crates."typenum"."${deps."generic_array"."0.12.0"."typenum"}" deps)
    ]);
  };
  features_.generic_array."0.12.0" = deps: f: updateFeatures f (rec {
    generic_array."0.12.0".default = (f.generic_array."0.12.0".default or true);
    typenum."${deps.generic_array."0.12.0".typenum}".default = true;
  }) [
    (features_.typenum."${deps."generic_array"."0.12.0"."typenum"}" deps)
  ];


# end
# httparse-1.3.3

  crates.httparse."1.3.3" = deps: { features?(features_.httparse."1.3.3" deps {}) }: buildRustCrate {
    crateName = "httparse";
    version = "1.3.3";
    authors = [ "Sean McArthur <sean@seanmonstar.com>" ];
    sha256 = "1jymxy4bl0mzgp2dx0pzqzbr72sw5jmr5sjqiry4xr88z4z9qlyx";
    build = "build.rs";
    features = mkFeatures (features."httparse"."1.3.3" or {});
  };
  features_.httparse."1.3.3" = deps: f: updateFeatures f (rec {
    httparse = fold recursiveUpdate {} [
      { "1.3.3".default = (f.httparse."1.3.3".default or true); }
      { "1.3.3".std =
        (f.httparse."1.3.3".std or false) ||
        (f.httparse."1.3.3".default or false) ||
        (httparse."1.3.3"."default" or false); }
    ];
  }) [];


# end
# hyper-0.10.16

  crates.hyper."0.10.16" = deps: { features?(features_.hyper."0.10.16" deps {}) }: buildRustCrate {
    crateName = "hyper";
    version = "0.10.16";
    authors = [ "Sean McArthur <sean.monstar@gmail.com>" "Jonathan Reem <jonathan.reem@gmail.com>" ];
    sha256 = "078jqmrjk7gdrfqjnydhyh8vb93vr4zymid84l7x67abary947x5";
    dependencies = mapFeatures features ([
      (crates."base64"."${deps."hyper"."0.10.16"."base64"}" deps)
      (crates."httparse"."${deps."hyper"."0.10.16"."httparse"}" deps)
      (crates."language_tags"."${deps."hyper"."0.10.16"."language_tags"}" deps)
      (crates."log"."${deps."hyper"."0.10.16"."log"}" deps)
      (crates."mime"."${deps."hyper"."0.10.16"."mime"}" deps)
      (crates."num_cpus"."${deps."hyper"."0.10.16"."num_cpus"}" deps)
      (crates."time"."${deps."hyper"."0.10.16"."time"}" deps)
      (crates."traitobject"."${deps."hyper"."0.10.16"."traitobject"}" deps)
      (crates."typeable"."${deps."hyper"."0.10.16"."typeable"}" deps)
      (crates."unicase"."${deps."hyper"."0.10.16"."unicase"}" deps)
      (crates."url"."${deps."hyper"."0.10.16"."url"}" deps)
    ]);
    features = mkFeatures (features."hyper"."0.10.16" or {});
  };
  features_.hyper."0.10.16" = deps: f: updateFeatures f (rec {
    base64."${deps.hyper."0.10.16".base64}".default = true;
    httparse."${deps.hyper."0.10.16".httparse}".default = true;
    hyper."0.10.16".default = (f.hyper."0.10.16".default or true);
    language_tags."${deps.hyper."0.10.16".language_tags}".default = true;
    log."${deps.hyper."0.10.16".log}".default = true;
    mime."${deps.hyper."0.10.16".mime}".default = true;
    num_cpus."${deps.hyper."0.10.16".num_cpus}".default = true;
    time."${deps.hyper."0.10.16".time}".default = true;
    traitobject."${deps.hyper."0.10.16".traitobject}".default = true;
    typeable."${deps.hyper."0.10.16".typeable}".default = true;
    unicase."${deps.hyper."0.10.16".unicase}".default = true;
    url."${deps.hyper."0.10.16".url}".default = true;
  }) [
    (features_.base64."${deps."hyper"."0.10.16"."base64"}" deps)
    (features_.httparse."${deps."hyper"."0.10.16"."httparse"}" deps)
    (features_.language_tags."${deps."hyper"."0.10.16"."language_tags"}" deps)
    (features_.log."${deps."hyper"."0.10.16"."log"}" deps)
    (features_.mime."${deps."hyper"."0.10.16"."mime"}" deps)
    (features_.num_cpus."${deps."hyper"."0.10.16"."num_cpus"}" deps)
    (features_.time."${deps."hyper"."0.10.16"."time"}" deps)
    (features_.traitobject."${deps."hyper"."0.10.16"."traitobject"}" deps)
    (features_.typeable."${deps."hyper"."0.10.16"."typeable"}" deps)
    (features_.unicase."${deps."hyper"."0.10.16"."unicase"}" deps)
    (features_.url."${deps."hyper"."0.10.16"."url"}" deps)
  ];


# end
# hyper-rustls-0.6.2

  crates.hyper_rustls."0.6.2" = deps: { features?(features_.hyper_rustls."0.6.2" deps {}) }: buildRustCrate {
    crateName = "hyper-rustls";
    version = "0.6.2";
    authors = [ "Joseph Birr-Pixton <jpixton@gmail.com>" ];
    sha256 = "1qbzq1vlafd40s6rz20m85q5rxgpns824rnkjbfisfbk37ji363v";
    dependencies = mapFeatures features ([
      (crates."hyper"."${deps."hyper_rustls"."0.6.2"."hyper"}" deps)
      (crates."rustls"."${deps."hyper_rustls"."0.6.2"."rustls"}" deps)
      (crates."webpki"."${deps."hyper_rustls"."0.6.2"."webpki"}" deps)
      (crates."webpki_roots"."${deps."hyper_rustls"."0.6.2"."webpki_roots"}" deps)
    ]);
  };
  features_.hyper_rustls."0.6.2" = deps: f: updateFeatures f (rec {
    hyper."${deps.hyper_rustls."0.6.2".hyper}".default = (f.hyper."${deps.hyper_rustls."0.6.2".hyper}".default or false);
    hyper_rustls."0.6.2".default = (f.hyper_rustls."0.6.2".default or true);
    rustls."${deps.hyper_rustls."0.6.2".rustls}".default = true;
    webpki."${deps.hyper_rustls."0.6.2".webpki}".default = true;
    webpki_roots."${deps.hyper_rustls."0.6.2".webpki_roots}".default = true;
  }) [
    (features_.hyper."${deps."hyper_rustls"."0.6.2"."hyper"}" deps)
    (features_.rustls."${deps."hyper_rustls"."0.6.2"."rustls"}" deps)
    (features_.webpki."${deps."hyper_rustls"."0.6.2"."webpki"}" deps)
    (features_.webpki_roots."${deps."hyper_rustls"."0.6.2"."webpki_roots"}" deps)
  ];


# end
# idna-0.1.5

  crates.idna."0.1.5" = deps: { features?(features_.idna."0.1.5" deps {}) }: buildRustCrate {
    crateName = "idna";
    version = "0.1.5";
    authors = [ "The rust-url developers" ];
    sha256 = "1gwgl19rz5vzi67rrhamczhxy050f5ynx4ybabfapyalv7z1qmjy";
    dependencies = mapFeatures features ([
      (crates."matches"."${deps."idna"."0.1.5"."matches"}" deps)
      (crates."unicode_bidi"."${deps."idna"."0.1.5"."unicode_bidi"}" deps)
      (crates."unicode_normalization"."${deps."idna"."0.1.5"."unicode_normalization"}" deps)
    ]);
  };
  features_.idna."0.1.5" = deps: f: updateFeatures f (rec {
    idna."0.1.5".default = (f.idna."0.1.5".default or true);
    matches."${deps.idna."0.1.5".matches}".default = true;
    unicode_bidi."${deps.idna."0.1.5".unicode_bidi}".default = true;
    unicode_normalization."${deps.idna."0.1.5".unicode_normalization}".default = true;
  }) [
    (features_.matches."${deps."idna"."0.1.5"."matches"}" deps)
    (features_.unicode_bidi."${deps."idna"."0.1.5"."unicode_bidi"}" deps)
    (features_.unicode_normalization."${deps."idna"."0.1.5"."unicode_normalization"}" deps)
  ];


# end
# keccak-0.1.0

  crates.keccak."0.1.0" = deps: { features?(features_.keccak."0.1.0" deps {}) }: buildRustCrate {
    crateName = "keccak";
    version = "0.1.0";
    authors = [ "RustCrypto Developers" ];
    sha256 = "0hs47f8pq40pk99vhraz27x98r1h5vgs7kcz4gsnhs58npqiz006";
    features = mkFeatures (features."keccak"."0.1.0" or {});
  };
  features_.keccak."0.1.0" = deps: f: updateFeatures f (rec {
    keccak."0.1.0".default = (f.keccak."0.1.0".default or true);
  }) [];


# end
# kernel32-sys-0.2.2

  crates.kernel32_sys."0.2.2" = deps: { features?(features_.kernel32_sys."0.2.2" deps {}) }: buildRustCrate {
    crateName = "kernel32-sys";
    version = "0.2.2";
    authors = [ "Peter Atashian <retep998@gmail.com>" ];
    sha256 = "1lrw1hbinyvr6cp28g60z97w32w8vsk6pahk64pmrv2fmby8srfj";
    libName = "kernel32";
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."winapi"."${deps."kernel32_sys"."0.2.2"."winapi"}" deps)
    ]);

    buildDependencies = mapFeatures features ([
      (crates."winapi_build"."${deps."kernel32_sys"."0.2.2"."winapi_build"}" deps)
    ]);
  };
  features_.kernel32_sys."0.2.2" = deps: f: updateFeatures f (rec {
    kernel32_sys."0.2.2".default = (f.kernel32_sys."0.2.2".default or true);
    winapi."${deps.kernel32_sys."0.2.2".winapi}".default = true;
    winapi_build."${deps.kernel32_sys."0.2.2".winapi_build}".default = true;
  }) [
    (features_.winapi."${deps."kernel32_sys"."0.2.2"."winapi"}" deps)
    (features_.winapi_build."${deps."kernel32_sys"."0.2.2"."winapi_build"}" deps)
  ];


# end
# language-tags-0.2.2

  crates.language_tags."0.2.2" = deps: { features?(features_.language_tags."0.2.2" deps {}) }: buildRustCrate {
    crateName = "language-tags";
    version = "0.2.2";
    authors = [ "Pyfisch <pyfisch@gmail.com>" ];
    sha256 = "1zkrdzsqzzc7509kd7nngdwrp461glm2g09kqpzaqksp82frjdvy";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."language_tags"."0.2.2" or {});
  };
  features_.language_tags."0.2.2" = deps: f: updateFeatures f (rec {
    language_tags = fold recursiveUpdate {} [
      { "0.2.2".default = (f.language_tags."0.2.2".default or true); }
      { "0.2.2".heapsize =
        (f.language_tags."0.2.2".heapsize or false) ||
        (f.language_tags."0.2.2".heap_size or false) ||
        (language_tags."0.2.2"."heap_size" or false); }
      { "0.2.2".heapsize_plugin =
        (f.language_tags."0.2.2".heapsize_plugin or false) ||
        (f.language_tags."0.2.2".heap_size or false) ||
        (language_tags."0.2.2"."heap_size" or false); }
    ];
  }) [];


# end
# lazy_static-1.3.0

  crates.lazy_static."1.3.0" = deps: { features?(features_.lazy_static."1.3.0" deps {}) }: buildRustCrate {
    crateName = "lazy_static";
    version = "1.3.0";
    authors = [ "Marvin Löbel <loebel.marvin@gmail.com>" ];
    sha256 = "1vv47va18ydk7dx5paz88g3jy1d3lwbx6qpxkbj8gyfv770i4b1y";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."lazy_static"."1.3.0" or {});
  };
  features_.lazy_static."1.3.0" = deps: f: updateFeatures f (rec {
    lazy_static = fold recursiveUpdate {} [
      { "1.3.0".default = (f.lazy_static."1.3.0".default or true); }
      { "1.3.0".spin =
        (f.lazy_static."1.3.0".spin or false) ||
        (f.lazy_static."1.3.0".spin_no_std or false) ||
        (lazy_static."1.3.0"."spin_no_std" or false); }
    ];
  }) [];


# end
# libc-0.2.58

  crates.libc."0.2.58" = deps: { features?(features_.libc."0.2.58" deps {}) }: buildRustCrate {
    crateName = "libc";
    version = "0.2.58";
    authors = [ "The Rust Project Developers" ];
    sha256 = "06yk3c0qlcn925ap1rrhikpzgwf504ydkcadj41kib7a06f66k7c";
    build = "build.rs";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."libc"."0.2.58" or {});
  };
  features_.libc."0.2.58" = deps: f: updateFeatures f (rec {
    libc = fold recursiveUpdate {} [
      { "0.2.58".align =
        (f.libc."0.2.58".align or false) ||
        (f.libc."0.2.58".rustc-dep-of-std or false) ||
        (libc."0.2.58"."rustc-dep-of-std" or false); }
      { "0.2.58".default = (f.libc."0.2.58".default or true); }
      { "0.2.58".rustc-std-workspace-core =
        (f.libc."0.2.58".rustc-std-workspace-core or false) ||
        (f.libc."0.2.58".rustc-dep-of-std or false) ||
        (libc."0.2.58"."rustc-dep-of-std" or false); }
      { "0.2.58".std =
        (f.libc."0.2.58".std or false) ||
        (f.libc."0.2.58".default or false) ||
        (libc."0.2.58"."default" or false) ||
        (f.libc."0.2.58".use_std or false) ||
        (libc."0.2.58"."use_std" or false); }
    ];
  }) [];


# end
# libflate-0.1.23

  crates.libflate."0.1.23" = deps: { features?(features_.libflate."0.1.23" deps {}) }: buildRustCrate {
    crateName = "libflate";
    version = "0.1.23";
    authors = [ "Takeru Ohta <phjgt308@gmail.com>" ];
    sha256 = "1nj1acqc4qxnspzfn8q3gsp78kcy6bnj0bix5z74swsk9hsb6zk6";
    dependencies = mapFeatures features ([
      (crates."adler32"."${deps."libflate"."0.1.23"."adler32"}" deps)
      (crates."byteorder"."${deps."libflate"."0.1.23"."byteorder"}" deps)
      (crates."crc32fast"."${deps."libflate"."0.1.23"."crc32fast"}" deps)
    ]);
  };
  features_.libflate."0.1.23" = deps: f: updateFeatures f (rec {
    adler32."${deps.libflate."0.1.23".adler32}".default = true;
    byteorder."${deps.libflate."0.1.23".byteorder}".default = true;
    crc32fast."${deps.libflate."0.1.23".crc32fast}".default = true;
    libflate."0.1.23".default = (f.libflate."0.1.23".default or true);
  }) [
    (features_.adler32."${deps."libflate"."0.1.23"."adler32"}" deps)
    (features_.byteorder."${deps."libflate"."0.1.23"."byteorder"}" deps)
    (features_.crc32fast."${deps."libflate"."0.1.23"."crc32fast"}" deps)
  ];


# end
# liner-0.4.4

  crates.liner."0.4.4" = deps: { features?(features_.liner."0.4.4" deps {}) }: buildRustCrate {
    crateName = "liner";
    version = "0.4.4";
    authors = [ "MovingtoMars <definitelynotliam@gmail.com>" ];
    sha256 = "0xs6j1qwzmgb0dcpkd3w9dzvbgdlzfxv4k0spq062r7v57wwsm88";
    crateBin =
      [{  name = "liner_test";  path = "src/main.rs"; }];
    dependencies = mapFeatures features ([
      (crates."bytecount"."${deps."liner"."0.4.4"."bytecount"}" deps)
      (crates."termion"."${deps."liner"."0.4.4"."termion"}" deps)
      (crates."unicode_width"."${deps."liner"."0.4.4"."unicode_width"}" deps)
    ]);
  };
  features_.liner."0.4.4" = deps: f: updateFeatures f (rec {
    bytecount."${deps.liner."0.4.4".bytecount}".default = true;
    liner."0.4.4".default = (f.liner."0.4.4".default or true);
    termion."${deps.liner."0.4.4".termion}".default = true;
    unicode_width."${deps.liner."0.4.4".unicode_width}".default = true;
  }) [
    (features_.bytecount."${deps."liner"."0.4.4"."bytecount"}" deps)
    (features_.termion."${deps."liner"."0.4.4"."termion"}" deps)
    (features_.unicode_width."${deps."liner"."0.4.4"."unicode_width"}" deps)
  ];


# end
# log-0.3.9

  crates.log."0.3.9" = deps: { features?(features_.log."0.3.9" deps {}) }: buildRustCrate {
    crateName = "log";
    version = "0.3.9";
    authors = [ "The Rust Project Developers" ];
    sha256 = "19i9pwp7lhaqgzangcpw00kc3zsgcqcx84crv07xgz3v7d3kvfa2";
    dependencies = mapFeatures features ([
      (crates."log"."${deps."log"."0.3.9"."log"}" deps)
    ]);
    features = mkFeatures (features."log"."0.3.9" or {});
  };
  features_.log."0.3.9" = deps: f: updateFeatures f (rec {
    log = fold recursiveUpdate {} [
      { "${deps.log."0.3.9".log}"."max_level_debug" =
        (f.log."${deps.log."0.3.9".log}"."max_level_debug" or false) ||
        (log."0.3.9"."max_level_debug" or false) ||
        (f."log"."0.3.9"."max_level_debug" or false); }
      { "${deps.log."0.3.9".log}"."max_level_error" =
        (f.log."${deps.log."0.3.9".log}"."max_level_error" or false) ||
        (log."0.3.9"."max_level_error" or false) ||
        (f."log"."0.3.9"."max_level_error" or false); }
      { "${deps.log."0.3.9".log}"."max_level_info" =
        (f.log."${deps.log."0.3.9".log}"."max_level_info" or false) ||
        (log."0.3.9"."max_level_info" or false) ||
        (f."log"."0.3.9"."max_level_info" or false); }
      { "${deps.log."0.3.9".log}"."max_level_off" =
        (f.log."${deps.log."0.3.9".log}"."max_level_off" or false) ||
        (log."0.3.9"."max_level_off" or false) ||
        (f."log"."0.3.9"."max_level_off" or false); }
      { "${deps.log."0.3.9".log}"."max_level_trace" =
        (f.log."${deps.log."0.3.9".log}"."max_level_trace" or false) ||
        (log."0.3.9"."max_level_trace" or false) ||
        (f."log"."0.3.9"."max_level_trace" or false); }
      { "${deps.log."0.3.9".log}"."max_level_warn" =
        (f.log."${deps.log."0.3.9".log}"."max_level_warn" or false) ||
        (log."0.3.9"."max_level_warn" or false) ||
        (f."log"."0.3.9"."max_level_warn" or false); }
      { "${deps.log."0.3.9".log}"."release_max_level_debug" =
        (f.log."${deps.log."0.3.9".log}"."release_max_level_debug" or false) ||
        (log."0.3.9"."release_max_level_debug" or false) ||
        (f."log"."0.3.9"."release_max_level_debug" or false); }
      { "${deps.log."0.3.9".log}"."release_max_level_error" =
        (f.log."${deps.log."0.3.9".log}"."release_max_level_error" or false) ||
        (log."0.3.9"."release_max_level_error" or false) ||
        (f."log"."0.3.9"."release_max_level_error" or false); }
      { "${deps.log."0.3.9".log}"."release_max_level_info" =
        (f.log."${deps.log."0.3.9".log}"."release_max_level_info" or false) ||
        (log."0.3.9"."release_max_level_info" or false) ||
        (f."log"."0.3.9"."release_max_level_info" or false); }
      { "${deps.log."0.3.9".log}"."release_max_level_off" =
        (f.log."${deps.log."0.3.9".log}"."release_max_level_off" or false) ||
        (log."0.3.9"."release_max_level_off" or false) ||
        (f."log"."0.3.9"."release_max_level_off" or false); }
      { "${deps.log."0.3.9".log}"."release_max_level_trace" =
        (f.log."${deps.log."0.3.9".log}"."release_max_level_trace" or false) ||
        (log."0.3.9"."release_max_level_trace" or false) ||
        (f."log"."0.3.9"."release_max_level_trace" or false); }
      { "${deps.log."0.3.9".log}"."release_max_level_warn" =
        (f.log."${deps.log."0.3.9".log}"."release_max_level_warn" or false) ||
        (log."0.3.9"."release_max_level_warn" or false) ||
        (f."log"."0.3.9"."release_max_level_warn" or false); }
      { "${deps.log."0.3.9".log}"."std" =
        (f.log."${deps.log."0.3.9".log}"."std" or false) ||
        (log."0.3.9"."use_std" or false) ||
        (f."log"."0.3.9"."use_std" or false); }
      { "${deps.log."0.3.9".log}".default = true; }
      { "0.3.9".default = (f.log."0.3.9".default or true); }
      { "0.3.9".use_std =
        (f.log."0.3.9".use_std or false) ||
        (f.log."0.3.9".default or false) ||
        (log."0.3.9"."default" or false); }
    ];
  }) [
    (features_.log."${deps."log"."0.3.9"."log"}" deps)
  ];


# end
# log-0.4.6

  crates.log."0.4.6" = deps: { features?(features_.log."0.4.6" deps {}) }: buildRustCrate {
    crateName = "log";
    version = "0.4.6";
    authors = [ "The Rust Project Developers" ];
    sha256 = "1nd8dl9mvc9vd6fks5d4gsxaz990xi6rzlb8ymllshmwi153vngr";
    dependencies = mapFeatures features ([
      (crates."cfg_if"."${deps."log"."0.4.6"."cfg_if"}" deps)
    ]);
    features = mkFeatures (features."log"."0.4.6" or {});
  };
  features_.log."0.4.6" = deps: f: updateFeatures f (rec {
    cfg_if."${deps.log."0.4.6".cfg_if}".default = true;
    log."0.4.6".default = (f.log."0.4.6".default or true);
  }) [
    (features_.cfg_if."${deps."log"."0.4.6"."cfg_if"}" deps)
  ];


# end
# matches-0.1.8

  crates.matches."0.1.8" = deps: { features?(features_.matches."0.1.8" deps {}) }: buildRustCrate {
    crateName = "matches";
    version = "0.1.8";
    authors = [ "Simon Sapin <simon.sapin@exyr.org>" ];
    sha256 = "03hl636fg6xggy0a26200xs74amk3k9n0908rga2szn68agyz3cv";
    libPath = "lib.rs";
  };
  features_.matches."0.1.8" = deps: f: updateFeatures f (rec {
    matches."0.1.8".default = (f.matches."0.1.8".default or true);
  }) [];


# end
# mime-0.2.6

  crates.mime."0.2.6" = deps: { features?(features_.mime."0.2.6" deps {}) }: buildRustCrate {
    crateName = "mime";
    version = "0.2.6";
    authors = [ "Sean McArthur <sean.monstar@gmail.com>" ];
    sha256 = "1skwwa0j3kqd8rm9387zgabjhp07zj99q71nzlhba4lrz9r911b3";
    dependencies = mapFeatures features ([
      (crates."log"."${deps."mime"."0.2.6"."log"}" deps)
    ]);
    features = mkFeatures (features."mime"."0.2.6" or {});
  };
  features_.mime."0.2.6" = deps: f: updateFeatures f (rec {
    log."${deps.mime."0.2.6".log}".default = true;
    mime = fold recursiveUpdate {} [
      { "0.2.6".default = (f.mime."0.2.6".default or true); }
      { "0.2.6".heapsize =
        (f.mime."0.2.6".heapsize or false) ||
        (f.mime."0.2.6".heap_size or false) ||
        (mime."0.2.6"."heap_size" or false); }
    ];
  }) [
    (features_.log."${deps."mime"."0.2.6"."log"}" deps)
  ];


# end
# nodrop-0.1.13

  crates.nodrop."0.1.13" = deps: { features?(features_.nodrop."0.1.13" deps {}) }: buildRustCrate {
    crateName = "nodrop";
    version = "0.1.13";
    authors = [ "bluss" ];
    sha256 = "0gkfx6wihr9z0m8nbdhma5pyvbipznjpkzny2d4zkc05b0vnhinb";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."nodrop"."0.1.13" or {});
  };
  features_.nodrop."0.1.13" = deps: f: updateFeatures f (rec {
    nodrop = fold recursiveUpdate {} [
      { "0.1.13".default = (f.nodrop."0.1.13".default or true); }
      { "0.1.13".nodrop-union =
        (f.nodrop."0.1.13".nodrop-union or false) ||
        (f.nodrop."0.1.13".use_union or false) ||
        (nodrop."0.1.13"."use_union" or false); }
      { "0.1.13".std =
        (f.nodrop."0.1.13".std or false) ||
        (f.nodrop."0.1.13".default or false) ||
        (nodrop."0.1.13"."default" or false); }
    ];
  }) [];


# end
# num_cpus-1.10.1

  crates.num_cpus."1.10.1" = deps: { features?(features_.num_cpus."1.10.1" deps {}) }: buildRustCrate {
    crateName = "num_cpus";
    version = "1.10.1";
    authors = [ "Sean McArthur <sean@seanmonstar.com>" ];
    sha256 = "1zi5s2cbnqqb0k0kdd6gqn2x97f9bssv44430h6w28awwzppyh8i";
    dependencies = mapFeatures features ([
      (crates."libc"."${deps."num_cpus"."1.10.1"."libc"}" deps)
    ]);
  };
  features_.num_cpus."1.10.1" = deps: f: updateFeatures f (rec {
    libc."${deps.num_cpus."1.10.1".libc}".default = true;
    num_cpus."1.10.1".default = (f.num_cpus."1.10.1".default or true);
  }) [
    (features_.libc."${deps."num_cpus"."1.10.1"."libc"}" deps)
  ];


# end
# numtoa-0.1.0

  crates.numtoa."0.1.0" = deps: { features?(features_.numtoa."0.1.0" deps {}) }: buildRustCrate {
    crateName = "numtoa";
    version = "0.1.0";
    authors = [ "Michael Aaron Murphy <mmstickman@gmail.com>" ];
    sha256 = "1i2wxr96bb1rvax15z843126z3bnl2frpx69vxsp95r96wr24j08";
    features = mkFeatures (features."numtoa"."0.1.0" or {});
  };
  features_.numtoa."0.1.0" = deps: f: updateFeatures f (rec {
    numtoa."0.1.0".default = (f.numtoa."0.1.0".default or true);
  }) [];


# end
# opaque-debug-0.2.2

  crates.opaque_debug."0.2.2" = deps: { features?(features_.opaque_debug."0.2.2" deps {}) }: buildRustCrate {
    crateName = "opaque-debug";
    version = "0.2.2";
    authors = [ "RustCrypto Developers" ];
    sha256 = "0dkzsnxpg50gz3gjcdzc4j6g4s0jphllg6q7jqmsy9nd9glidy74";
  };
  features_.opaque_debug."0.2.2" = deps: f: updateFeatures f (rec {
    opaque_debug."0.2.2".default = (f.opaque_debug."0.2.2".default or true);
  }) [];


# end
# ordermap-0.2.13

  crates.ordermap."0.2.13" = deps: { features?(features_.ordermap."0.2.13" deps {}) }: buildRustCrate {
    crateName = "ordermap";
    version = "0.2.13";
    authors = [ "bluss" ];
    sha256 = "1qcdv6rk0j1mah38i1asgadn6mynwbvqgj8vq730yvv2gl03fnsl";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."ordermap"."0.2.13" or {});
  };
  features_.ordermap."0.2.13" = deps: f: updateFeatures f (rec {
    ordermap = fold recursiveUpdate {} [
      { "0.2.13".default = (f.ordermap."0.2.13".default or true); }
      { "0.2.13".serde =
        (f.ordermap."0.2.13".serde or false) ||
        (f.ordermap."0.2.13".serde-1 or false) ||
        (ordermap."0.2.13"."serde-1" or false); }
    ];
  }) [];


# end
# ordermap-0.3.5

  crates.ordermap."0.3.5" = deps: { features?(features_.ordermap."0.3.5" deps {}) }: buildRustCrate {
    crateName = "ordermap";
    version = "0.3.5";
    authors = [ "bluss" ];
    sha256 = "0b6vxfyh627yqm6war3392g1hhi4dbn49ibx2qv6mv490jdhv7d3";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."ordermap"."0.3.5" or {});
  };
  features_.ordermap."0.3.5" = deps: f: updateFeatures f (rec {
    ordermap = fold recursiveUpdate {} [
      { "0.3.5".default = (f.ordermap."0.3.5".default or true); }
      { "0.3.5".serde =
        (f.ordermap."0.3.5".serde or false) ||
        (f.ordermap."0.3.5".serde-1 or false) ||
        (ordermap."0.3.5"."serde-1" or false); }
    ];
  }) [];


# end
# partition-identity-0.2.6

  crates.partition_identity."0.2.6" = deps: { features?(features_.partition_identity."0.2.6" deps {}) }: buildRustCrate {
    crateName = "partition-identity";
    version = "0.2.6";
    authors = [ "Michael Aaron Murphy <mmstickman@gmail.com>" ];
    sha256 = "0w0hk3frfk53m4n6qv56ir9fwbzf47y33nw2bpn7li9h5sy6vyag";
    dependencies = mapFeatures features ([
      (crates."err_derive"."${deps."partition_identity"."0.2.6"."err_derive"}" deps)
    ]);
  };
  features_.partition_identity."0.2.6" = deps: f: updateFeatures f (rec {
    err_derive."${deps.partition_identity."0.2.6".err_derive}".default = true;
    partition_identity."0.2.6".default = (f.partition_identity."0.2.6".default or true);
  }) [
    (features_.err_derive."${deps."partition_identity"."0.2.6"."err_derive"}" deps)
  ];


# end
# pbr-1.0.1

  crates.pbr."1.0.1" = deps: { features?(features_.pbr."1.0.1" deps {}) }: buildRustCrate {
    crateName = "pbr";
    version = "1.0.1";
    authors = [ "Ariel Mashraki <ariel@mashraki.co.il>" "Steven Fackler <sfackler@gmail.com>" ];
    sha256 = "0yvg7jcsb05pxshp2mky1a5hwch2b93apid2xpynjbqyzymq6rl9";
    dependencies = mapFeatures features ([
      (crates."libc"."${deps."pbr"."1.0.1"."libc"}" deps)
      (crates."time"."${deps."pbr"."1.0.1"."time"}" deps)
    ])
      ++ (if kernel == "redox" then mapFeatures features ([
      (crates."termion"."${deps."pbr"."1.0.1"."termion"}" deps)
    ]) else [])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."kernel32_sys"."${deps."pbr"."1.0.1"."kernel32_sys"}" deps)
      (crates."winapi"."${deps."pbr"."1.0.1"."winapi"}" deps)
    ]) else []);
  };
  features_.pbr."1.0.1" = deps: f: updateFeatures f (rec {
    kernel32_sys."${deps.pbr."1.0.1".kernel32_sys}".default = true;
    libc."${deps.pbr."1.0.1".libc}".default = true;
    pbr."1.0.1".default = (f.pbr."1.0.1".default or true);
    termion."${deps.pbr."1.0.1".termion}".default = true;
    time."${deps.pbr."1.0.1".time}".default = true;
    winapi."${deps.pbr."1.0.1".winapi}".default = true;
  }) [
    (features_.libc."${deps."pbr"."1.0.1"."libc"}" deps)
    (features_.time."${deps."pbr"."1.0.1"."time"}" deps)
    (features_.termion."${deps."pbr"."1.0.1"."termion"}" deps)
    (features_.kernel32_sys."${deps."pbr"."1.0.1"."kernel32_sys"}" deps)
    (features_.winapi."${deps."pbr"."1.0.1"."winapi"}" deps)
  ];


# end
# percent-encoding-1.0.1

  crates.percent_encoding."1.0.1" = deps: { features?(features_.percent_encoding."1.0.1" deps {}) }: buildRustCrate {
    crateName = "percent-encoding";
    version = "1.0.1";
    authors = [ "The rust-url developers" ];
    sha256 = "04ahrp7aw4ip7fmadb0bknybmkfav0kk0gw4ps3ydq5w6hr0ib5i";
    libPath = "lib.rs";
  };
  features_.percent_encoding."1.0.1" = deps: f: updateFeatures f (rec {
    percent_encoding."1.0.1".default = (f.percent_encoding."1.0.1".default or true);
  }) [];


# end
# petgraph-0.4.13

  crates.petgraph."0.4.13" = deps: { features?(features_.petgraph."0.4.13" deps {}) }: buildRustCrate {
    crateName = "petgraph";
    version = "0.4.13";
    authors = [ "bluss" "mitchmindtree" ];
    sha256 = "0a8k12b9vd0bndwqhafa853w186axdw05bv4kqjimyaz67428g1i";
    dependencies = mapFeatures features ([
      (crates."fixedbitset"."${deps."petgraph"."0.4.13"."fixedbitset"}" deps)
    ]
      ++ (if features.petgraph."0.4.13".ordermap or false then [ (crates.ordermap."${deps."petgraph"."0.4.13".ordermap}" deps) ] else []));
    features = mkFeatures (features."petgraph"."0.4.13" or {});
  };
  features_.petgraph."0.4.13" = deps: f: updateFeatures f (rec {
    fixedbitset."${deps.petgraph."0.4.13".fixedbitset}".default = true;
    ordermap."${deps.petgraph."0.4.13".ordermap}".default = true;
    petgraph = fold recursiveUpdate {} [
      { "0.4.13".default = (f.petgraph."0.4.13".default or true); }
      { "0.4.13".generate =
        (f.petgraph."0.4.13".generate or false) ||
        (f.petgraph."0.4.13".unstable or false) ||
        (petgraph."0.4.13"."unstable" or false); }
      { "0.4.13".graphmap =
        (f.petgraph."0.4.13".graphmap or false) ||
        (f.petgraph."0.4.13".all or false) ||
        (petgraph."0.4.13"."all" or false) ||
        (f.petgraph."0.4.13".default or false) ||
        (petgraph."0.4.13"."default" or false); }
      { "0.4.13".ordermap =
        (f.petgraph."0.4.13".ordermap or false) ||
        (f.petgraph."0.4.13".graphmap or false) ||
        (petgraph."0.4.13"."graphmap" or false); }
      { "0.4.13".quickcheck =
        (f.petgraph."0.4.13".quickcheck or false) ||
        (f.petgraph."0.4.13".all or false) ||
        (petgraph."0.4.13"."all" or false); }
      { "0.4.13".serde =
        (f.petgraph."0.4.13".serde or false) ||
        (f.petgraph."0.4.13".serde-1 or false) ||
        (petgraph."0.4.13"."serde-1" or false); }
      { "0.4.13".serde_derive =
        (f.petgraph."0.4.13".serde_derive or false) ||
        (f.petgraph."0.4.13".serde-1 or false) ||
        (petgraph."0.4.13"."serde-1" or false); }
      { "0.4.13".stable_graph =
        (f.petgraph."0.4.13".stable_graph or false) ||
        (f.petgraph."0.4.13".all or false) ||
        (petgraph."0.4.13"."all" or false) ||
        (f.petgraph."0.4.13".default or false) ||
        (petgraph."0.4.13"."default" or false); }
      { "0.4.13".unstable =
        (f.petgraph."0.4.13".unstable or false) ||
        (f.petgraph."0.4.13".all or false) ||
        (petgraph."0.4.13"."all" or false); }
    ];
  }) [
    (features_.fixedbitset."${deps."petgraph"."0.4.13"."fixedbitset"}" deps)
    (features_.ordermap."${deps."petgraph"."0.4.13"."ordermap"}" deps)
  ];


# end
# pkg-config-0.3.14

  crates.pkg_config."0.3.14" = deps: { features?(features_.pkg_config."0.3.14" deps {}) }: buildRustCrate {
    crateName = "pkg-config";
    version = "0.3.14";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "0207fsarrm412j0dh87lfcas72n8mxar7q3mgflsbsrqnb140sv6";
  };
  features_.pkg_config."0.3.14" = deps: f: updateFeatures f (rec {
    pkg_config."0.3.14".default = (f.pkg_config."0.3.14".default or true);
  }) [];


# end
# proc-macro2-0.4.30

  crates.proc_macro2."0.4.30" = deps: { features?(features_.proc_macro2."0.4.30" deps {}) }: buildRustCrate {
    crateName = "proc-macro2";
    version = "0.4.30";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "0iifv51wrm6r4r2gghw6rray3nv53zcap355bbz1nsmbhj5s09b9";
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."unicode_xid"."${deps."proc_macro2"."0.4.30"."unicode_xid"}" deps)
    ]);
    features = mkFeatures (features."proc_macro2"."0.4.30" or {});
  };
  features_.proc_macro2."0.4.30" = deps: f: updateFeatures f (rec {
    proc_macro2 = fold recursiveUpdate {} [
      { "0.4.30".default = (f.proc_macro2."0.4.30".default or true); }
      { "0.4.30".proc-macro =
        (f.proc_macro2."0.4.30".proc-macro or false) ||
        (f.proc_macro2."0.4.30".default or false) ||
        (proc_macro2."0.4.30"."default" or false); }
    ];
    unicode_xid."${deps.proc_macro2."0.4.30".unicode_xid}".default = true;
  }) [
    (features_.unicode_xid."${deps."proc_macro2"."0.4.30"."unicode_xid"}" deps)
  ];


# end
# proc-mounts-0.2.2

  crates.proc_mounts."0.2.2" = deps: { features?(features_.proc_mounts."0.2.2" deps {}) }: buildRustCrate {
    crateName = "proc-mounts";
    version = "0.2.2";
    authors = [ "Jeremy Soller <jackpot51@gmail.com>" "Michael Aaron Murphy <mmstickman@gmail.com>" ];
    sha256 = "0mdpjri5wm1qbyv7vqsndwan57bgq93x1lyjj5ff3rnk1m0l55fd";
    dependencies = mapFeatures features ([
      (crates."lazy_static"."${deps."proc_mounts"."0.2.2"."lazy_static"}" deps)
      (crates."partition_identity"."${deps."proc_mounts"."0.2.2"."partition_identity"}" deps)
    ]);
  };
  features_.proc_mounts."0.2.2" = deps: f: updateFeatures f (rec {
    lazy_static."${deps.proc_mounts."0.2.2".lazy_static}".default = true;
    partition_identity."${deps.proc_mounts."0.2.2".partition_identity}".default = true;
    proc_mounts."0.2.2".default = (f.proc_mounts."0.2.2".default or true);
  }) [
    (features_.lazy_static."${deps."proc_mounts"."0.2.2"."lazy_static"}" deps)
    (features_.partition_identity."${deps."proc_mounts"."0.2.2"."partition_identity"}" deps)
  ];


# end
# quote-0.6.12

  crates.quote."0.6.12" = deps: { features?(features_.quote."0.6.12" deps {}) }: buildRustCrate {
    crateName = "quote";
    version = "0.6.12";
    authors = [ "David Tolnay <dtolnay@gmail.com>" ];
    sha256 = "1ckd2d2sy0hrwrqcr47dn0n3hyh7ygpc026l8xaycccyg27mihv9";
    dependencies = mapFeatures features ([
      (crates."proc_macro2"."${deps."quote"."0.6.12"."proc_macro2"}" deps)
    ]);
    features = mkFeatures (features."quote"."0.6.12" or {});
  };
  features_.quote."0.6.12" = deps: f: updateFeatures f (rec {
    proc_macro2 = fold recursiveUpdate {} [
      { "${deps.quote."0.6.12".proc_macro2}"."proc-macro" =
        (f.proc_macro2."${deps.quote."0.6.12".proc_macro2}"."proc-macro" or false) ||
        (quote."0.6.12"."proc-macro" or false) ||
        (f."quote"."0.6.12"."proc-macro" or false); }
      { "${deps.quote."0.6.12".proc_macro2}".default = (f.proc_macro2."${deps.quote."0.6.12".proc_macro2}".default or false); }
    ];
    quote = fold recursiveUpdate {} [
      { "0.6.12".default = (f.quote."0.6.12".default or true); }
      { "0.6.12".proc-macro =
        (f.quote."0.6.12".proc-macro or false) ||
        (f.quote."0.6.12".default or false) ||
        (quote."0.6.12"."default" or false); }
    ];
  }) [
    (features_.proc_macro2."${deps."quote"."0.6.12"."proc_macro2"}" deps)
  ];


# end
# rand-0.3.23

  crates.rand."0.3.23" = deps: { features?(features_.rand."0.3.23" deps {}) }: buildRustCrate {
    crateName = "rand";
    version = "0.3.23";
    authors = [ "The Rust Project Developers" ];
    sha256 = "118rairvv46npqqx7hmkf97kkimjrry9z31z4inxcv2vn0nj1s2g";
    dependencies = mapFeatures features ([
      (crates."libc"."${deps."rand"."0.3.23"."libc"}" deps)
      (crates."rand"."${deps."rand"."0.3.23"."rand"}" deps)
    ]);
    features = mkFeatures (features."rand"."0.3.23" or {});
  };
  features_.rand."0.3.23" = deps: f: updateFeatures f (rec {
    libc."${deps.rand."0.3.23".libc}".default = true;
    rand = fold recursiveUpdate {} [
      { "${deps.rand."0.3.23".rand}".default = true; }
      { "0.3.23".default = (f.rand."0.3.23".default or true); }
      { "0.3.23".i128_support =
        (f.rand."0.3.23".i128_support or false) ||
        (f.rand."0.3.23".nightly or false) ||
        (rand."0.3.23"."nightly" or false); }
    ];
  }) [
    (features_.libc."${deps."rand"."0.3.23"."libc"}" deps)
    (features_.rand."${deps."rand"."0.3.23"."rand"}" deps)
  ];


# end
# rand-0.4.6

  crates.rand."0.4.6" = deps: { features?(features_.rand."0.4.6" deps {}) }: buildRustCrate {
    crateName = "rand";
    version = "0.4.6";
    authors = [ "The Rust Project Developers" ];
    sha256 = "0c3rmg5q7d6qdi7cbmg5py9alm70wd3xsg0mmcawrnl35qv37zfs";
    dependencies = (if abi == "sgx" then mapFeatures features ([
      (crates."rand_core"."${deps."rand"."0.4.6"."rand_core"}" deps)
      (crates."rdrand"."${deps."rand"."0.4.6"."rdrand"}" deps)
    ]) else [])
      ++ (if kernel == "fuchsia" then mapFeatures features ([
      (crates."fuchsia_cprng"."${deps."rand"."0.4.6"."fuchsia_cprng"}" deps)
    ]) else [])
      ++ (if (kernel == "linux" || kernel == "darwin") then mapFeatures features ([
    ]
      ++ (if features.rand."0.4.6".libc or false then [ (crates.libc."${deps."rand"."0.4.6".libc}" deps) ] else [])) else [])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."rand"."0.4.6"."winapi"}" deps)
    ]) else []);
    features = mkFeatures (features."rand"."0.4.6" or {});
  };
  features_.rand."0.4.6" = deps: f: updateFeatures f (rec {
    fuchsia_cprng."${deps.rand."0.4.6".fuchsia_cprng}".default = true;
    libc."${deps.rand."0.4.6".libc}".default = true;
    rand = fold recursiveUpdate {} [
      { "0.4.6".default = (f.rand."0.4.6".default or true); }
      { "0.4.6".i128_support =
        (f.rand."0.4.6".i128_support or false) ||
        (f.rand."0.4.6".nightly or false) ||
        (rand."0.4.6"."nightly" or false); }
      { "0.4.6".libc =
        (f.rand."0.4.6".libc or false) ||
        (f.rand."0.4.6".std or false) ||
        (rand."0.4.6"."std" or false); }
      { "0.4.6".std =
        (f.rand."0.4.6".std or false) ||
        (f.rand."0.4.6".default or false) ||
        (rand."0.4.6"."default" or false); }
    ];
    rand_core."${deps.rand."0.4.6".rand_core}".default = (f.rand_core."${deps.rand."0.4.6".rand_core}".default or false);
    rdrand."${deps.rand."0.4.6".rdrand}".default = true;
    winapi = fold recursiveUpdate {} [
      { "${deps.rand."0.4.6".winapi}"."minwindef" = true; }
      { "${deps.rand."0.4.6".winapi}"."ntsecapi" = true; }
      { "${deps.rand."0.4.6".winapi}"."profileapi" = true; }
      { "${deps.rand."0.4.6".winapi}"."winnt" = true; }
      { "${deps.rand."0.4.6".winapi}".default = true; }
    ];
  }) [
    (features_.rand_core."${deps."rand"."0.4.6"."rand_core"}" deps)
    (features_.rdrand."${deps."rand"."0.4.6"."rdrand"}" deps)
    (features_.fuchsia_cprng."${deps."rand"."0.4.6"."fuchsia_cprng"}" deps)
    (features_.libc."${deps."rand"."0.4.6"."libc"}" deps)
    (features_.winapi."${deps."rand"."0.4.6"."winapi"}" deps)
  ];


# end
# rand-0.6.5

  crates.rand."0.6.5" = deps: { features?(features_.rand."0.6.5" deps {}) }: buildRustCrate {
    crateName = "rand";
    version = "0.6.5";
    authors = [ "The Rand Project Developers" "The Rust Project Developers" ];
    sha256 = "0zbck48159aj8zrwzf80sd9xxh96w4f4968nshwjpysjvflimvgb";
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."rand_chacha"."${deps."rand"."0.6.5"."rand_chacha"}" deps)
      (crates."rand_core"."${deps."rand"."0.6.5"."rand_core"}" deps)
      (crates."rand_hc"."${deps."rand"."0.6.5"."rand_hc"}" deps)
      (crates."rand_isaac"."${deps."rand"."0.6.5"."rand_isaac"}" deps)
      (crates."rand_jitter"."${deps."rand"."0.6.5"."rand_jitter"}" deps)
      (crates."rand_pcg"."${deps."rand"."0.6.5"."rand_pcg"}" deps)
      (crates."rand_xorshift"."${deps."rand"."0.6.5"."rand_xorshift"}" deps)
    ]
      ++ (if features.rand."0.6.5".rand_os or false then [ (crates.rand_os."${deps."rand"."0.6.5".rand_os}" deps) ] else []))
      ++ (if (kernel == "linux" || kernel == "darwin") then mapFeatures features ([
      (crates."libc"."${deps."rand"."0.6.5"."libc"}" deps)
    ]) else [])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."rand"."0.6.5"."winapi"}" deps)
    ]) else []);

    buildDependencies = mapFeatures features ([
      (crates."autocfg"."${deps."rand"."0.6.5"."autocfg"}" deps)
    ]);
    features = mkFeatures (features."rand"."0.6.5" or {});
  };
  features_.rand."0.6.5" = deps: f: updateFeatures f (rec {
    autocfg."${deps.rand."0.6.5".autocfg}".default = true;
    libc."${deps.rand."0.6.5".libc}".default = (f.libc."${deps.rand."0.6.5".libc}".default or false);
    rand = fold recursiveUpdate {} [
      { "0.6.5".alloc =
        (f.rand."0.6.5".alloc or false) ||
        (f.rand."0.6.5".std or false) ||
        (rand."0.6.5"."std" or false); }
      { "0.6.5".default = (f.rand."0.6.5".default or true); }
      { "0.6.5".packed_simd =
        (f.rand."0.6.5".packed_simd or false) ||
        (f.rand."0.6.5".simd_support or false) ||
        (rand."0.6.5"."simd_support" or false); }
      { "0.6.5".rand_os =
        (f.rand."0.6.5".rand_os or false) ||
        (f.rand."0.6.5".std or false) ||
        (rand."0.6.5"."std" or false); }
      { "0.6.5".simd_support =
        (f.rand."0.6.5".simd_support or false) ||
        (f.rand."0.6.5".nightly or false) ||
        (rand."0.6.5"."nightly" or false); }
      { "0.6.5".std =
        (f.rand."0.6.5".std or false) ||
        (f.rand."0.6.5".default or false) ||
        (rand."0.6.5"."default" or false); }
    ];
    rand_chacha."${deps.rand."0.6.5".rand_chacha}".default = true;
    rand_core = fold recursiveUpdate {} [
      { "${deps.rand."0.6.5".rand_core}"."alloc" =
        (f.rand_core."${deps.rand."0.6.5".rand_core}"."alloc" or false) ||
        (rand."0.6.5"."alloc" or false) ||
        (f."rand"."0.6.5"."alloc" or false); }
      { "${deps.rand."0.6.5".rand_core}"."serde1" =
        (f.rand_core."${deps.rand."0.6.5".rand_core}"."serde1" or false) ||
        (rand."0.6.5"."serde1" or false) ||
        (f."rand"."0.6.5"."serde1" or false); }
      { "${deps.rand."0.6.5".rand_core}"."std" =
        (f.rand_core."${deps.rand."0.6.5".rand_core}"."std" or false) ||
        (rand."0.6.5"."std" or false) ||
        (f."rand"."0.6.5"."std" or false); }
      { "${deps.rand."0.6.5".rand_core}".default = true; }
    ];
    rand_hc."${deps.rand."0.6.5".rand_hc}".default = true;
    rand_isaac = fold recursiveUpdate {} [
      { "${deps.rand."0.6.5".rand_isaac}"."serde1" =
        (f.rand_isaac."${deps.rand."0.6.5".rand_isaac}"."serde1" or false) ||
        (rand."0.6.5"."serde1" or false) ||
        (f."rand"."0.6.5"."serde1" or false); }
      { "${deps.rand."0.6.5".rand_isaac}".default = true; }
    ];
    rand_jitter = fold recursiveUpdate {} [
      { "${deps.rand."0.6.5".rand_jitter}"."std" =
        (f.rand_jitter."${deps.rand."0.6.5".rand_jitter}"."std" or false) ||
        (rand."0.6.5"."std" or false) ||
        (f."rand"."0.6.5"."std" or false); }
      { "${deps.rand."0.6.5".rand_jitter}".default = true; }
    ];
    rand_os = fold recursiveUpdate {} [
      { "${deps.rand."0.6.5".rand_os}"."stdweb" =
        (f.rand_os."${deps.rand."0.6.5".rand_os}"."stdweb" or false) ||
        (rand."0.6.5"."stdweb" or false) ||
        (f."rand"."0.6.5"."stdweb" or false); }
      { "${deps.rand."0.6.5".rand_os}"."wasm-bindgen" =
        (f.rand_os."${deps.rand."0.6.5".rand_os}"."wasm-bindgen" or false) ||
        (rand."0.6.5"."wasm-bindgen" or false) ||
        (f."rand"."0.6.5"."wasm-bindgen" or false); }
      { "${deps.rand."0.6.5".rand_os}".default = true; }
    ];
    rand_pcg."${deps.rand."0.6.5".rand_pcg}".default = true;
    rand_xorshift = fold recursiveUpdate {} [
      { "${deps.rand."0.6.5".rand_xorshift}"."serde1" =
        (f.rand_xorshift."${deps.rand."0.6.5".rand_xorshift}"."serde1" or false) ||
        (rand."0.6.5"."serde1" or false) ||
        (f."rand"."0.6.5"."serde1" or false); }
      { "${deps.rand."0.6.5".rand_xorshift}".default = true; }
    ];
    winapi = fold recursiveUpdate {} [
      { "${deps.rand."0.6.5".winapi}"."minwindef" = true; }
      { "${deps.rand."0.6.5".winapi}"."ntsecapi" = true; }
      { "${deps.rand."0.6.5".winapi}"."profileapi" = true; }
      { "${deps.rand."0.6.5".winapi}"."winnt" = true; }
      { "${deps.rand."0.6.5".winapi}".default = true; }
    ];
  }) [
    (features_.rand_chacha."${deps."rand"."0.6.5"."rand_chacha"}" deps)
    (features_.rand_core."${deps."rand"."0.6.5"."rand_core"}" deps)
    (features_.rand_hc."${deps."rand"."0.6.5"."rand_hc"}" deps)
    (features_.rand_isaac."${deps."rand"."0.6.5"."rand_isaac"}" deps)
    (features_.rand_jitter."${deps."rand"."0.6.5"."rand_jitter"}" deps)
    (features_.rand_os."${deps."rand"."0.6.5"."rand_os"}" deps)
    (features_.rand_pcg."${deps."rand"."0.6.5"."rand_pcg"}" deps)
    (features_.rand_xorshift."${deps."rand"."0.6.5"."rand_xorshift"}" deps)
    (features_.autocfg."${deps."rand"."0.6.5"."autocfg"}" deps)
    (features_.libc."${deps."rand"."0.6.5"."libc"}" deps)
    (features_.winapi."${deps."rand"."0.6.5"."winapi"}" deps)
  ];


# end
# rand_chacha-0.1.1

  crates.rand_chacha."0.1.1" = deps: { features?(features_.rand_chacha."0.1.1" deps {}) }: buildRustCrate {
    crateName = "rand_chacha";
    version = "0.1.1";
    authors = [ "The Rand Project Developers" "The Rust Project Developers" ];
    sha256 = "0xnxm4mjd7wjnh18zxc1yickw58axbycp35ciraplqdfwn1gffwi";
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."rand_core"."${deps."rand_chacha"."0.1.1"."rand_core"}" deps)
    ]);

    buildDependencies = mapFeatures features ([
      (crates."autocfg"."${deps."rand_chacha"."0.1.1"."autocfg"}" deps)
    ]);
  };
  features_.rand_chacha."0.1.1" = deps: f: updateFeatures f (rec {
    autocfg."${deps.rand_chacha."0.1.1".autocfg}".default = true;
    rand_chacha."0.1.1".default = (f.rand_chacha."0.1.1".default or true);
    rand_core."${deps.rand_chacha."0.1.1".rand_core}".default = (f.rand_core."${deps.rand_chacha."0.1.1".rand_core}".default or false);
  }) [
    (features_.rand_core."${deps."rand_chacha"."0.1.1"."rand_core"}" deps)
    (features_.autocfg."${deps."rand_chacha"."0.1.1"."autocfg"}" deps)
  ];


# end
# rand_core-0.3.1

  crates.rand_core."0.3.1" = deps: { features?(features_.rand_core."0.3.1" deps {}) }: buildRustCrate {
    crateName = "rand_core";
    version = "0.3.1";
    authors = [ "The Rand Project Developers" "The Rust Project Developers" ];
    sha256 = "0q0ssgpj9x5a6fda83nhmfydy7a6c0wvxm0jhncsmjx8qp8gw91m";
    dependencies = mapFeatures features ([
      (crates."rand_core"."${deps."rand_core"."0.3.1"."rand_core"}" deps)
    ]);
    features = mkFeatures (features."rand_core"."0.3.1" or {});
  };
  features_.rand_core."0.3.1" = deps: f: updateFeatures f (rec {
    rand_core = fold recursiveUpdate {} [
      { "${deps.rand_core."0.3.1".rand_core}"."alloc" =
        (f.rand_core."${deps.rand_core."0.3.1".rand_core}"."alloc" or false) ||
        (rand_core."0.3.1"."alloc" or false) ||
        (f."rand_core"."0.3.1"."alloc" or false); }
      { "${deps.rand_core."0.3.1".rand_core}"."serde1" =
        (f.rand_core."${deps.rand_core."0.3.1".rand_core}"."serde1" or false) ||
        (rand_core."0.3.1"."serde1" or false) ||
        (f."rand_core"."0.3.1"."serde1" or false); }
      { "${deps.rand_core."0.3.1".rand_core}"."std" =
        (f.rand_core."${deps.rand_core."0.3.1".rand_core}"."std" or false) ||
        (rand_core."0.3.1"."std" or false) ||
        (f."rand_core"."0.3.1"."std" or false); }
      { "${deps.rand_core."0.3.1".rand_core}".default = true; }
      { "0.3.1".default = (f.rand_core."0.3.1".default or true); }
      { "0.3.1".std =
        (f.rand_core."0.3.1".std or false) ||
        (f.rand_core."0.3.1".default or false) ||
        (rand_core."0.3.1"."default" or false); }
    ];
  }) [
    (features_.rand_core."${deps."rand_core"."0.3.1"."rand_core"}" deps)
  ];


# end
# rand_core-0.4.0

  crates.rand_core."0.4.0" = deps: { features?(features_.rand_core."0.4.0" deps {}) }: buildRustCrate {
    crateName = "rand_core";
    version = "0.4.0";
    authors = [ "The Rand Project Developers" "The Rust Project Developers" ];
    sha256 = "0wb5iwhffibj0pnpznhv1g3i7h1fnhz64s3nz74fz6vsm3q6q3br";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."rand_core"."0.4.0" or {});
  };
  features_.rand_core."0.4.0" = deps: f: updateFeatures f (rec {
    rand_core = fold recursiveUpdate {} [
      { "0.4.0".alloc =
        (f.rand_core."0.4.0".alloc or false) ||
        (f.rand_core."0.4.0".std or false) ||
        (rand_core."0.4.0"."std" or false); }
      { "0.4.0".default = (f.rand_core."0.4.0".default or true); }
      { "0.4.0".serde =
        (f.rand_core."0.4.0".serde or false) ||
        (f.rand_core."0.4.0".serde1 or false) ||
        (rand_core."0.4.0"."serde1" or false); }
      { "0.4.0".serde_derive =
        (f.rand_core."0.4.0".serde_derive or false) ||
        (f.rand_core."0.4.0".serde1 or false) ||
        (rand_core."0.4.0"."serde1" or false); }
    ];
  }) [];


# end
# rand_hc-0.1.0

  crates.rand_hc."0.1.0" = deps: { features?(features_.rand_hc."0.1.0" deps {}) }: buildRustCrate {
    crateName = "rand_hc";
    version = "0.1.0";
    authors = [ "The Rand Project Developers" ];
    sha256 = "05agb75j87yp7y1zk8yf7bpm66hc0673r3dlypn0kazynr6fdgkz";
    dependencies = mapFeatures features ([
      (crates."rand_core"."${deps."rand_hc"."0.1.0"."rand_core"}" deps)
    ]);
  };
  features_.rand_hc."0.1.0" = deps: f: updateFeatures f (rec {
    rand_core."${deps.rand_hc."0.1.0".rand_core}".default = (f.rand_core."${deps.rand_hc."0.1.0".rand_core}".default or false);
    rand_hc."0.1.0".default = (f.rand_hc."0.1.0".default or true);
  }) [
    (features_.rand_core."${deps."rand_hc"."0.1.0"."rand_core"}" deps)
  ];


# end
# rand_isaac-0.1.1

  crates.rand_isaac."0.1.1" = deps: { features?(features_.rand_isaac."0.1.1" deps {}) }: buildRustCrate {
    crateName = "rand_isaac";
    version = "0.1.1";
    authors = [ "The Rand Project Developers" "The Rust Project Developers" ];
    sha256 = "10hhdh5b5sa03s6b63y9bafm956jwilx41s71jbrzl63ccx8lxdq";
    dependencies = mapFeatures features ([
      (crates."rand_core"."${deps."rand_isaac"."0.1.1"."rand_core"}" deps)
    ]);
    features = mkFeatures (features."rand_isaac"."0.1.1" or {});
  };
  features_.rand_isaac."0.1.1" = deps: f: updateFeatures f (rec {
    rand_core = fold recursiveUpdate {} [
      { "${deps.rand_isaac."0.1.1".rand_core}"."serde1" =
        (f.rand_core."${deps.rand_isaac."0.1.1".rand_core}"."serde1" or false) ||
        (rand_isaac."0.1.1"."serde1" or false) ||
        (f."rand_isaac"."0.1.1"."serde1" or false); }
      { "${deps.rand_isaac."0.1.1".rand_core}".default = (f.rand_core."${deps.rand_isaac."0.1.1".rand_core}".default or false); }
    ];
    rand_isaac = fold recursiveUpdate {} [
      { "0.1.1".default = (f.rand_isaac."0.1.1".default or true); }
      { "0.1.1".serde =
        (f.rand_isaac."0.1.1".serde or false) ||
        (f.rand_isaac."0.1.1".serde1 or false) ||
        (rand_isaac."0.1.1"."serde1" or false); }
      { "0.1.1".serde_derive =
        (f.rand_isaac."0.1.1".serde_derive or false) ||
        (f.rand_isaac."0.1.1".serde1 or false) ||
        (rand_isaac."0.1.1"."serde1" or false); }
    ];
  }) [
    (features_.rand_core."${deps."rand_isaac"."0.1.1"."rand_core"}" deps)
  ];


# end
# rand_jitter-0.1.4

  crates.rand_jitter."0.1.4" = deps: { features?(features_.rand_jitter."0.1.4" deps {}) }: buildRustCrate {
    crateName = "rand_jitter";
    version = "0.1.4";
    authors = [ "The Rand Project Developers" ];
    sha256 = "13nr4h042ab9l7qcv47bxrxw3gkf2pc3cni6c9pyi4nxla0mm7b6";
    dependencies = mapFeatures features ([
      (crates."rand_core"."${deps."rand_jitter"."0.1.4"."rand_core"}" deps)
    ])
      ++ (if kernel == "darwin" || kernel == "ios" then mapFeatures features ([
      (crates."libc"."${deps."rand_jitter"."0.1.4"."libc"}" deps)
    ]) else [])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."rand_jitter"."0.1.4"."winapi"}" deps)
    ]) else []);
    features = mkFeatures (features."rand_jitter"."0.1.4" or {});
  };
  features_.rand_jitter."0.1.4" = deps: f: updateFeatures f (rec {
    libc."${deps.rand_jitter."0.1.4".libc}".default = true;
    rand_core = fold recursiveUpdate {} [
      { "${deps.rand_jitter."0.1.4".rand_core}"."std" =
        (f.rand_core."${deps.rand_jitter."0.1.4".rand_core}"."std" or false) ||
        (rand_jitter."0.1.4"."std" or false) ||
        (f."rand_jitter"."0.1.4"."std" or false); }
      { "${deps.rand_jitter."0.1.4".rand_core}".default = true; }
    ];
    rand_jitter."0.1.4".default = (f.rand_jitter."0.1.4".default or true);
    winapi = fold recursiveUpdate {} [
      { "${deps.rand_jitter."0.1.4".winapi}"."profileapi" = true; }
      { "${deps.rand_jitter."0.1.4".winapi}".default = true; }
    ];
  }) [
    (features_.rand_core."${deps."rand_jitter"."0.1.4"."rand_core"}" deps)
    (features_.libc."${deps."rand_jitter"."0.1.4"."libc"}" deps)
    (features_.winapi."${deps."rand_jitter"."0.1.4"."winapi"}" deps)
  ];


# end
# rand_os-0.1.3

  crates.rand_os."0.1.3" = deps: { features?(features_.rand_os."0.1.3" deps {}) }: buildRustCrate {
    crateName = "rand_os";
    version = "0.1.3";
    authors = [ "The Rand Project Developers" ];
    sha256 = "0ywwspizgs9g8vzn6m5ix9yg36n15119d6n792h7mk4r5vs0ww4j";
    dependencies = mapFeatures features ([
      (crates."rand_core"."${deps."rand_os"."0.1.3"."rand_core"}" deps)
    ])
      ++ (if abi == "sgx" then mapFeatures features ([
      (crates."rdrand"."${deps."rand_os"."0.1.3"."rdrand"}" deps)
    ]) else [])
      ++ (if kernel == "cloudabi" then mapFeatures features ([
      (crates."cloudabi"."${deps."rand_os"."0.1.3"."cloudabi"}" deps)
    ]) else [])
      ++ (if kernel == "fuchsia" then mapFeatures features ([
      (crates."fuchsia_cprng"."${deps."rand_os"."0.1.3"."fuchsia_cprng"}" deps)
    ]) else [])
      ++ (if (kernel == "linux" || kernel == "darwin") then mapFeatures features ([
      (crates."libc"."${deps."rand_os"."0.1.3"."libc"}" deps)
    ]) else [])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."rand_os"."0.1.3"."winapi"}" deps)
    ]) else [])
      ++ (if kernel == "wasm32-unknown-unknown" then mapFeatures features ([
]) else []);
  };
  features_.rand_os."0.1.3" = deps: f: updateFeatures f (rec {
    cloudabi."${deps.rand_os."0.1.3".cloudabi}".default = true;
    fuchsia_cprng."${deps.rand_os."0.1.3".fuchsia_cprng}".default = true;
    libc."${deps.rand_os."0.1.3".libc}".default = true;
    rand_core = fold recursiveUpdate {} [
      { "${deps.rand_os."0.1.3".rand_core}"."std" = true; }
      { "${deps.rand_os."0.1.3".rand_core}".default = true; }
    ];
    rand_os."0.1.3".default = (f.rand_os."0.1.3".default or true);
    rdrand."${deps.rand_os."0.1.3".rdrand}".default = true;
    winapi = fold recursiveUpdate {} [
      { "${deps.rand_os."0.1.3".winapi}"."minwindef" = true; }
      { "${deps.rand_os."0.1.3".winapi}"."ntsecapi" = true; }
      { "${deps.rand_os."0.1.3".winapi}"."winnt" = true; }
      { "${deps.rand_os."0.1.3".winapi}".default = true; }
    ];
  }) [
    (features_.rand_core."${deps."rand_os"."0.1.3"."rand_core"}" deps)
    (features_.rdrand."${deps."rand_os"."0.1.3"."rdrand"}" deps)
    (features_.cloudabi."${deps."rand_os"."0.1.3"."cloudabi"}" deps)
    (features_.fuchsia_cprng."${deps."rand_os"."0.1.3"."fuchsia_cprng"}" deps)
    (features_.libc."${deps."rand_os"."0.1.3"."libc"}" deps)
    (features_.winapi."${deps."rand_os"."0.1.3"."winapi"}" deps)
  ];


# end
# rand_pcg-0.1.2

  crates.rand_pcg."0.1.2" = deps: { features?(features_.rand_pcg."0.1.2" deps {}) }: buildRustCrate {
    crateName = "rand_pcg";
    version = "0.1.2";
    authors = [ "The Rand Project Developers" ];
    sha256 = "04qgi2ai2z42li5h4aawvxbpnlqyjfnipz9d6k73mdnl6p1xq938";
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."rand_core"."${deps."rand_pcg"."0.1.2"."rand_core"}" deps)
    ]);

    buildDependencies = mapFeatures features ([
      (crates."autocfg"."${deps."rand_pcg"."0.1.2"."autocfg"}" deps)
    ]);
    features = mkFeatures (features."rand_pcg"."0.1.2" or {});
  };
  features_.rand_pcg."0.1.2" = deps: f: updateFeatures f (rec {
    autocfg."${deps.rand_pcg."0.1.2".autocfg}".default = true;
    rand_core."${deps.rand_pcg."0.1.2".rand_core}".default = true;
    rand_pcg = fold recursiveUpdate {} [
      { "0.1.2".default = (f.rand_pcg."0.1.2".default or true); }
      { "0.1.2".serde =
        (f.rand_pcg."0.1.2".serde or false) ||
        (f.rand_pcg."0.1.2".serde1 or false) ||
        (rand_pcg."0.1.2"."serde1" or false); }
      { "0.1.2".serde_derive =
        (f.rand_pcg."0.1.2".serde_derive or false) ||
        (f.rand_pcg."0.1.2".serde1 or false) ||
        (rand_pcg."0.1.2"."serde1" or false); }
    ];
  }) [
    (features_.rand_core."${deps."rand_pcg"."0.1.2"."rand_core"}" deps)
    (features_.autocfg."${deps."rand_pcg"."0.1.2"."autocfg"}" deps)
  ];


# end
# rand_xorshift-0.1.1

  crates.rand_xorshift."0.1.1" = deps: { features?(features_.rand_xorshift."0.1.1" deps {}) }: buildRustCrate {
    crateName = "rand_xorshift";
    version = "0.1.1";
    authors = [ "The Rand Project Developers" "The Rust Project Developers" ];
    sha256 = "0v365c4h4lzxwz5k5kp9m0661s0sss7ylv74if0xb4svis9sswnn";
    dependencies = mapFeatures features ([
      (crates."rand_core"."${deps."rand_xorshift"."0.1.1"."rand_core"}" deps)
    ]);
    features = mkFeatures (features."rand_xorshift"."0.1.1" or {});
  };
  features_.rand_xorshift."0.1.1" = deps: f: updateFeatures f (rec {
    rand_core."${deps.rand_xorshift."0.1.1".rand_core}".default = (f.rand_core."${deps.rand_xorshift."0.1.1".rand_core}".default or false);
    rand_xorshift = fold recursiveUpdate {} [
      { "0.1.1".default = (f.rand_xorshift."0.1.1".default or true); }
      { "0.1.1".serde =
        (f.rand_xorshift."0.1.1".serde or false) ||
        (f.rand_xorshift."0.1.1".serde1 or false) ||
        (rand_xorshift."0.1.1"."serde1" or false); }
      { "0.1.1".serde_derive =
        (f.rand_xorshift."0.1.1".serde_derive or false) ||
        (f.rand_xorshift."0.1.1".serde1 or false) ||
        (rand_xorshift."0.1.1"."serde1" or false); }
    ];
  }) [
    (features_.rand_core."${deps."rand_xorshift"."0.1.1"."rand_core"}" deps)
  ];


# end
# rdrand-0.4.0

  crates.rdrand."0.4.0" = deps: { features?(features_.rdrand."0.4.0" deps {}) }: buildRustCrate {
    crateName = "rdrand";
    version = "0.4.0";
    authors = [ "Simonas Kazlauskas <rdrand@kazlauskas.me>" ];
    sha256 = "15hrcasn0v876wpkwab1dwbk9kvqwrb3iv4y4dibb6yxnfvzwajk";
    dependencies = mapFeatures features ([
      (crates."rand_core"."${deps."rdrand"."0.4.0"."rand_core"}" deps)
    ]);
    features = mkFeatures (features."rdrand"."0.4.0" or {});
  };
  features_.rdrand."0.4.0" = deps: f: updateFeatures f (rec {
    rand_core."${deps.rdrand."0.4.0".rand_core}".default = (f.rand_core."${deps.rdrand."0.4.0".rand_core}".default or false);
    rdrand = fold recursiveUpdate {} [
      { "0.4.0".default = (f.rdrand."0.4.0".default or true); }
      { "0.4.0".std =
        (f.rdrand."0.4.0".std or false) ||
        (f.rdrand."0.4.0".default or false) ||
        (rdrand."0.4.0"."default" or false); }
    ];
  }) [
    (features_.rand_core."${deps."rdrand"."0.4.0"."rand_core"}" deps)
  ];


# end
# redox_installer-0.2.4

  crates.redox_installer."0.2.4" = deps: { features?(features_.redox_installer."0.2.4" deps {}) }: buildRustCrate {
    crateName = "redox_installer";
    version = "0.2.4";
    authors = [ "Jeremy Soller <jackpot51@gmail.com>" ];
    sha256 = "1fk03zaipz9ji3xmyhnxasvmw2nyrxlzj4a4jjl6dwh91pbss5b0";
    libPath = "src/lib.rs";
    crateBin =
      [{  name = "redox_installer";  path = "src/bin/installer.rs"; }];
    dependencies = mapFeatures features ([
      (crates."arg_parser"."${deps."redox_installer"."0.2.4"."arg_parser"}" deps)
      (crates."argon2rs"."${deps."redox_installer"."0.2.4"."argon2rs"}" deps)
      (crates."failure"."${deps."redox_installer"."0.2.4"."failure"}" deps)
      (crates."libc"."${deps."redox_installer"."0.2.4"."libc"}" deps)
      (crates."liner"."${deps."redox_installer"."0.2.4"."liner"}" deps)
      (crates."rand"."${deps."redox_installer"."0.2.4"."rand"}" deps)
      (crates."redox_pkgutils"."${deps."redox_installer"."0.2.4"."redox_pkgutils"}" deps)
      (crates."redoxfs"."${deps."redox_installer"."0.2.4"."redoxfs"}" deps)
      (crates."serde"."${deps."redox_installer"."0.2.4"."serde"}" deps)
      (crates."serde_derive"."${deps."redox_installer"."0.2.4"."serde_derive"}" deps)
      (crates."termion"."${deps."redox_installer"."0.2.4"."termion"}" deps)
      (crates."toml"."${deps."redox_installer"."0.2.4"."toml"}" deps)
    ]);
  };
  features_.redox_installer."0.2.4" = deps: f: updateFeatures f (rec {
    arg_parser."${deps.redox_installer."0.2.4".arg_parser}".default = true;
    argon2rs."${deps.redox_installer."0.2.4".argon2rs}".default = (f.argon2rs."${deps.redox_installer."0.2.4".argon2rs}".default or false);
    failure."${deps.redox_installer."0.2.4".failure}".default = true;
    libc."${deps.redox_installer."0.2.4".libc}".default = true;
    liner."${deps.redox_installer."0.2.4".liner}".default = true;
    rand."${deps.redox_installer."0.2.4".rand}".default = true;
    redox_installer."0.2.4".default = (f.redox_installer."0.2.4".default or true);
    redox_pkgutils."${deps.redox_installer."0.2.4".redox_pkgutils}".default = true;
    redoxfs."${deps.redox_installer."0.2.4".redoxfs}".default = true;
    serde."${deps.redox_installer."0.2.4".serde}".default = true;
    serde_derive."${deps.redox_installer."0.2.4".serde_derive}".default = true;
    termion."${deps.redox_installer."0.2.4".termion}".default = true;
    toml."${deps.redox_installer."0.2.4".toml}".default = true;
  }) [
    (features_.arg_parser."${deps."redox_installer"."0.2.4"."arg_parser"}" deps)
    (features_.argon2rs."${deps."redox_installer"."0.2.4"."argon2rs"}" deps)
    (features_.failure."${deps."redox_installer"."0.2.4"."failure"}" deps)
    (features_.libc."${deps."redox_installer"."0.2.4"."libc"}" deps)
    (features_.liner."${deps."redox_installer"."0.2.4"."liner"}" deps)
    (features_.rand."${deps."redox_installer"."0.2.4"."rand"}" deps)
    (features_.redox_pkgutils."${deps."redox_installer"."0.2.4"."redox_pkgutils"}" deps)
    (features_.redoxfs."${deps."redox_installer"."0.2.4"."redoxfs"}" deps)
    (features_.serde."${deps."redox_installer"."0.2.4"."serde"}" deps)
    (features_.serde_derive."${deps."redox_installer"."0.2.4"."serde_derive"}" deps)
    (features_.termion."${deps."redox_installer"."0.2.4"."termion"}" deps)
    (features_.toml."${deps."redox_installer"."0.2.4"."toml"}" deps)
  ];


# end
# redox_pkgutils-0.1.2

  crates.redox_pkgutils."0.1.2" = deps: { features?(features_.redox_pkgutils."0.1.2" deps {}) }: buildRustCrate {
    crateName = "redox_pkgutils";
    version = "0.1.2";
    authors = [ "Jeremy Soller <jackpot51@gmail.com>" ];
    sha256 = "00akhg163x97c28xbri342k56ng6zbpp3bvbmv54mka2aikk3rfi";
    libPath = "src/lib.rs";
    libName = "pkgutils";
    crateBin =
      [{  name = "pkg";  path = "src/bin/pkg.rs"; }];
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."bidir_map"."${deps."redox_pkgutils"."0.1.2"."bidir_map"}" deps)
      (crates."clap"."${deps."redox_pkgutils"."0.1.2"."clap"}" deps)
      (crates."hyper"."${deps."redox_pkgutils"."0.1.2"."hyper"}" deps)
      (crates."hyper_rustls"."${deps."redox_pkgutils"."0.1.2"."hyper_rustls"}" deps)
      (crates."libflate"."${deps."redox_pkgutils"."0.1.2"."libflate"}" deps)
      (crates."liner"."${deps."redox_pkgutils"."0.1.2"."liner"}" deps)
      (crates."ordermap"."${deps."redox_pkgutils"."0.1.2"."ordermap"}" deps)
      (crates."pbr"."${deps."redox_pkgutils"."0.1.2"."pbr"}" deps)
      (crates."petgraph"."${deps."redox_pkgutils"."0.1.2"."petgraph"}" deps)
      (crates."serde"."${deps."redox_pkgutils"."0.1.2"."serde"}" deps)
      (crates."serde_derive"."${deps."redox_pkgutils"."0.1.2"."serde_derive"}" deps)
      (crates."sha3"."${deps."redox_pkgutils"."0.1.2"."sha3"}" deps)
      (crates."tar"."${deps."redox_pkgutils"."0.1.2"."tar"}" deps)
      (crates."toml"."${deps."redox_pkgutils"."0.1.2"."toml"}" deps)
      (crates."version_compare"."${deps."redox_pkgutils"."0.1.2"."version_compare"}" deps)
    ]);
  };
  features_.redox_pkgutils."0.1.2" = deps: f: updateFeatures f (rec {
    bidir_map."${deps.redox_pkgutils."0.1.2".bidir_map}".default = true;
    clap."${deps.redox_pkgutils."0.1.2".clap}".default = (f.clap."${deps.redox_pkgutils."0.1.2".clap}".default or false);
    hyper."${deps.redox_pkgutils."0.1.2".hyper}".default = (f.hyper."${deps.redox_pkgutils."0.1.2".hyper}".default or false);
    hyper_rustls."${deps.redox_pkgutils."0.1.2".hyper_rustls}".default = true;
    libflate."${deps.redox_pkgutils."0.1.2".libflate}".default = true;
    liner."${deps.redox_pkgutils."0.1.2".liner}".default = true;
    ordermap."${deps.redox_pkgutils."0.1.2".ordermap}".default = true;
    pbr."${deps.redox_pkgutils."0.1.2".pbr}".default = true;
    petgraph."${deps.redox_pkgutils."0.1.2".petgraph}".default = true;
    redox_pkgutils."0.1.2".default = (f.redox_pkgutils."0.1.2".default or true);
    serde."${deps.redox_pkgutils."0.1.2".serde}".default = true;
    serde_derive."${deps.redox_pkgutils."0.1.2".serde_derive}".default = true;
    sha3."${deps.redox_pkgutils."0.1.2".sha3}".default = true;
    tar."${deps.redox_pkgutils."0.1.2".tar}".default = true;
    toml."${deps.redox_pkgutils."0.1.2".toml}".default = true;
    version_compare."${deps.redox_pkgutils."0.1.2".version_compare}".default = true;
  }) [
    (features_.bidir_map."${deps."redox_pkgutils"."0.1.2"."bidir_map"}" deps)
    (features_.clap."${deps."redox_pkgutils"."0.1.2"."clap"}" deps)
    (features_.hyper."${deps."redox_pkgutils"."0.1.2"."hyper"}" deps)
    (features_.hyper_rustls."${deps."redox_pkgutils"."0.1.2"."hyper_rustls"}" deps)
    (features_.libflate."${deps."redox_pkgutils"."0.1.2"."libflate"}" deps)
    (features_.liner."${deps."redox_pkgutils"."0.1.2"."liner"}" deps)
    (features_.ordermap."${deps."redox_pkgutils"."0.1.2"."ordermap"}" deps)
    (features_.pbr."${deps."redox_pkgutils"."0.1.2"."pbr"}" deps)
    (features_.petgraph."${deps."redox_pkgutils"."0.1.2"."petgraph"}" deps)
    (features_.serde."${deps."redox_pkgutils"."0.1.2"."serde"}" deps)
    (features_.serde_derive."${deps."redox_pkgutils"."0.1.2"."serde_derive"}" deps)
    (features_.sha3."${deps."redox_pkgutils"."0.1.2"."sha3"}" deps)
    (features_.tar."${deps."redox_pkgutils"."0.1.2"."tar"}" deps)
    (features_.toml."${deps."redox_pkgutils"."0.1.2"."toml"}" deps)
    (features_.version_compare."${deps."redox_pkgutils"."0.1.2"."version_compare"}" deps)
  ];


# end
# redox_syscall-0.1.54

  crates.redox_syscall."0.1.54" = deps: { features?(features_.redox_syscall."0.1.54" deps {}) }: buildRustCrate {
    crateName = "redox_syscall";
    version = "0.1.54";
    authors = [ "Jeremy Soller <jackpot51@gmail.com>" ];
    sha256 = "1ndcp7brnvii87ndcd34fk846498r07iznphkslcy0shic9cp4rr";
    libName = "syscall";
  };
  features_.redox_syscall."0.1.54" = deps: f: updateFeatures f (rec {
    redox_syscall."0.1.54".default = (f.redox_syscall."0.1.54".default or true);
  }) [];


# end
# redox_termios-0.1.1

  crates.redox_termios."0.1.1" = deps: { features?(features_.redox_termios."0.1.1" deps {}) }: buildRustCrate {
    crateName = "redox_termios";
    version = "0.1.1";
    authors = [ "Jeremy Soller <jackpot51@gmail.com>" ];
    sha256 = "04s6yyzjca552hdaqlvqhp3vw0zqbc304md5czyd3axh56iry8wh";
    libPath = "src/lib.rs";
    dependencies = mapFeatures features ([
      (crates."redox_syscall"."${deps."redox_termios"."0.1.1"."redox_syscall"}" deps)
    ]);
  };
  features_.redox_termios."0.1.1" = deps: f: updateFeatures f (rec {
    redox_syscall."${deps.redox_termios."0.1.1".redox_syscall}".default = true;
    redox_termios."0.1.1".default = (f.redox_termios."0.1.1".default or true);
  }) [
    (features_.redox_syscall."${deps."redox_termios"."0.1.1"."redox_syscall"}" deps)
  ];


# end
# redox_users-0.3.0

  crates.redox_users."0.3.0" = deps: { features?(features_.redox_users."0.3.0" deps {}) }: buildRustCrate {
    crateName = "redox_users";
    version = "0.3.0";
    authors = [ "Jose Narvaez <goyox86@gmail.com>" "Wesley Hershberger <mggmugginsmc@gmail.com>" ];
    sha256 = "051rzqgk5hn7rf24nwgbb32zfdn8qp2kwqvdp0772ia85p737p4j";
    dependencies = mapFeatures features ([
      (crates."argon2rs"."${deps."redox_users"."0.3.0"."argon2rs"}" deps)
      (crates."failure"."${deps."redox_users"."0.3.0"."failure"}" deps)
      (crates."rand_os"."${deps."redox_users"."0.3.0"."rand_os"}" deps)
      (crates."redox_syscall"."${deps."redox_users"."0.3.0"."redox_syscall"}" deps)
    ]);
  };
  features_.redox_users."0.3.0" = deps: f: updateFeatures f (rec {
    argon2rs."${deps.redox_users."0.3.0".argon2rs}".default = (f.argon2rs."${deps.redox_users."0.3.0".argon2rs}".default or false);
    failure."${deps.redox_users."0.3.0".failure}".default = true;
    rand_os."${deps.redox_users."0.3.0".rand_os}".default = true;
    redox_syscall."${deps.redox_users."0.3.0".redox_syscall}".default = true;
    redox_users."0.3.0".default = (f.redox_users."0.3.0".default or true);
  }) [
    (features_.argon2rs."${deps."redox_users"."0.3.0"."argon2rs"}" deps)
    (features_.failure."${deps."redox_users"."0.3.0"."failure"}" deps)
    (features_.rand_os."${deps."redox_users"."0.3.0"."rand_os"}" deps)
    (features_.redox_syscall."${deps."redox_users"."0.3.0"."redox_syscall"}" deps)
  ];


# end
# redoxfs-0.3.3

  crates.redoxfs."0.3.3" = deps: { features?(features_.redoxfs."0.3.3" deps {}) }: buildRustCrate {
    crateName = "redoxfs";
    version = "0.3.3";
    authors = [ "Jeremy Soller <jackpot51@gmail.com>" ];
    sha256 = "0xp8gw6zkd6fghqvszi8w3qp5maql4znsb99q1ksl4rg6183wws0";
    libPath = "src/lib.rs";
    crateBin =
      [{  name = "redoxfs";  path = "src/bin/mount.rs"; }] ++
      [{  name = "redoxfs-ar";  path = "src/bin/ar.rs"; }] ++
      [{  name = "redoxfs-mkfs";  path = "src/bin/mkfs.rs"; }];
    dependencies = mapFeatures features ([
      (crates."redox_syscall"."${deps."redoxfs"."0.3.3"."redox_syscall"}" deps)
      (crates."uuid"."${deps."redoxfs"."0.3.3"."uuid"}" deps)
    ])
      ++ (if !(kernel == "redox") then mapFeatures features ([
      (crates."fuse"."${deps."redoxfs"."0.3.3"."fuse"}" deps)
      (crates."libc"."${deps."redoxfs"."0.3.3"."libc"}" deps)
      (crates."time"."${deps."redoxfs"."0.3.3"."time"}" deps)
    ]) else []);
  };
  features_.redoxfs."0.3.3" = deps: f: updateFeatures f (rec {
    fuse."${deps.redoxfs."0.3.3".fuse}".default = true;
    libc."${deps.redoxfs."0.3.3".libc}".default = true;
    redox_syscall."${deps.redoxfs."0.3.3".redox_syscall}".default = true;
    redoxfs."0.3.3".default = (f.redoxfs."0.3.3".default or true);
    time."${deps.redoxfs."0.3.3".time}".default = true;
    uuid = fold recursiveUpdate {} [
      { "${deps.redoxfs."0.3.3".uuid}"."v4" = true; }
      { "${deps.redoxfs."0.3.3".uuid}".default = true; }
    ];
  }) [
    (features_.redox_syscall."${deps."redoxfs"."0.3.3"."redox_syscall"}" deps)
    (features_.uuid."${deps."redoxfs"."0.3.3"."uuid"}" deps)
    (features_.fuse."${deps."redoxfs"."0.3.3"."fuse"}" deps)
    (features_.libc."${deps."redoxfs"."0.3.3"."libc"}" deps)
    (features_.time."${deps."redoxfs"."0.3.3"."time"}" deps)
  ];


# end
# remove_dir_all-0.5.2

  crates.remove_dir_all."0.5.2" = deps: { features?(features_.remove_dir_all."0.5.2" deps {}) }: buildRustCrate {
    crateName = "remove_dir_all";
    version = "0.5.2";
    authors = [ "Aaronepower <theaaronepower@gmail.com>" ];
    sha256 = "04sxg2ppvxiljc2i13bwvpbi540rf9d2a89cq0wmqf9pjvr3a1wm";
    dependencies = (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."remove_dir_all"."0.5.2"."winapi"}" deps)
    ]) else []);
  };
  features_.remove_dir_all."0.5.2" = deps: f: updateFeatures f (rec {
    remove_dir_all."0.5.2".default = (f.remove_dir_all."0.5.2".default or true);
    winapi = fold recursiveUpdate {} [
      { "${deps.remove_dir_all."0.5.2".winapi}"."errhandlingapi" = true; }
      { "${deps.remove_dir_all."0.5.2".winapi}"."fileapi" = true; }
      { "${deps.remove_dir_all."0.5.2".winapi}"."std" = true; }
      { "${deps.remove_dir_all."0.5.2".winapi}"."winbase" = true; }
      { "${deps.remove_dir_all."0.5.2".winapi}"."winerror" = true; }
      { "${deps.remove_dir_all."0.5.2".winapi}".default = true; }
    ];
  }) [
    (features_.winapi."${deps."remove_dir_all"."0.5.2"."winapi"}" deps)
  ];


# end
# ring-0.13.5

  crates.ring."0.13.5" = deps: { features?(features_.ring."0.13.5" deps {}) }: buildRustCrate {
    crateName = "ring";
    version = "0.13.5";
    authors = [ "Brian Smith <brian@briansmith.org>" ];
    sha256 = "0b071zwzwhgmj0xyr7wqc55f4nppgjikfh53nb9m799l096s86j4";
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."untrusted"."${deps."ring"."0.13.5"."untrusted"}" deps)
    ])
      ++ (if kernel == "redox" || (kernel == "linux" || kernel == "darwin") && !(kernel == "darwin" || kernel == "ios") then mapFeatures features ([
      (crates."lazy_static"."${deps."ring"."0.13.5"."lazy_static"}" deps)
    ]) else [])
      ++ (if kernel == "linux" then mapFeatures features ([
      (crates."libc"."${deps."ring"."0.13.5"."libc"}" deps)
    ]) else []);

    buildDependencies = mapFeatures features ([
      (crates."cc"."${deps."ring"."0.13.5"."cc"}" deps)
    ]);
    features = mkFeatures (features."ring"."0.13.5" or {});
  };
  features_.ring."0.13.5" = deps: f: updateFeatures f (rec {
    cc."${deps.ring."0.13.5".cc}".default = true;
    lazy_static."${deps.ring."0.13.5".lazy_static}".default = true;
    libc."${deps.ring."0.13.5".libc}".default = true;
    ring = fold recursiveUpdate {} [
      { "0.13.5".default = (f.ring."0.13.5".default or true); }
      { "0.13.5".dev_urandom_fallback =
        (f.ring."0.13.5".dev_urandom_fallback or false) ||
        (f.ring."0.13.5".default or false) ||
        (ring."0.13.5"."default" or false); }
      { "0.13.5".use_heap =
        (f.ring."0.13.5".use_heap or false) ||
        (f.ring."0.13.5".default or false) ||
        (ring."0.13.5"."default" or false) ||
        (f.ring."0.13.5".rsa_signing or false) ||
        (ring."0.13.5"."rsa_signing" or false); }
    ];
    untrusted."${deps.ring."0.13.5".untrusted}".default = true;
  }) [
    (features_.untrusted."${deps."ring"."0.13.5"."untrusted"}" deps)
    (features_.cc."${deps."ring"."0.13.5"."cc"}" deps)
    (features_.lazy_static."${deps."ring"."0.13.5"."lazy_static"}" deps)
    (features_.libc."${deps."ring"."0.13.5"."libc"}" deps)
  ];


# end
# rustc-demangle-0.1.15

  crates.rustc_demangle."0.1.15" = deps: { features?(features_.rustc_demangle."0.1.15" deps {}) }: buildRustCrate {
    crateName = "rustc-demangle";
    version = "0.1.15";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "04rgsfzhz4k9s56vkczsdbvmvg9409xp0nw4cy99lb2i0aa0255s";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."rustc_demangle"."0.1.15" or {});
  };
  features_.rustc_demangle."0.1.15" = deps: f: updateFeatures f (rec {
    rustc_demangle = fold recursiveUpdate {} [
      { "0.1.15".compiler_builtins =
        (f.rustc_demangle."0.1.15".compiler_builtins or false) ||
        (f.rustc_demangle."0.1.15".rustc-dep-of-std or false) ||
        (rustc_demangle."0.1.15"."rustc-dep-of-std" or false); }
      { "0.1.15".core =
        (f.rustc_demangle."0.1.15".core or false) ||
        (f.rustc_demangle."0.1.15".rustc-dep-of-std or false) ||
        (rustc_demangle."0.1.15"."rustc-dep-of-std" or false); }
      { "0.1.15".default = (f.rustc_demangle."0.1.15".default or true); }
    ];
  }) [];


# end
# rustc_version-0.2.3

  crates.rustc_version."0.2.3" = deps: { features?(features_.rustc_version."0.2.3" deps {}) }: buildRustCrate {
    crateName = "rustc_version";
    version = "0.2.3";
    authors = [ "Marvin Löbel <loebel.marvin@gmail.com>" ];
    sha256 = "0rgwzbgs3i9fqjm1p4ra3n7frafmpwl29c8lw85kv1rxn7n2zaa7";
    dependencies = mapFeatures features ([
      (crates."semver"."${deps."rustc_version"."0.2.3"."semver"}" deps)
    ]);
  };
  features_.rustc_version."0.2.3" = deps: f: updateFeatures f (rec {
    rustc_version."0.2.3".default = (f.rustc_version."0.2.3".default or true);
    semver."${deps.rustc_version."0.2.3".semver}".default = true;
  }) [
    (features_.semver."${deps."rustc_version"."0.2.3"."semver"}" deps)
  ];


# end
# rustls-0.13.1

  crates.rustls."0.13.1" = deps: { features?(features_.rustls."0.13.1" deps {}) }: buildRustCrate {
    crateName = "rustls";
    version = "0.13.1";
    authors = [ "Joseph Birr-Pixton <jpixton@gmail.com>" ];
    sha256 = "0rg18bk9pvpdjjjw4rlr5xq3rinwpkg4729z214ri99pbbjl3mql";
    dependencies = mapFeatures features ([
      (crates."base64"."${deps."rustls"."0.13.1"."base64"}" deps)
      (crates."ring"."${deps."rustls"."0.13.1"."ring"}" deps)
      (crates."sct"."${deps."rustls"."0.13.1"."sct"}" deps)
      (crates."untrusted"."${deps."rustls"."0.13.1"."untrusted"}" deps)
      (crates."webpki"."${deps."rustls"."0.13.1"."webpki"}" deps)
    ]
      ++ (if features.rustls."0.13.1".log or false then [ (crates.log."${deps."rustls"."0.13.1".log}" deps) ] else []));
    features = mkFeatures (features."rustls"."0.13.1" or {});
  };
  features_.rustls."0.13.1" = deps: f: updateFeatures f (rec {
    base64."${deps.rustls."0.13.1".base64}".default = true;
    log."${deps.rustls."0.13.1".log}".default = true;
    ring = fold recursiveUpdate {} [
      { "${deps.rustls."0.13.1".ring}"."rsa_signing" = true; }
      { "${deps.rustls."0.13.1".ring}".default = true; }
    ];
    rustls = fold recursiveUpdate {} [
      { "0.13.1".default = (f.rustls."0.13.1".default or true); }
      { "0.13.1".log =
        (f.rustls."0.13.1".log or false) ||
        (f.rustls."0.13.1".logging or false) ||
        (rustls."0.13.1"."logging" or false); }
      { "0.13.1".logging =
        (f.rustls."0.13.1".logging or false) ||
        (f.rustls."0.13.1".default or false) ||
        (rustls."0.13.1"."default" or false); }
    ];
    sct."${deps.rustls."0.13.1".sct}".default = true;
    untrusted."${deps.rustls."0.13.1".untrusted}".default = true;
    webpki."${deps.rustls."0.13.1".webpki}".default = true;
  }) [
    (features_.base64."${deps."rustls"."0.13.1"."base64"}" deps)
    (features_.log."${deps."rustls"."0.13.1"."log"}" deps)
    (features_.ring."${deps."rustls"."0.13.1"."ring"}" deps)
    (features_.sct."${deps."rustls"."0.13.1"."sct"}" deps)
    (features_.untrusted."${deps."rustls"."0.13.1"."untrusted"}" deps)
    (features_.webpki."${deps."rustls"."0.13.1"."webpki"}" deps)
  ];


# end
# safemem-0.3.0

  crates.safemem."0.3.0" = deps: { features?(features_.safemem."0.3.0" deps {}) }: buildRustCrate {
    crateName = "safemem";
    version = "0.3.0";
    authors = [ "Austin Bonander <austin.bonander@gmail.com>" ];
    sha256 = "0pr39b468d05f6m7m4alsngmj5p7an8df21apsxbi57k0lmwrr18";
    features = mkFeatures (features."safemem"."0.3.0" or {});
  };
  features_.safemem."0.3.0" = deps: f: updateFeatures f (rec {
    safemem = fold recursiveUpdate {} [
      { "0.3.0".default = (f.safemem."0.3.0".default or true); }
      { "0.3.0".std =
        (f.safemem."0.3.0".std or false) ||
        (f.safemem."0.3.0".default or false) ||
        (safemem."0.3.0"."default" or false); }
    ];
  }) [];


# end
# scoped_threadpool-0.1.9

  crates.scoped_threadpool."0.1.9" = deps: { features?(features_.scoped_threadpool."0.1.9" deps {}) }: buildRustCrate {
    crateName = "scoped_threadpool";
    version = "0.1.9";
    authors = [ "Marvin Löbel <loebel.marvin@gmail.com>" ];
    sha256 = "1arqj2skcfr46s1lcyvnlmfr5456kg5nhn8k90xyfjnxkp5yga2v";
    features = mkFeatures (features."scoped_threadpool"."0.1.9" or {});
  };
  features_.scoped_threadpool."0.1.9" = deps: f: updateFeatures f (rec {
    scoped_threadpool."0.1.9".default = (f.scoped_threadpool."0.1.9".default or true);
  }) [];


# end
# sct-0.4.0

  crates.sct."0.4.0" = deps: { features?(features_.sct."0.4.0" deps {}) }: buildRustCrate {
    crateName = "sct";
    version = "0.4.0";
    authors = [ "Joseph Birr-Pixton <jpixton@gmail.com>" ];
    sha256 = "0cl6lsy7hp42a5hxdmd1fb09wq10bx668f2zjnwqyjzmfl7v3d5g";
    dependencies = mapFeatures features ([
      (crates."ring"."${deps."sct"."0.4.0"."ring"}" deps)
      (crates."untrusted"."${deps."sct"."0.4.0"."untrusted"}" deps)
    ]);
  };
  features_.sct."0.4.0" = deps: f: updateFeatures f (rec {
    ring."${deps.sct."0.4.0".ring}".default = true;
    sct."0.4.0".default = (f.sct."0.4.0".default or true);
    untrusted."${deps.sct."0.4.0".untrusted}".default = true;
  }) [
    (features_.ring."${deps."sct"."0.4.0"."ring"}" deps)
    (features_.untrusted."${deps."sct"."0.4.0"."untrusted"}" deps)
  ];


# end
# semver-0.9.0

  crates.semver."0.9.0" = deps: { features?(features_.semver."0.9.0" deps {}) }: buildRustCrate {
    crateName = "semver";
    version = "0.9.0";
    authors = [ "Steve Klabnik <steve@steveklabnik.com>" "The Rust Project Developers" ];
    sha256 = "0azak2lb2wc36s3x15az886kck7rpnksrw14lalm157rg9sc9z63";
    dependencies = mapFeatures features ([
      (crates."semver_parser"."${deps."semver"."0.9.0"."semver_parser"}" deps)
    ]);
    features = mkFeatures (features."semver"."0.9.0" or {});
  };
  features_.semver."0.9.0" = deps: f: updateFeatures f (rec {
    semver = fold recursiveUpdate {} [
      { "0.9.0".default = (f.semver."0.9.0".default or true); }
      { "0.9.0".serde =
        (f.semver."0.9.0".serde or false) ||
        (f.semver."0.9.0".ci or false) ||
        (semver."0.9.0"."ci" or false); }
    ];
    semver_parser."${deps.semver."0.9.0".semver_parser}".default = true;
  }) [
    (features_.semver_parser."${deps."semver"."0.9.0"."semver_parser"}" deps)
  ];


# end
# semver-parser-0.7.0

  crates.semver_parser."0.7.0" = deps: { features?(features_.semver_parser."0.7.0" deps {}) }: buildRustCrate {
    crateName = "semver-parser";
    version = "0.7.0";
    authors = [ "Steve Klabnik <steve@steveklabnik.com>" ];
    sha256 = "1da66c8413yakx0y15k8c055yna5lyb6fr0fw9318kdwkrk5k12h";
  };
  features_.semver_parser."0.7.0" = deps: f: updateFeatures f (rec {
    semver_parser."0.7.0".default = (f.semver_parser."0.7.0".default or true);
  }) [];


# end
# serde-1.0.92

  crates.serde."1.0.92" = deps: { features?(features_.serde."1.0.92" deps {}) }: buildRustCrate {
    crateName = "serde";
    version = "1.0.92";
    authors = [ "Erick Tryzelaar <erick.tryzelaar@gmail.com>" "David Tolnay <dtolnay@gmail.com>" ];
    sha256 = "0h8mpx249fs4vcwi7dvl6jxqv7b1dxpnjbhkz6b58vxn6p0dzgbj";
    build = "build.rs";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."serde"."1.0.92" or {});
  };
  features_.serde."1.0.92" = deps: f: updateFeatures f (rec {
    serde = fold recursiveUpdate {} [
      { "1.0.92".default = (f.serde."1.0.92".default or true); }
      { "1.0.92".serde_derive =
        (f.serde."1.0.92".serde_derive or false) ||
        (f.serde."1.0.92".derive or false) ||
        (serde."1.0.92"."derive" or false); }
      { "1.0.92".std =
        (f.serde."1.0.92".std or false) ||
        (f.serde."1.0.92".default or false) ||
        (serde."1.0.92"."default" or false); }
      { "1.0.92".unstable =
        (f.serde."1.0.92".unstable or false) ||
        (f.serde."1.0.92".alloc or false) ||
        (serde."1.0.92"."alloc" or false); }
    ];
  }) [];


# end
# serde_derive-1.0.92

  crates.serde_derive."1.0.92" = deps: { features?(features_.serde_derive."1.0.92" deps {}) }: buildRustCrate {
    crateName = "serde_derive";
    version = "1.0.92";
    authors = [ "Erick Tryzelaar <erick.tryzelaar@gmail.com>" "David Tolnay <dtolnay@gmail.com>" ];
    sha256 = "0c9a6h88b57kzhnngmd2zx87miysz9mxb137m9nl8l0gaqz15wkv";
    procMacro = true;
    dependencies = mapFeatures features ([
      (crates."proc_macro2"."${deps."serde_derive"."1.0.92"."proc_macro2"}" deps)
      (crates."quote"."${deps."serde_derive"."1.0.92"."quote"}" deps)
      (crates."syn"."${deps."serde_derive"."1.0.92"."syn"}" deps)
    ]);
    features = mkFeatures (features."serde_derive"."1.0.92" or {});
  };
  features_.serde_derive."1.0.92" = deps: f: updateFeatures f (rec {
    proc_macro2."${deps.serde_derive."1.0.92".proc_macro2}".default = true;
    quote."${deps.serde_derive."1.0.92".quote}".default = true;
    serde_derive."1.0.92".default = (f.serde_derive."1.0.92".default or true);
    syn = fold recursiveUpdate {} [
      { "${deps.serde_derive."1.0.92".syn}"."visit" = true; }
      { "${deps.serde_derive."1.0.92".syn}".default = true; }
    ];
  }) [
    (features_.proc_macro2."${deps."serde_derive"."1.0.92"."proc_macro2"}" deps)
    (features_.quote."${deps."serde_derive"."1.0.92"."quote"}" deps)
    (features_.syn."${deps."serde_derive"."1.0.92"."syn"}" deps)
  ];


# end
# sha3-0.8.2

  crates.sha3."0.8.2" = deps: { features?(features_.sha3."0.8.2" deps {}) }: buildRustCrate {
    crateName = "sha3";
    version = "0.8.2";
    authors = [ "RustCrypto Developers" ];
    sha256 = "1ffswq6z8pb38501jqf8fcaasgdg89ksgag721kmn4yyc7riv2l5";
    dependencies = mapFeatures features ([
      (crates."block_buffer"."${deps."sha3"."0.8.2"."block_buffer"}" deps)
      (crates."byte_tools"."${deps."sha3"."0.8.2"."byte_tools"}" deps)
      (crates."digest"."${deps."sha3"."0.8.2"."digest"}" deps)
      (crates."keccak"."${deps."sha3"."0.8.2"."keccak"}" deps)
      (crates."opaque_debug"."${deps."sha3"."0.8.2"."opaque_debug"}" deps)
    ]);
    features = mkFeatures (features."sha3"."0.8.2" or {});
  };
  features_.sha3."0.8.2" = deps: f: updateFeatures f (rec {
    block_buffer."${deps.sha3."0.8.2".block_buffer}".default = true;
    byte_tools."${deps.sha3."0.8.2".byte_tools}".default = true;
    digest = fold recursiveUpdate {} [
      { "${deps.sha3."0.8.2".digest}"."std" =
        (f.digest."${deps.sha3."0.8.2".digest}"."std" or false) ||
        (sha3."0.8.2"."std" or false) ||
        (f."sha3"."0.8.2"."std" or false); }
      { "${deps.sha3."0.8.2".digest}".default = true; }
    ];
    keccak."${deps.sha3."0.8.2".keccak}".default = true;
    opaque_debug."${deps.sha3."0.8.2".opaque_debug}".default = true;
    sha3 = fold recursiveUpdate {} [
      { "0.8.2".default = (f.sha3."0.8.2".default or true); }
      { "0.8.2".std =
        (f.sha3."0.8.2".std or false) ||
        (f.sha3."0.8.2".default or false) ||
        (sha3."0.8.2"."default" or false); }
    ];
  }) [
    (features_.block_buffer."${deps."sha3"."0.8.2"."block_buffer"}" deps)
    (features_.byte_tools."${deps."sha3"."0.8.2"."byte_tools"}" deps)
    (features_.digest."${deps."sha3"."0.8.2"."digest"}" deps)
    (features_.keccak."${deps."sha3"."0.8.2"."keccak"}" deps)
    (features_.opaque_debug."${deps."sha3"."0.8.2"."opaque_debug"}" deps)
  ];


# end
# smallvec-0.6.10

  crates.smallvec."0.6.10" = deps: { features?(features_.smallvec."0.6.10" deps {}) }: buildRustCrate {
    crateName = "smallvec";
    version = "0.6.10";
    authors = [ "Simon Sapin <simon.sapin@exyr.org>" ];
    sha256 = "01w7xd79q0bwn683gk4ryw50ad1zzxkny10f7gkbaaj1ax6f4q4h";
    libPath = "lib.rs";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."smallvec"."0.6.10" or {});
  };
  features_.smallvec."0.6.10" = deps: f: updateFeatures f (rec {
    smallvec = fold recursiveUpdate {} [
      { "0.6.10".default = (f.smallvec."0.6.10".default or true); }
      { "0.6.10".std =
        (f.smallvec."0.6.10".std or false) ||
        (f.smallvec."0.6.10".default or false) ||
        (smallvec."0.6.10"."default" or false); }
    ];
  }) [];


# end
# syn-0.15.36

  crates.syn."0.15.36" = deps: { features?(features_.syn."0.15.36" deps {}) }: buildRustCrate {
    crateName = "syn";
    version = "0.15.36";
    authors = [ "David Tolnay <dtolnay@gmail.com>" ];
    sha256 = "0brimxqpqwhrw78rkz4k1ba1wv2cyk3nj5v37kn1m5pcn6nlmrsx";
    dependencies = mapFeatures features ([
      (crates."proc_macro2"."${deps."syn"."0.15.36"."proc_macro2"}" deps)
      (crates."unicode_xid"."${deps."syn"."0.15.36"."unicode_xid"}" deps)
    ]
      ++ (if features.syn."0.15.36".quote or false then [ (crates.quote."${deps."syn"."0.15.36".quote}" deps) ] else []));
    features = mkFeatures (features."syn"."0.15.36" or {});
  };
  features_.syn."0.15.36" = deps: f: updateFeatures f (rec {
    proc_macro2 = fold recursiveUpdate {} [
      { "${deps.syn."0.15.36".proc_macro2}"."proc-macro" =
        (f.proc_macro2."${deps.syn."0.15.36".proc_macro2}"."proc-macro" or false) ||
        (syn."0.15.36"."proc-macro" or false) ||
        (f."syn"."0.15.36"."proc-macro" or false); }
      { "${deps.syn."0.15.36".proc_macro2}".default = (f.proc_macro2."${deps.syn."0.15.36".proc_macro2}".default or false); }
    ];
    quote = fold recursiveUpdate {} [
      { "${deps.syn."0.15.36".quote}"."proc-macro" =
        (f.quote."${deps.syn."0.15.36".quote}"."proc-macro" or false) ||
        (syn."0.15.36"."proc-macro" or false) ||
        (f."syn"."0.15.36"."proc-macro" or false); }
      { "${deps.syn."0.15.36".quote}".default = (f.quote."${deps.syn."0.15.36".quote}".default or false); }
    ];
    syn = fold recursiveUpdate {} [
      { "0.15.36".clone-impls =
        (f.syn."0.15.36".clone-impls or false) ||
        (f.syn."0.15.36".default or false) ||
        (syn."0.15.36"."default" or false); }
      { "0.15.36".default = (f.syn."0.15.36".default or true); }
      { "0.15.36".derive =
        (f.syn."0.15.36".derive or false) ||
        (f.syn."0.15.36".default or false) ||
        (syn."0.15.36"."default" or false); }
      { "0.15.36".parsing =
        (f.syn."0.15.36".parsing or false) ||
        (f.syn."0.15.36".default or false) ||
        (syn."0.15.36"."default" or false); }
      { "0.15.36".printing =
        (f.syn."0.15.36".printing or false) ||
        (f.syn."0.15.36".default or false) ||
        (syn."0.15.36"."default" or false); }
      { "0.15.36".proc-macro =
        (f.syn."0.15.36".proc-macro or false) ||
        (f.syn."0.15.36".default or false) ||
        (syn."0.15.36"."default" or false); }
      { "0.15.36".quote =
        (f.syn."0.15.36".quote or false) ||
        (f.syn."0.15.36".printing or false) ||
        (syn."0.15.36"."printing" or false); }
    ];
    unicode_xid."${deps.syn."0.15.36".unicode_xid}".default = true;
  }) [
    (features_.proc_macro2."${deps."syn"."0.15.36"."proc_macro2"}" deps)
    (features_.quote."${deps."syn"."0.15.36"."quote"}" deps)
    (features_.unicode_xid."${deps."syn"."0.15.36"."unicode_xid"}" deps)
  ];


# end
# synstructure-0.10.2

  crates.synstructure."0.10.2" = deps: { features?(features_.synstructure."0.10.2" deps {}) }: buildRustCrate {
    crateName = "synstructure";
    version = "0.10.2";
    authors = [ "Nika Layzell <nika@thelayzells.com>" ];
    sha256 = "0bp29grjsim99xm1l6h38mbl98gnk47lf82rawlmws5zn4asdpj4";
    dependencies = mapFeatures features ([
      (crates."proc_macro2"."${deps."synstructure"."0.10.2"."proc_macro2"}" deps)
      (crates."quote"."${deps."synstructure"."0.10.2"."quote"}" deps)
      (crates."syn"."${deps."synstructure"."0.10.2"."syn"}" deps)
      (crates."unicode_xid"."${deps."synstructure"."0.10.2"."unicode_xid"}" deps)
    ]);
    features = mkFeatures (features."synstructure"."0.10.2" or {});
  };
  features_.synstructure."0.10.2" = deps: f: updateFeatures f (rec {
    proc_macro2."${deps.synstructure."0.10.2".proc_macro2}".default = true;
    quote."${deps.synstructure."0.10.2".quote}".default = true;
    syn = fold recursiveUpdate {} [
      { "${deps.synstructure."0.10.2".syn}"."extra-traits" = true; }
      { "${deps.synstructure."0.10.2".syn}"."visit" = true; }
      { "${deps.synstructure."0.10.2".syn}".default = true; }
    ];
    synstructure."0.10.2".default = (f.synstructure."0.10.2".default or true);
    unicode_xid."${deps.synstructure."0.10.2".unicode_xid}".default = true;
  }) [
    (features_.proc_macro2."${deps."synstructure"."0.10.2"."proc_macro2"}" deps)
    (features_.quote."${deps."synstructure"."0.10.2"."quote"}" deps)
    (features_.syn."${deps."synstructure"."0.10.2"."syn"}" deps)
    (features_.unicode_xid."${deps."synstructure"."0.10.2"."unicode_xid"}" deps)
  ];


# end
# tar-0.4.26

  crates.tar."0.4.26" = deps: { features?(features_.tar."0.4.26" deps {}) }: buildRustCrate {
    crateName = "tar";
    version = "0.4.26";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    edition = "2018";
    sha256 = "1rmv889ibi1zllqpib5ywa2gdqsx4qg2l9qxr7skk4j5spcsy7lp";
    dependencies = mapFeatures features ([
      (crates."filetime"."${deps."tar"."0.4.26"."filetime"}" deps)
    ])
      ++ (if kernel == "redox" then mapFeatures features ([
      (crates."redox_syscall"."${deps."tar"."0.4.26"."redox_syscall"}" deps)
    ]) else [])
      ++ (if (kernel == "linux" || kernel == "darwin") then mapFeatures features ([
      (crates."libc"."${deps."tar"."0.4.26"."libc"}" deps)
    ]
      ++ (if features.tar."0.4.26".xattr or false then [ (crates.xattr."${deps."tar"."0.4.26".xattr}" deps) ] else [])) else []);
    features = mkFeatures (features."tar"."0.4.26" or {});
  };
  features_.tar."0.4.26" = deps: f: updateFeatures f (rec {
    filetime."${deps.tar."0.4.26".filetime}".default = true;
    libc."${deps.tar."0.4.26".libc}".default = true;
    redox_syscall."${deps.tar."0.4.26".redox_syscall}".default = true;
    tar = fold recursiveUpdate {} [
      { "0.4.26".default = (f.tar."0.4.26".default or true); }
      { "0.4.26".xattr =
        (f.tar."0.4.26".xattr or false) ||
        (f.tar."0.4.26".default or false) ||
        (tar."0.4.26"."default" or false); }
    ];
    xattr."${deps.tar."0.4.26".xattr}".default = true;
  }) [
    (features_.filetime."${deps."tar"."0.4.26"."filetime"}" deps)
    (features_.redox_syscall."${deps."tar"."0.4.26"."redox_syscall"}" deps)
    (features_.libc."${deps."tar"."0.4.26"."libc"}" deps)
    (features_.xattr."${deps."tar"."0.4.26"."xattr"}" deps)
  ];


# end
# tempfile-3.0.8

  crates.tempfile."3.0.8" = deps: { features?(features_.tempfile."3.0.8" deps {}) }: buildRustCrate {
    crateName = "tempfile";
    version = "3.0.8";
    authors = [ "Steven Allen <steven@stebalien.com>" "The Rust Project Developers" "Ashley Mannix <ashleymannix@live.com.au>" "Jason White <jasonaw0@gmail.com>" ];
    sha256 = "0v16b7ksfrbll0kxx8m761rp39qfq44f36z1jpiw036znx9cis8s";
    dependencies = mapFeatures features ([
      (crates."cfg_if"."${deps."tempfile"."3.0.8"."cfg_if"}" deps)
      (crates."rand"."${deps."tempfile"."3.0.8"."rand"}" deps)
      (crates."remove_dir_all"."${deps."tempfile"."3.0.8"."remove_dir_all"}" deps)
    ])
      ++ (if kernel == "redox" then mapFeatures features ([
      (crates."redox_syscall"."${deps."tempfile"."3.0.8"."redox_syscall"}" deps)
    ]) else [])
      ++ (if (kernel == "linux" || kernel == "darwin") then mapFeatures features ([
      (crates."libc"."${deps."tempfile"."3.0.8"."libc"}" deps)
    ]) else [])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."tempfile"."3.0.8"."winapi"}" deps)
    ]) else []);
  };
  features_.tempfile."3.0.8" = deps: f: updateFeatures f (rec {
    cfg_if."${deps.tempfile."3.0.8".cfg_if}".default = true;
    libc."${deps.tempfile."3.0.8".libc}".default = true;
    rand."${deps.tempfile."3.0.8".rand}".default = true;
    redox_syscall."${deps.tempfile."3.0.8".redox_syscall}".default = true;
    remove_dir_all."${deps.tempfile."3.0.8".remove_dir_all}".default = true;
    tempfile."3.0.8".default = (f.tempfile."3.0.8".default or true);
    winapi = fold recursiveUpdate {} [
      { "${deps.tempfile."3.0.8".winapi}"."fileapi" = true; }
      { "${deps.tempfile."3.0.8".winapi}"."handleapi" = true; }
      { "${deps.tempfile."3.0.8".winapi}"."winbase" = true; }
      { "${deps.tempfile."3.0.8".winapi}".default = true; }
    ];
  }) [
    (features_.cfg_if."${deps."tempfile"."3.0.8"."cfg_if"}" deps)
    (features_.rand."${deps."tempfile"."3.0.8"."rand"}" deps)
    (features_.remove_dir_all."${deps."tempfile"."3.0.8"."remove_dir_all"}" deps)
    (features_.redox_syscall."${deps."tempfile"."3.0.8"."redox_syscall"}" deps)
    (features_.libc."${deps."tempfile"."3.0.8"."libc"}" deps)
    (features_.winapi."${deps."tempfile"."3.0.8"."winapi"}" deps)
  ];


# end
# termion-1.5.3

  crates.termion."1.5.3" = deps: { features?(features_.termion."1.5.3" deps {}) }: buildRustCrate {
    crateName = "termion";
    version = "1.5.3";
    authors = [ "ticki <Ticki@users.noreply.github.com>" "gycos <alexandre.bury@gmail.com>" "IGI-111 <igi-111@protonmail.com>" ];
    sha256 = "0l47ppblj8d97ch100100w9fbv47c3fhnqxbvsajcz2pj7ci414k";
    dependencies = mapFeatures features ([
      (crates."numtoa"."${deps."termion"."1.5.3"."numtoa"}" deps)
    ])
      ++ (if !(kernel == "redox") then mapFeatures features ([
      (crates."libc"."${deps."termion"."1.5.3"."libc"}" deps)
    ]) else [])
      ++ (if kernel == "redox" then mapFeatures features ([
      (crates."redox_syscall"."${deps."termion"."1.5.3"."redox_syscall"}" deps)
      (crates."redox_termios"."${deps."termion"."1.5.3"."redox_termios"}" deps)
    ]) else []);
  };
  features_.termion."1.5.3" = deps: f: updateFeatures f (rec {
    libc."${deps.termion."1.5.3".libc}".default = true;
    numtoa = fold recursiveUpdate {} [
      { "${deps.termion."1.5.3".numtoa}"."std" = true; }
      { "${deps.termion."1.5.3".numtoa}".default = true; }
    ];
    redox_syscall."${deps.termion."1.5.3".redox_syscall}".default = true;
    redox_termios."${deps.termion."1.5.3".redox_termios}".default = true;
    termion."1.5.3".default = (f.termion."1.5.3".default or true);
  }) [
    (features_.numtoa."${deps."termion"."1.5.3"."numtoa"}" deps)
    (features_.libc."${deps."termion"."1.5.3"."libc"}" deps)
    (features_.redox_syscall."${deps."termion"."1.5.3"."redox_syscall"}" deps)
    (features_.redox_termios."${deps."termion"."1.5.3"."redox_termios"}" deps)
  ];


# end
# textwrap-0.11.0

  crates.textwrap."0.11.0" = deps: { features?(features_.textwrap."0.11.0" deps {}) }: buildRustCrate {
    crateName = "textwrap";
    version = "0.11.0";
    authors = [ "Martin Geisler <martin@geisler.net>" ];
    sha256 = "0s25qh49n7kjayrdj4q3v0jk0jc6vy88rdw0bvgfxqlscpqpxi7d";
    dependencies = mapFeatures features ([
      (crates."unicode_width"."${deps."textwrap"."0.11.0"."unicode_width"}" deps)
    ]);
  };
  features_.textwrap."0.11.0" = deps: f: updateFeatures f (rec {
    textwrap."0.11.0".default = (f.textwrap."0.11.0".default or true);
    unicode_width."${deps.textwrap."0.11.0".unicode_width}".default = true;
  }) [
    (features_.unicode_width."${deps."textwrap"."0.11.0"."unicode_width"}" deps)
  ];


# end
# thread-scoped-1.0.2

  crates.thread_scoped."1.0.2" = deps: { features?(features_.thread_scoped."1.0.2" deps {}) }: buildRustCrate {
    crateName = "thread-scoped";
    version = "1.0.2";
    authors = [ "arcnmx" "The Rust Project Developers" ];
    sha256 = "0wfqc78j363rpwwlwy578mgarb7dpl8h562qf8igxk9qinyw9w0v";
  };
  features_.thread_scoped."1.0.2" = deps: f: updateFeatures f (rec {
    thread_scoped."1.0.2".default = (f.thread_scoped."1.0.2".default or true);
  }) [];


# end
# time-0.1.42

  crates.time."0.1.42" = deps: { features?(features_.time."0.1.42" deps {}) }: buildRustCrate {
    crateName = "time";
    version = "0.1.42";
    authors = [ "The Rust Project Developers" ];
    sha256 = "1ny809kmdjwd4b478ipc33dz7q6nq7rxk766x8cnrg6zygcksmmx";
    dependencies = mapFeatures features ([
      (crates."libc"."${deps."time"."0.1.42"."libc"}" deps)
    ])
      ++ (if kernel == "redox" then mapFeatures features ([
      (crates."redox_syscall"."${deps."time"."0.1.42"."redox_syscall"}" deps)
    ]) else [])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."time"."0.1.42"."winapi"}" deps)
    ]) else []);
  };
  features_.time."0.1.42" = deps: f: updateFeatures f (rec {
    libc."${deps.time."0.1.42".libc}".default = true;
    redox_syscall."${deps.time."0.1.42".redox_syscall}".default = true;
    time."0.1.42".default = (f.time."0.1.42".default or true);
    winapi = fold recursiveUpdate {} [
      { "${deps.time."0.1.42".winapi}"."minwinbase" = true; }
      { "${deps.time."0.1.42".winapi}"."minwindef" = true; }
      { "${deps.time."0.1.42".winapi}"."ntdef" = true; }
      { "${deps.time."0.1.42".winapi}"."profileapi" = true; }
      { "${deps.time."0.1.42".winapi}"."std" = true; }
      { "${deps.time."0.1.42".winapi}"."sysinfoapi" = true; }
      { "${deps.time."0.1.42".winapi}"."timezoneapi" = true; }
      { "${deps.time."0.1.42".winapi}".default = true; }
    ];
  }) [
    (features_.libc."${deps."time"."0.1.42"."libc"}" deps)
    (features_.redox_syscall."${deps."time"."0.1.42"."redox_syscall"}" deps)
    (features_.winapi."${deps."time"."0.1.42"."winapi"}" deps)
  ];


# end
# toml-0.4.10

  crates.toml."0.4.10" = deps: { features?(features_.toml."0.4.10" deps {}) }: buildRustCrate {
    crateName = "toml";
    version = "0.4.10";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "0fs4kxl86w3kmgwcgcv23nk79zagayz1spg281r83w0ywf88d6f1";
    dependencies = mapFeatures features ([
      (crates."serde"."${deps."toml"."0.4.10"."serde"}" deps)
    ]);
  };
  features_.toml."0.4.10" = deps: f: updateFeatures f (rec {
    serde."${deps.toml."0.4.10".serde}".default = true;
    toml."0.4.10".default = (f.toml."0.4.10".default or true);
  }) [
    (features_.serde."${deps."toml"."0.4.10"."serde"}" deps)
  ];


# end
# toml-0.5.1

  crates.toml."0.5.1" = deps: { features?(features_.toml."0.5.1" deps {}) }: buildRustCrate {
    crateName = "toml";
    version = "0.5.1";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    edition = "2018";
    sha256 = "1878ifdh576viwqg80vnhm51bng96vhyfi20jk8fv6wcifhgl4dg";
    dependencies = mapFeatures features ([
      (crates."serde"."${deps."toml"."0.5.1"."serde"}" deps)
    ]);
    features = mkFeatures (features."toml"."0.5.1" or {});
  };
  features_.toml."0.5.1" = deps: f: updateFeatures f (rec {
    serde."${deps.toml."0.5.1".serde}".default = true;
    toml = fold recursiveUpdate {} [
      { "0.5.1".default = (f.toml."0.5.1".default or true); }
      { "0.5.1".linked-hash-map =
        (f.toml."0.5.1".linked-hash-map or false) ||
        (f.toml."0.5.1".preserve_order or false) ||
        (toml."0.5.1"."preserve_order" or false); }
    ];
  }) [
    (features_.serde."${deps."toml"."0.5.1"."serde"}" deps)
  ];


# end
# traitobject-0.1.0

  crates.traitobject."0.1.0" = deps: { features?(features_.traitobject."0.1.0" deps {}) }: buildRustCrate {
    crateName = "traitobject";
    version = "0.1.0";
    authors = [ "Jonathan Reem <jonathan.reem@gmail.com>" ];
    sha256 = "10hi8pl361l539g4kg74mcrhn7grmwlar4jl528ddn2z2jvb7lw3";
  };
  features_.traitobject."0.1.0" = deps: f: updateFeatures f (rec {
    traitobject."0.1.0".default = (f.traitobject."0.1.0".default or true);
  }) [];


# end
# typeable-0.1.2

  crates.typeable."0.1.2" = deps: { features?(features_.typeable."0.1.2" deps {}) }: buildRustCrate {
    crateName = "typeable";
    version = "0.1.2";
    authors = [ "Jonathan Reem <jonathan.reem@gmail.com>" ];
    sha256 = "0lvff10hwyy852m6r11msyv1rpgpnapn284i8dk0p0q5saqvbvnx";
  };
  features_.typeable."0.1.2" = deps: f: updateFeatures f (rec {
    typeable."0.1.2".default = (f.typeable."0.1.2".default or true);
  }) [];


# end
# typenum-1.10.0

  crates.typenum."1.10.0" = deps: { features?(features_.typenum."1.10.0" deps {}) }: buildRustCrate {
    crateName = "typenum";
    version = "1.10.0";
    authors = [ "Paho Lurie-Gregg <paho@paholg.com>" "Andre Bogus <bogusandre@gmail.com>" ];
    sha256 = "1v2cgg0mlzkg5prs7swysckgk2ay6bpda8m83c2sn3z77dcsx3bc";
    build = "build/main.rs";
    features = mkFeatures (features."typenum"."1.10.0" or {});
  };
  features_.typenum."1.10.0" = deps: f: updateFeatures f (rec {
    typenum."1.10.0".default = (f.typenum."1.10.0".default or true);
  }) [];


# end
# unicase-1.4.2

  crates.unicase."1.4.2" = deps: { features?(features_.unicase."1.4.2" deps {}) }: buildRustCrate {
    crateName = "unicase";
    version = "1.4.2";
    authors = [ "Sean McArthur <sean.monstar@gmail.com>" ];
    sha256 = "0rbnhw2mnhcwrij3vczp0sl8zdfmvf2dlh8hly81kj7132kfj0mf";
    build = "build.rs";
    dependencies = mapFeatures features ([
]);

    buildDependencies = mapFeatures features ([
      (crates."version_check"."${deps."unicase"."1.4.2"."version_check"}" deps)
    ]);
    features = mkFeatures (features."unicase"."1.4.2" or {});
  };
  features_.unicase."1.4.2" = deps: f: updateFeatures f (rec {
    unicase = fold recursiveUpdate {} [
      { "1.4.2".default = (f.unicase."1.4.2".default or true); }
      { "1.4.2".heapsize =
        (f.unicase."1.4.2".heapsize or false) ||
        (f.unicase."1.4.2".heap_size or false) ||
        (unicase."1.4.2"."heap_size" or false); }
      { "1.4.2".heapsize_plugin =
        (f.unicase."1.4.2".heapsize_plugin or false) ||
        (f.unicase."1.4.2".heap_size or false) ||
        (unicase."1.4.2"."heap_size" or false); }
    ];
    version_check."${deps.unicase."1.4.2".version_check}".default = true;
  }) [
    (features_.version_check."${deps."unicase"."1.4.2"."version_check"}" deps)
  ];


# end
# unicode-bidi-0.3.4

  crates.unicode_bidi."0.3.4" = deps: { features?(features_.unicode_bidi."0.3.4" deps {}) }: buildRustCrate {
    crateName = "unicode-bidi";
    version = "0.3.4";
    authors = [ "The Servo Project Developers" ];
    sha256 = "0lcd6jasrf8p9p0q20qyf10c6xhvw40m2c4rr105hbk6zy26nj1q";
    libName = "unicode_bidi";
    dependencies = mapFeatures features ([
      (crates."matches"."${deps."unicode_bidi"."0.3.4"."matches"}" deps)
    ]);
    features = mkFeatures (features."unicode_bidi"."0.3.4" or {});
  };
  features_.unicode_bidi."0.3.4" = deps: f: updateFeatures f (rec {
    matches."${deps.unicode_bidi."0.3.4".matches}".default = true;
    unicode_bidi = fold recursiveUpdate {} [
      { "0.3.4".default = (f.unicode_bidi."0.3.4".default or true); }
      { "0.3.4".flame =
        (f.unicode_bidi."0.3.4".flame or false) ||
        (f.unicode_bidi."0.3.4".flame_it or false) ||
        (unicode_bidi."0.3.4"."flame_it" or false); }
      { "0.3.4".flamer =
        (f.unicode_bidi."0.3.4".flamer or false) ||
        (f.unicode_bidi."0.3.4".flame_it or false) ||
        (unicode_bidi."0.3.4"."flame_it" or false); }
      { "0.3.4".serde =
        (f.unicode_bidi."0.3.4".serde or false) ||
        (f.unicode_bidi."0.3.4".with_serde or false) ||
        (unicode_bidi."0.3.4"."with_serde" or false); }
    ];
  }) [
    (features_.matches."${deps."unicode_bidi"."0.3.4"."matches"}" deps)
  ];


# end
# unicode-normalization-0.1.8

  crates.unicode_normalization."0.1.8" = deps: { features?(features_.unicode_normalization."0.1.8" deps {}) }: buildRustCrate {
    crateName = "unicode-normalization";
    version = "0.1.8";
    authors = [ "kwantam <kwantam@gmail.com>" ];
    sha256 = "1pb26i2xd5zz0icabyqahikpca0iwj2jd4145pczc4bb7p641dsz";
    dependencies = mapFeatures features ([
      (crates."smallvec"."${deps."unicode_normalization"."0.1.8"."smallvec"}" deps)
    ]);
  };
  features_.unicode_normalization."0.1.8" = deps: f: updateFeatures f (rec {
    smallvec."${deps.unicode_normalization."0.1.8".smallvec}".default = true;
    unicode_normalization."0.1.8".default = (f.unicode_normalization."0.1.8".default or true);
  }) [
    (features_.smallvec."${deps."unicode_normalization"."0.1.8"."smallvec"}" deps)
  ];


# end
# unicode-width-0.1.5

  crates.unicode_width."0.1.5" = deps: { features?(features_.unicode_width."0.1.5" deps {}) }: buildRustCrate {
    crateName = "unicode-width";
    version = "0.1.5";
    authors = [ "kwantam <kwantam@gmail.com>" ];
    sha256 = "0886lc2aymwgy0lhavwn6s48ik3c61ykzzd3za6prgnw51j7bi4w";
    features = mkFeatures (features."unicode_width"."0.1.5" or {});
  };
  features_.unicode_width."0.1.5" = deps: f: updateFeatures f (rec {
    unicode_width."0.1.5".default = (f.unicode_width."0.1.5".default or true);
  }) [];


# end
# unicode-xid-0.1.0

  crates.unicode_xid."0.1.0" = deps: { features?(features_.unicode_xid."0.1.0" deps {}) }: buildRustCrate {
    crateName = "unicode-xid";
    version = "0.1.0";
    authors = [ "erick.tryzelaar <erick.tryzelaar@gmail.com>" "kwantam <kwantam@gmail.com>" ];
    sha256 = "05wdmwlfzxhq3nhsxn6wx4q8dhxzzfb9szsz6wiw092m1rjj01zj";
    features = mkFeatures (features."unicode_xid"."0.1.0" or {});
  };
  features_.unicode_xid."0.1.0" = deps: f: updateFeatures f (rec {
    unicode_xid."0.1.0".default = (f.unicode_xid."0.1.0".default or true);
  }) [];


# end
# untrusted-0.6.2

  crates.untrusted."0.6.2" = deps: { features?(features_.untrusted."0.6.2" deps {}) }: buildRustCrate {
    crateName = "untrusted";
    version = "0.6.2";
    authors = [ "Brian Smith <brian@briansmith.org>" ];
    sha256 = "189ir1h2xgb290bhjchwczr9ygia1f3ipsydf6pwnnb95lb8fihg";
    libPath = "src/untrusted.rs";
  };
  features_.untrusted."0.6.2" = deps: f: updateFeatures f (rec {
    untrusted."0.6.2".default = (f.untrusted."0.6.2".default or true);
  }) [];


# end
# url-1.7.2

  crates.url."1.7.2" = deps: { features?(features_.url."1.7.2" deps {}) }: buildRustCrate {
    crateName = "url";
    version = "1.7.2";
    authors = [ "The rust-url developers" ];
    sha256 = "0qzrjzd9r1niv7037x4cgnv98fs1vj0k18lpxx890ipc47x5gc09";
    dependencies = mapFeatures features ([
      (crates."idna"."${deps."url"."1.7.2"."idna"}" deps)
      (crates."matches"."${deps."url"."1.7.2"."matches"}" deps)
      (crates."percent_encoding"."${deps."url"."1.7.2"."percent_encoding"}" deps)
    ]);
    features = mkFeatures (features."url"."1.7.2" or {});
  };
  features_.url."1.7.2" = deps: f: updateFeatures f (rec {
    idna."${deps.url."1.7.2".idna}".default = true;
    matches."${deps.url."1.7.2".matches}".default = true;
    percent_encoding."${deps.url."1.7.2".percent_encoding}".default = true;
    url = fold recursiveUpdate {} [
      { "1.7.2".default = (f.url."1.7.2".default or true); }
      { "1.7.2".encoding =
        (f.url."1.7.2".encoding or false) ||
        (f.url."1.7.2".query_encoding or false) ||
        (url."1.7.2"."query_encoding" or false); }
      { "1.7.2".heapsize =
        (f.url."1.7.2".heapsize or false) ||
        (f.url."1.7.2".heap_size or false) ||
        (url."1.7.2"."heap_size" or false); }
    ];
  }) [
    (features_.idna."${deps."url"."1.7.2"."idna"}" deps)
    (features_.matches."${deps."url"."1.7.2"."matches"}" deps)
    (features_.percent_encoding."${deps."url"."1.7.2"."percent_encoding"}" deps)
  ];


# end
# uuid-0.5.1

  crates.uuid."0.5.1" = deps: { features?(features_.uuid."0.5.1" deps {}) }: buildRustCrate {
    crateName = "uuid";
    version = "0.5.1";
    authors = [ "The Rust Project Developers" ];
    sha256 = "17d4csjmy7fa3ckrm40d3c3v411rw5d4400w756mcrzyw2pm1i2r";
    dependencies = mapFeatures features ([
    ]
      ++ (if features.uuid."0.5.1".rand or false then [ (crates.rand."${deps."uuid"."0.5.1".rand}" deps) ] else []));
    features = mkFeatures (features."uuid"."0.5.1" or {});
  };
  features_.uuid."0.5.1" = deps: f: updateFeatures f (rec {
    rand."${deps.uuid."0.5.1".rand}".default = true;
    uuid = fold recursiveUpdate {} [
      { "0.5.1".default = (f.uuid."0.5.1".default or true); }
      { "0.5.1".md5 =
        (f.uuid."0.5.1".md5 or false) ||
        (f.uuid."0.5.1".v3 or false) ||
        (uuid."0.5.1"."v3" or false); }
      { "0.5.1".rand =
        (f.uuid."0.5.1".rand or false) ||
        (f.uuid."0.5.1".v1 or false) ||
        (uuid."0.5.1"."v1" or false) ||
        (f.uuid."0.5.1".v4 or false) ||
        (uuid."0.5.1"."v4" or false); }
      { "0.5.1".sha1 =
        (f.uuid."0.5.1".sha1 or false) ||
        (f.uuid."0.5.1".v5 or false) ||
        (uuid."0.5.1"."v5" or false); }
    ];
  }) [
    (features_.rand."${deps."uuid"."0.5.1"."rand"}" deps)
  ];


# end
# version-compare-0.0.4

  crates.version_compare."0.0.4" = deps: { features?(features_.version_compare."0.0.4" deps {}) }: buildRustCrate {
    crateName = "version-compare";
    version = "0.0.4";
    authors = [ "timvisee <timvisee@gmail.com>" ];
    sha256 = "01f1md5byd9aqysv4qi6rqzfqbqgynps0jfb7pr2x932a9shz0r9";
    features = mkFeatures (features."version_compare"."0.0.4" or {});
  };
  features_.version_compare."0.0.4" = deps: f: updateFeatures f (rec {
    version_compare."0.0.4".default = (f.version_compare."0.0.4".default or true);
  }) [];


# end
# version_check-0.1.5

  crates.version_check."0.1.5" = deps: { features?(features_.version_check."0.1.5" deps {}) }: buildRustCrate {
    crateName = "version_check";
    version = "0.1.5";
    authors = [ "Sergio Benitez <sb@sergio.bz>" ];
    sha256 = "1yrx9xblmwbafw2firxyqbj8f771kkzfd24n3q7xgwiqyhi0y8qd";
  };
  features_.version_check."0.1.5" = deps: f: updateFeatures f (rec {
    version_check."0.1.5".default = (f.version_check."0.1.5".default or true);
  }) [];


# end
# webpki-0.18.1

  crates.webpki."0.18.1" = deps: { features?(features_.webpki."0.18.1" deps {}) }: buildRustCrate {
    crateName = "webpki";
    version = "0.18.1";
    authors = [ "Brian Smith <brian@briansmith.org>" ];
    sha256 = "1czigcq417s3chn9kijhdyjhfcniw1gxsdnvaglilwhijx0v78h3";
    libPath = "src/webpki.rs";
    dependencies = mapFeatures features ([
      (crates."ring"."${deps."webpki"."0.18.1"."ring"}" deps)
      (crates."untrusted"."${deps."webpki"."0.18.1"."untrusted"}" deps)
    ]);
    features = mkFeatures (features."webpki"."0.18.1" or {});
  };
  features_.webpki."0.18.1" = deps: f: updateFeatures f (rec {
    ring."${deps.webpki."0.18.1".ring}".default = true;
    untrusted."${deps.webpki."0.18.1".untrusted}".default = true;
    webpki = fold recursiveUpdate {} [
      { "0.18.1".default = (f.webpki."0.18.1".default or true); }
      { "0.18.1".std =
        (f.webpki."0.18.1".std or false) ||
        (f.webpki."0.18.1".default or false) ||
        (webpki."0.18.1"."default" or false) ||
        (f.webpki."0.18.1".trust_anchor_util or false) ||
        (webpki."0.18.1"."trust_anchor_util" or false); }
      { "0.18.1".trust_anchor_util =
        (f.webpki."0.18.1".trust_anchor_util or false) ||
        (f.webpki."0.18.1".default or false) ||
        (webpki."0.18.1"."default" or false); }
    ];
  }) [
    (features_.ring."${deps."webpki"."0.18.1"."ring"}" deps)
    (features_.untrusted."${deps."webpki"."0.18.1"."untrusted"}" deps)
  ];


# end
# webpki-roots-0.15.0

  crates.webpki_roots."0.15.0" = deps: { features?(features_.webpki_roots."0.15.0" deps {}) }: buildRustCrate {
    crateName = "webpki-roots";
    version = "0.15.0";
    authors = [ "Joseph Birr-Pixton <jpixton@gmail.com>" ];
    sha256 = "1c42v0jl8sh4hp1im5hgs9wwm0x8sd0kj4dynh21fvbylaw014ll";
    dependencies = mapFeatures features ([
      (crates."untrusted"."${deps."webpki_roots"."0.15.0"."untrusted"}" deps)
      (crates."webpki"."${deps."webpki_roots"."0.15.0"."webpki"}" deps)
    ]);
  };
  features_.webpki_roots."0.15.0" = deps: f: updateFeatures f (rec {
    untrusted."${deps.webpki_roots."0.15.0".untrusted}".default = true;
    webpki."${deps.webpki_roots."0.15.0".webpki}".default = true;
    webpki_roots."0.15.0".default = (f.webpki_roots."0.15.0".default or true);
  }) [
    (features_.untrusted."${deps."webpki_roots"."0.15.0"."untrusted"}" deps)
    (features_.webpki."${deps."webpki_roots"."0.15.0"."webpki"}" deps)
  ];


# end
# winapi-0.2.8

  crates.winapi."0.2.8" = deps: { features?(features_.winapi."0.2.8" deps {}) }: buildRustCrate {
    crateName = "winapi";
    version = "0.2.8";
    authors = [ "Peter Atashian <retep998@gmail.com>" ];
    sha256 = "0a45b58ywf12vb7gvj6h3j264nydynmzyqz8d8rqxsj6icqv82as";
  };
  features_.winapi."0.2.8" = deps: f: updateFeatures f (rec {
    winapi."0.2.8".default = (f.winapi."0.2.8".default or true);
  }) [];


# end
# winapi-0.3.7

  crates.winapi."0.3.7" = deps: { features?(features_.winapi."0.3.7" deps {}) }: buildRustCrate {
    crateName = "winapi";
    version = "0.3.7";
    authors = [ "Peter Atashian <retep998@gmail.com>" ];
    sha256 = "1k51gfkp0zqw7nj07y443mscs46icmdhld442s2073niap0kkdr8";
    build = "build.rs";
    dependencies = (if kernel == "i686-pc-windows-gnu" then mapFeatures features ([
      (crates."winapi_i686_pc_windows_gnu"."${deps."winapi"."0.3.7"."winapi_i686_pc_windows_gnu"}" deps)
    ]) else [])
      ++ (if kernel == "x86_64-pc-windows-gnu" then mapFeatures features ([
      (crates."winapi_x86_64_pc_windows_gnu"."${deps."winapi"."0.3.7"."winapi_x86_64_pc_windows_gnu"}" deps)
    ]) else []);
    features = mkFeatures (features."winapi"."0.3.7" or {});
  };
  features_.winapi."0.3.7" = deps: f: updateFeatures f (rec {
    winapi = fold recursiveUpdate {} [
      { "0.3.7".default = (f.winapi."0.3.7".default or true); }
      { "0.3.7".impl-debug =
        (f.winapi."0.3.7".impl-debug or false) ||
        (f.winapi."0.3.7".debug or false) ||
        (winapi."0.3.7"."debug" or false); }
    ];
    winapi_i686_pc_windows_gnu."${deps.winapi."0.3.7".winapi_i686_pc_windows_gnu}".default = true;
    winapi_x86_64_pc_windows_gnu."${deps.winapi."0.3.7".winapi_x86_64_pc_windows_gnu}".default = true;
  }) [
    (features_.winapi_i686_pc_windows_gnu."${deps."winapi"."0.3.7"."winapi_i686_pc_windows_gnu"}" deps)
    (features_.winapi_x86_64_pc_windows_gnu."${deps."winapi"."0.3.7"."winapi_x86_64_pc_windows_gnu"}" deps)
  ];


# end
# winapi-build-0.1.1

  crates.winapi_build."0.1.1" = deps: { features?(features_.winapi_build."0.1.1" deps {}) }: buildRustCrate {
    crateName = "winapi-build";
    version = "0.1.1";
    authors = [ "Peter Atashian <retep998@gmail.com>" ];
    sha256 = "1lxlpi87rkhxcwp2ykf1ldw3p108hwm24nywf3jfrvmff4rjhqga";
    libName = "build";
  };
  features_.winapi_build."0.1.1" = deps: f: updateFeatures f (rec {
    winapi_build."0.1.1".default = (f.winapi_build."0.1.1".default or true);
  }) [];


# end
# winapi-i686-pc-windows-gnu-0.4.0

  crates.winapi_i686_pc_windows_gnu."0.4.0" = deps: { features?(features_.winapi_i686_pc_windows_gnu."0.4.0" deps {}) }: buildRustCrate {
    crateName = "winapi-i686-pc-windows-gnu";
    version = "0.4.0";
    authors = [ "Peter Atashian <retep998@gmail.com>" ];
    sha256 = "05ihkij18r4gamjpxj4gra24514can762imjzlmak5wlzidplzrp";
    build = "build.rs";
  };
  features_.winapi_i686_pc_windows_gnu."0.4.0" = deps: f: updateFeatures f (rec {
    winapi_i686_pc_windows_gnu."0.4.0".default = (f.winapi_i686_pc_windows_gnu."0.4.0".default or true);
  }) [];


# end
# winapi-x86_64-pc-windows-gnu-0.4.0

  crates.winapi_x86_64_pc_windows_gnu."0.4.0" = deps: { features?(features_.winapi_x86_64_pc_windows_gnu."0.4.0" deps {}) }: buildRustCrate {
    crateName = "winapi-x86_64-pc-windows-gnu";
    version = "0.4.0";
    authors = [ "Peter Atashian <retep998@gmail.com>" ];
    sha256 = "0n1ylmlsb8yg1v583i4xy0qmqg42275flvbc51hdqjjfjcl9vlbj";
    build = "build.rs";
  };
  features_.winapi_x86_64_pc_windows_gnu."0.4.0" = deps: f: updateFeatures f (rec {
    winapi_x86_64_pc_windows_gnu."0.4.0".default = (f.winapi_x86_64_pc_windows_gnu."0.4.0".default or true);
  }) [];


# end
# xattr-0.2.2

  crates.xattr."0.2.2" = deps: { features?(features_.xattr."0.2.2" deps {}) }: buildRustCrate {
    crateName = "xattr";
    version = "0.2.2";
    authors = [ "Steven Allen <steven@stebalien.com>" ];
    sha256 = "01zqnn6bhrd58hvpj3y1nqnbmlswrvsdapn2zbi7h1bh5lspiyk5";
    dependencies = mapFeatures features ([
      (crates."libc"."${deps."xattr"."0.2.2"."libc"}" deps)
    ]);
    features = mkFeatures (features."xattr"."0.2.2" or {});
  };
  features_.xattr."0.2.2" = deps: f: updateFeatures f (rec {
    libc."${deps.xattr."0.2.2".libc}".default = true;
    xattr = fold recursiveUpdate {} [
      { "0.2.2".default = (f.xattr."0.2.2".default or true); }
      { "0.2.2".unsupported =
        (f.xattr."0.2.2".unsupported or false) ||
        (f.xattr."0.2.2".default or false) ||
        (xattr."0.2.2"."default" or false); }
    ];
  }) [
    (features_.libc."${deps."xattr"."0.2.2"."libc"}" deps)
  ];


# end
}

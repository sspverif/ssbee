# KEM-DEM
This project contains the formalization of a result by Cramer and Shoup in 
Domino which states that the composition of a CCA-secure Key Encapsulation 
Mechanism (KEM) with a CCA-secure Data Encapsulation Mechanism (DEM) yields a
CCA-secure public key encryption (PKE) scheme. This formalization uses the
State Separating Proofs (SSP) framework and closely resembles the proof of the 
same result in Section 4 of the work by [Bruzska, Delignat-Lavaud Fournet, Kohbrok, and Kohlweiss[1]](https://eprint.iacr.org/2018/306). Full breakdown and explanation
of this formalization along with a general tutorial of Domino
exists in the [Master's thesis of Amirhosein Rajabi at Aalto University](https://aaltodoc.aalto.fi/items/d68b77e6-3396-4728-9c05-88a9ca90398f).

There are two key differences with the proof introduced in [[1]](https://eprint.iacr.org/2018/306): (1) Stateless packages are used for the KEM and DEM schemes as well as the candidate PKE scheme. (2) Only DEM and key packages have the idealization bit while the original paper uses the idealization parameter for KEM and DEM packages.

## Project strucutre
The proof file `proofs/proof.ssp` contains the game definitions, hybrid games, and game hops to be verified by Domino. See the comments in the file for more explanation 
of the game hops.

## How to run the verification?
You need a working Rust installation as well as having cvc5 installed. 
Then, run `cargo run -p domino prove` at the 
root of a Domino project which includes `ssp.toml` file, e.g. this directory.
You will see 5 game hops are verified. (3 reductions and 2 code equivalences)
You can generate a LaTeX export of the composition diagrams and pseudocode of 
the packages by running `cargo run -p domino latex`. LaTeX files are generated in 
the current directory under `_build/latex`. The alternative way to run the verification is 
to install the Domino crate binaries and run Domino in any directory (not just in 
this repository). For this, run `cargo install --git https://github.com/domino-lang/domino domino` and then run `domino prove`. Use `--transcript` or `-t` option to generate 
the proof obligations in SMT-LIB language. This options outputs the SMT2 file before
feeding it into the SMT solver (cvc5). Domino generates an SMT2 file for 
each code equivalence game hop in the current directory under `_build/code_eq`.


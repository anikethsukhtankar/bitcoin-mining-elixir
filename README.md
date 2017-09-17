# Bitcoin Mining using Elixir COP5615 - Distributed Operating Systems Principles Project 1

Group Members : Shikha Mehta, Aniketh Sukhtankar (UF ID 7819 9584)

The goal of this project is to use Elixir and the actor model to build a good solution to the bitcoin mining problem that runs well on multi-core machines.


# Size of the work unit 

# Sample Output

The following output was generated for command ./project1 4

asukhtankarbweo0yjers   0000997c5f2ce5350e4f477f8a92241d13702ba5ceb0912d31cbb2b740e6bc83
asukhtankaro8jte89knr   00000931828e4579624bc583eee55c63818d209a173dfc77e8e63f69db6cdb17
asukhtankard6zc_v9l2t   00009c77fecec0f76a5907ef53759f727ba120792098498e1297987a179ec2d1
asukhtankar0z2c0nnyw5   000070e39a3f4d2b7554ed2dc2e6dc45621499d60cf9a0b5a5f18c86c07d2431
asukhtankaruhkmdgxs9_   000078b0df1c217cdcb76c5969ca454ef85b5a429bbf5ba7174a060829238a17
asukhtankarpywnupa1ul   0000c4bdf980944ee8592e2c79579679720e57ee8e9c2b5e4ada5d71a3a7a28b
asukhtankaraijtsbageg   000064049f55da51f1b35cef4f8db326c92c1e1bc2663855892c46b25daef300
asukhtankar0itj9gdbyz   00005db93076fec09d953588302e887895f21bdcefd89963ed34c82b49bacecb
asukhtankartu6aqps2dn   00006c2be60f1899ccb8f0331e6b5309b1dbd599bed3b9d59f5304d7b665f961
asukhtankarogx_gk6l_b   00008f3dedfd293af09c11abbad63a05056bafab6228f87d8b42149fc7d76f4b
asukhtankarhuf6gojawe   000016eaaf8bfd33434946fc919a593a5b29afe3ed10994458306f3ad957c7e9
asukhtankarxgnft2dkys   0000f78bb45ab01dfafb357a71b35e10b05f86ab51834114a39c376473e93868
asukhtankarnj8wd5sk2q   000068cc1184ae2d24d0db7fb8c0026b3ab8b239d4e42a1aed0b1d98886b268b

# Running Time

# Coin with most zeroes (7) : 

asukhtankarfvvgdssixg   000000036115cffa23dfb4a961224471cea9bdeba989893125e848e3bee98a51

# Largest number of working machines on which the code was run

The code was simultaneously run on 4 machines with one functioning as server and the other 3 as workers.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `bitcoinmining` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:bitcoinmining, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/bitcoinmining](https://hexdocs.pm/bitcoinmining).

